#!/usr/bin/env python3
"""Simulates crafting against the generated advancements and resolver math.

For random crafting grids (plain and condensed items mixed)
this evaluates which generated `recipe_crafted` advancements would fire, feeds
the resulting counters into the resolver expressions and checks that the
recipe result plus the resolver's changes is exactly the expected items.
"""

import json
import random
import re
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import generate_datapack as g  # noqa: E402

KIND_TIER = {"condensed": g.C, "super_condensed": g.S}


def parse_custom_data(snbt):
    """Parses the tiny SNBT subset used by the predicates: {ns:{key:"value",...}}."""
    inner = re.fullmatch(r"\{%s:\{(.*)\}\}" % g.NS, snbt).group(1)
    return dict(re.findall(r'(\w+):"([^"]*)"', inner))


def item_data(item, tier):
    if tier == 0:
        return {"id": g.mc(item), "cd": {}}
    return {"id": g.mc(item), "cd": {"group": "condensed", "tier": g.TIER_KIND[tier], "item": item}}


def predicate_matches(pred, stack):
    if stack is None or pred["items"] != stack["id"]:
        return False
    expected = parse_custom_data(pred["predicates"]["minecraft:custom_data"]) if "predicates" in pred else {}
    return all(stack["cd"].get(k) == v for k, v in expected.items())


def trigger_matches(conditions, grid):
    # Mirrors RecipeCraftedTrigger.TriggerInstance#matches
    remaining = list(grid)
    for pred in conditions.get("ingredients", []):
        for i, stack in enumerate(remaining):
            if predicate_matches(pred, stack):
                del remaining[i]
                break
        else:
            return False
    return True


def load_advancements(root, recipe):
    advs = []
    folder = root / "data" / g.NS / "advancement" / recipe.adv_dir
    for path in folder.glob("*.json"):
        data = json.loads(path.read_text())
        if "crafted" not in data["criteria"]:
            continue
        counter = data["rewards"]["function"].rsplit("on_", 1)[1]
        advs.append((data["criteria"]["crafted"]["conditions"], counter))
    return advs


def expected_outcome(r, cells):
    """cells: list of (key char or None, item, tier) for filled slots."""
    out = {}

    def add(k, n):
        out[k] = out.get(k, 0) + n

    def refund():
        for _, item, tier in cells:
            add(g.tier_item_id(item, tier) if item in g.ITEM_NAMES else "vanilla:" + item, 1)

    if r.kind == "condense":
        tiers = {t for _, _, t in cells}
        if tiers == {0}:
            add(g.tier_item_id(r.item, g.C), 1)
        elif tiers == {g.C} and g.HAS_SUPER[r.item]:
            add(g.tier_item_id(r.item, g.S), 1)
        else:
            refund()
    elif r.kind == "spawner":
        valid = all(
            tier == r.grid_key[ch][1] for ch, item, tier in cells if isinstance(r.grid_key[ch], tuple)
        )
        if valid:
            add("spawner:" + r.mob, 1)
        else:
            refund()
    return out


def random_cells(r, rng, bias):
    """Random grid for the recipe. bias picks how uniform the tiers are."""
    if r.kind == "spawner":
        cells = []
        for row in r.pattern:
            for ch in row:
                if ch == " ":
                    continue
                value = r.grid_key[ch]
                if isinstance(value, tuple):
                    item, required = value
                    tier = required if rng.random() < bias else rng.choice([0] + g.tiers_of(item))
                    cells.append((ch, item, tier))
                else:
                    cells.append((ch, value, 0))
        return cells
    assert r.kind == "condense", r.kind
    options = [0] + g.tiers_of(r.item)
    base = rng.choice(options)
    return [(None, r.item, base if rng.random() < bias else rng.choice(options)) for _ in range(9)]


def run_scoreboard(commands, player, fake):
    """Executes the `scoreboard players set/operation` commands emitted by Expr.commands."""
    def ref(holder, objective):
        return (player, objective[3:]) if holder == "@s" else (fake, holder)

    for cmd in commands:
        parts = cmd.split()
        if parts[2] == "set":
            store, key = ref(parts[3], parts[4])
            store[key] = int(parts[5])
            continue
        dst_store, dst = ref(parts[3], parts[4])
        src_store, src = ref(parts[6], parts[7])
        value = src_store[src]
        op = parts[5]
        if op == "=":
            dst_store[dst] = value
        elif op == "+=":
            dst_store[dst] += value
        elif op == "-=":
            dst_store[dst] -= value
        elif op == "*=":
            dst_store[dst] *= value
        else:
            raise ValueError(cmd)
    return fake["#r"]


def check_commands(recipes, rng):
    for r in recipes:
        for target, expr in r.resolution().items():
            for _ in range(50):
                counters = {c: rng.randint(0, 600) for c in g.COUNTERS}
                fake = {"#%d" % c: c for c in expr.constants()}
                assert run_scoreboard(expr.commands(), counters, fake) == expr.evaluate(counters), (r.key, target)


def main():
    rng = random.Random(1234)
    check_commands(g.build_recipes(), rng)
    with tempfile.TemporaryDirectory() as tmp:
        root = Path(tmp) / "pack"
        _, recipes = g.generate(root)
        failures = 0
        checked = 0
        for r in recipes:
            advs = load_advancements(root, r)
            resolution = r.resolution()
            for batch in range(400):
                # Every craft (also each one of a shift-click) is resolved on its own.
                counters = {c: 0 for c in g.COUNTERS}
                bias = rng.choice([1.0, 0.95, 0.8, 0.3])
                cells = random_cells(r, rng, bias)
                grid = [item_data(item, tier) for _, item, tier in cells]
                grid += [None] * (9 - len(grid))
                rng.shuffle(grid)
                for conditions, counter in advs:
                    if trigger_matches(conditions, grid):
                        counters[counter] += 1
                expected = expected_outcome(r, cells)
                actual = {k: e.evaluate(counters) for k, e in resolution.items()}
                if r.result:
                    target, count = r.result
                    # Only what this craft produced can be taken back.
                    assert actual.get(target, 0) >= -count, (r.key, counters)
                    actual[target] = actual.get(target, 0) + count
                assert all(n >= 0 for k, n in actual.items() if not r.result or k != r.result[0]), (r.key, actual)
                actual = {k: n for k, n in actual.items() if n}
                checked += 1
                if actual != expected:
                    failures += 1
                    if failures <= 10:
                        print("MISMATCH %s: counters=%s\n  expected=%s\n  actual=%s"
                              % (r.key, counters, expected, actual))
        print("checked %d batches across %d recipes, %d failures" % (checked, len(recipes), failures))
        sys.exit(1 if failures else 0)


if __name__ == "__main__":
    main()
