#!/usr/bin/env python3
"""Generates the Craftable Spawners data pack for Minecraft Java Edition 26.3.

Run from anywhere:  python3 tools/generate_datapack.py [--zip]

Vanilla crafting recipes can only match ingredients by item type, so the
condensed items (which are ordinary items carrying custom data) cannot be
required directly by a recipe. Instead every recipe that involves them is
validated during the craft:

* Condensing outputs the real condensed item, so results stack like vanilla
  ones and are harmless in a Crafter. Spawner recipes output a placeholder
  item (a Crafter must not make spawners).
* Hidden advancements using the `minecraft:recipe_crafted` trigger count how
  many condensed / super condensed items were in the grid, then lock the
  recipe again.
* The game unlocks the recipe right after the craft, which fires a
  `minecraft:recipe_unlocked` advancement. Its function swaps the result for
  the real one (or an exact refund of the ingredients) in the same tick.
"""

import argparse
import json
import shutil
import zipfile
from pathlib import Path

NS = "craftable_spawners"
VERSION = "1.0.0"
PACK_FORMAT = 121  # Java Edition 26.3
DESCRIPTION = "Craftable Spawners v%s - craft mob spawners from condensed mob drops" % VERSION
PACK_NAME = "%s-%s" % (NS, VERSION)

REPO = Path(__file__).resolve().parent.parent
OUT_ROOT = REPO / "datapack"
OUT = OUT_ROOT / PACK_NAME

PLACEHOLDER_ITEM = "minecraft:command_block"

# (item id, display name, has a super condensed tier).
# The super condensed tier stays off. Custom data cannot be required by a
# vanilla recipe, so every recipe uses condensed items.
CONDENSED = [
    # Hostile mob items
    ("bone", "Bone", False),
    ("rotten_flesh", "Rotten Flesh", False),
    ("blaze_rod", "Blaze Rod", False),
    ("gunpowder", "Gunpowder", False),
    ("string", "String", False),
    ("ender_pearl", "Ender Pearl", False),
    ("slime_block", "Slime Block", False),
    ("magma_cream", "Magma Cream", False),
    ("ghast_tear", "Ghast Tear", False),
    ("gold_block", "Gold Block", False),
    ("nether_star", "Nether Star", False),
    ("wither_skeleton_skull", "Wither Skeleton Skull", False),
    ("redstone_block", "Redstone Block", False),
    # Friendly mob items
    ("iron_block", "Iron Block", False),
    ("leather", "Leather", False),
    ("beef", "Beef", False),
    ("carved_pumpkin", "Carved Pumpkin", False),
    ("snow_block", "Snow Block", False),
    ("white_wool", "White Wool", False),
    ("mutton", "Mutton", False),
    ("porkchop", "Porkchop", False),
    ("ink_sac", "Ink Sac", False),
    ("chicken", "Chicken", False),
    ("feather", "Feather", False),
    ("emerald_block", "Emerald Block", False),
    # Items added for the remaining spawn-egg mobs
    ("armadillo_scute", "Armadillo Scute", False),
    ("honeycomb_block", "Honeycomb Block", False),
    ("sweet_berries", "Sweet Berries", False),
    ("bamboo_block", "Block of Bamboo", False),
    ("rabbit", "Rabbit", False),
    ("rabbit_hide", "Rabbit Hide", False),
    ("glow_ink_sac", "Glow Ink Sac", False),
    ("pufferfish", "Pufferfish", False),
    ("cod", "Cod", False),
    ("salmon", "Salmon", False),
    ("tropical_fish", "Tropical Fish", False),
    ("amethyst_shard", "Amethyst Shard", False),
    ("torchflower_seeds", "Torchflower Seeds", False),
    ("pitcher_pod", "Pitcher Pod", False),
    ("breeze_rod", "Breeze Rod", False),
    ("prismarine", "Prismarine", False),
    ("phantom_membrane", "Phantom Membrane", False),
    ("seagrass", "Seagrass", False),
    ("turtle_scute", "Turtle Scute", False),
    ("cactus", "Cactus", False),
    ("red_mushroom", "Red Mushroom", False),
    ("warped_fungus", "Warped Fungus", False),
    ("crimson_fungus", "Crimson Fungus", False),
    ("cobblestone", "Cobblestone", False),
    ("spider_eye", "Spider Eye", False),
    ("sand", "Sand", False),
    ("goat_horn", "Goat Horn", False),
    ("nautilus_shell", "Nautilus Shell", False),
    ("ochre_froglight", "Ochre Froglight", False),
    ("potent_sulfur", "Potent Sulfur", False),
    ("resin_block", "Block of Resin", False),
    ("wet_sponge", "Wet Sponge", False),
    ("sculk_catalyst", "Sculk Catalyst", False),
    ("totem_of_undying", "Totem of Undying", False),
    ("saddle", "Saddle", False),
    ("shulker_shell", "Shulker Shell", False),
]

RING = ["XXX", "XIX", "XXX"]
SIDES = [" X ", "XIX", " X "]
CORNERS = ["X X", " I ", "X X"]
TOP = ["AAA", "BIB", "BBB"]  # three on the top row, five of the other item
CROSS = ["ABA", "BIB", "ABA"]  # corners A, sides B
C, S = 1, 2  # condensed / super condensed

# (mob, pattern, key). Key values are either a vanilla item id or (base item, tier).
SPAWNERS = [
    # Hostile
    ("skeleton", RING, {"X": ("bone", C), "I": "iron_bars"}),
    ("zombie", RING, {"X": ("rotten_flesh", C), "I": "iron_bars"}),
    ("blaze", RING, {"X": ("blaze_rod", C), "I": "iron_bars"}),
    ("creeper", RING, {"X": ("gunpowder", C), "I": "iron_bars"}),
    ("spider", RING, {"X": ("string", C), "I": "iron_bars"}),
    ("enderman", RING, {"X": ("ender_pearl", C), "I": "iron_bars"}),
    ("slime", RING, {"X": ("slime_block", C), "I": "iron_bars"}),
    ("magma_cube", RING, {"X": ("magma_cream", C), "I": "iron_bars"}),
    ("ghast", RING, {"X": ("ghast_tear", C), "I": "iron_bars"}),
    ("zombified_piglin", RING, {"X": ("gold_block", C), "I": "iron_bars"}),
    ("wither", RING, {"X": ("nether_star", C), "I": "iron_bars"}),
    ("wither_skeleton", RING, {"X": ("wither_skeleton_skull", C), "I": "iron_bars"}),
    ("witch", ["GRG", "RIR", "GRG"], {"G": ("gunpowder", C), "R": ("redstone_block", C), "I": "iron_bars"}),
    # Friendly
    ("iron_golem", RING, {"X": ("iron_block", C), "I": "iron_bars"}),
    ("cow", ["LLL", "BIB", "BBB"], {"L": ("leather", C), "B": ("beef", C), "I": "iron_bars"}),
    ("snow_golem", ["CCC", "BIB", "BBB"], {"C": ("carved_pumpkin", C), "B": ("snow_block", C), "I": "iron_bars"}),
    ("sheep", ["WWW", "MIM", "MMM"], {"W": ("white_wool", C), "M": ("mutton", C), "I": "iron_bars"}),
    ("pig", RING, {"X": ("porkchop", C), "I": "iron_bars"}),
    ("horse", RING, {"X": ("leather", C), "I": "iron_bars"}),
    ("squid", RING, {"X": ("ink_sac", C), "I": "iron_bars"}),
    ("chicken", ["FFF", "CIC", "CCC"], {"F": ("feather", C), "C": ("chicken", C), "I": "iron_bars"}),
    ("villager", SIDES, {"X": ("emerald_block", C), "I": "iron_bars"}),
    # Remaining spawn-egg mobs
    ("allay", RING, {"X": ("amethyst_shard", C), "I": "iron_bars"}),
    ("armadillo", RING, {"X": ("armadillo_scute", C), "I": "iron_bars"}),
    ("axolotl", SIDES, {"X": ("tropical_fish", C), "I": "iron_bars"}),
    ("bee", RING, {"X": ("honeycomb_block", C), "I": "iron_bars"}),
    ("bogged", TOP, {"A": ("red_mushroom", C), "B": ("bone", C), "I": "iron_bars"}),
    ("breeze", RING, {"X": ("breeze_rod", C), "I": "iron_bars"}),
    ("camel", RING, {"X": ("cactus", C), "I": "iron_bars"}),
    ("camel_husk", TOP, {"A": ("cactus", C), "B": ("rotten_flesh", C), "I": "iron_bars"}),
    ("cat", CORNERS, {"X": ("string", C), "I": "iron_bars"}),
    ("cave_spider", CROSS, {"A": ("spider_eye", C), "B": ("string", C), "I": "iron_bars"}),
    ("cod", RING, {"X": ("cod", C), "I": "iron_bars"}),
    ("creaking", RING, {"X": ("resin_block", C), "I": "iron_bars"}),
    ("dolphin", SIDES, {"X": ("cod", C), "I": "iron_bars"}),
    ("drowned", TOP, {"A": ("prismarine", C), "B": ("rotten_flesh", C), "I": "iron_bars"}),
    ("elder_guardian", RING, {"X": ("wet_sponge", C), "I": "iron_bars"}),
    ("endermite", SIDES, {"X": ("ender_pearl", C), "I": "iron_bars"}),
    ("evoker", RING, {"X": ("totem_of_undying", C), "I": "iron_bars"}),
    ("fox", RING, {"X": ("sweet_berries", C), "I": "iron_bars"}),
    ("frog", RING, {"X": ("ochre_froglight", C), "I": "iron_bars"}),
    ("glow_squid", RING, {"X": ("glow_ink_sac", C), "I": "iron_bars"}),
    ("goat", RING, {"X": ("goat_horn", C), "I": "iron_bars"}),
    ("guardian", RING, {"X": ("prismarine", C), "I": "iron_bars"}),
    ("hoglin", TOP, {"A": ("crimson_fungus", C), "B": ("porkchop", C), "I": "iron_bars"}),
    ("husk", TOP, {"A": ("sand", C), "B": ("rotten_flesh", C), "I": "iron_bars"}),
    ("llama", TOP, {"A": ("white_wool", C), "B": ("leather", C), "I": "iron_bars"}),
    ("mooshroom", TOP, {"A": ("red_mushroom", C), "B": ("beef", C), "I": "iron_bars"}),
    ("nautilus", RING, {"X": ("nautilus_shell", C), "I": "iron_bars"}),
    ("ocelot", CROSS, {"A": ("cod", C), "B": ("salmon", C), "I": "iron_bars"}),
    ("panda", RING, {"X": ("bamboo_block", C), "I": "iron_bars"}),
    ("parched", TOP, {"A": ("sand", C), "B": ("bone", C), "I": "iron_bars"}),
    ("parrot", RING, {"X": ("feather", C), "I": "iron_bars"}),
    ("phantom", RING, {"X": ("phantom_membrane", C), "I": "iron_bars"}),
    ("piglin", SIDES, {"X": ("gold_block", C), "I": "iron_bars"}),
    ("piglin_brute", CROSS, {"A": ("gold_block", C), "B": ("iron_block", C), "I": "iron_bars"}),
    ("polar_bear", TOP, {"A": ("salmon", C), "B": ("cod", C), "I": "iron_bars"}),
    ("pufferfish", RING, {"X": ("pufferfish", C), "I": "iron_bars"}),
    ("rabbit", TOP, {"A": ("rabbit_hide", C), "B": ("rabbit", C), "I": "iron_bars"}),
    ("ravager", RING, {"X": ("saddle", C), "I": "iron_bars"}),
    ("salmon", RING, {"X": ("salmon", C), "I": "iron_bars"}),
    ("shulker", RING, {"X": ("shulker_shell", C), "I": "iron_bars"}),
    ("silverfish", RING, {"X": ("cobblestone", C), "I": "iron_bars"}),
    ("skeleton_horse", TOP, {"A": ("leather", C), "B": ("bone", C), "I": "iron_bars"}),
    ("sniffer", CROSS, {"A": ("torchflower_seeds", C), "B": ("pitcher_pod", C), "I": "iron_bars"}),
    ("stray", TOP, {"A": ("snow_block", C), "B": ("bone", C), "I": "iron_bars"}),
    ("strider", TOP, {"A": ("warped_fungus", C), "B": ("string", C), "I": "iron_bars"}),
    ("sulfur_cube", CROSS, {"A": ("potent_sulfur", C), "B": ("slime_block", C), "I": "iron_bars"}),
    ("tadpole", SIDES, {"X": ("ochre_froglight", C), "I": "iron_bars"}),
    ("tropical_fish", RING, {"X": ("tropical_fish", C), "I": "iron_bars"}),
    ("turtle", TOP, {"A": ("turtle_scute", C), "B": ("seagrass", C), "I": "iron_bars"}),
    ("warden", RING, {"X": ("sculk_catalyst", C), "I": "iron_bars"}),
    ("wolf", SIDES, {"X": ("bone", C), "I": "iron_bars"}),
    ("zoglin", TOP, {"A": ("rotten_flesh", C), "B": ("porkchop", C), "I": "iron_bars"}),
    ("zombie_horse", TOP, {"A": ("rotten_flesh", C), "B": ("leather", C), "I": "iron_bars"}),
    ("zombie_nautilus", TOP, {"A": ("nautilus_shell", C), "B": ("rotten_flesh", C), "I": "iron_bars"}),
    ("zombie_villager", TOP, {"A": ("emerald_block", C), "B": ("rotten_flesh", C), "I": "iron_bars"}),
]

ITEM_NAMES = {item: name for item, name, _ in CONDENSED}
HAS_SUPER = {item: sup for item, _, sup in CONDENSED}

TIER_KIND = {C: "condensed", S: "super_condensed"}
TIER_PREFIX = {C: "Condensed", S: "Super Condensed"}
TIER_COLOR = {C: "dark_green", S: "dark_blue"}
TIER_WORTH = {C: 9, S: 81}

# Player score counters filled in by the recipe_crafted advancements.
COUNTERS = ["n", "h", "v", "a1", "a2", "b1", "b2"]


# --------------------------------------------------------------------------- helpers

def mc(item):
    return item if ":" in item else "minecraft:" + item


def tiers_of(item):
    return [C, S] if HAS_SUPER[item] else [C]


def tier_item_id(item, tier):
    """Function-friendly id of an item variant: bone, condensed_bone, super_condensed_bone."""
    return item if tier == 0 else TIER_KIND[tier] + "_" + item


def display_name(item, tier):
    return ITEM_NAMES[item] if tier == 0 else TIER_PREFIX[tier] + " " + ITEM_NAMES[item]


def mob_title(mob):
    return mob.replace("_", " ").title()


def tier_components(item, tier):
    """Components of a condensed or super condensed item. Recipe results and /give
    both use this, so crafted and given items are identical and stack together."""
    return {
        "minecraft:item_name": {"text": display_name(item, tier), "color": TIER_COLOR[tier]},
        "minecraft:lore": [
            {"text": "Worth %d %s" % (TIER_WORTH[tier], ITEM_NAMES[item]), "color": "gray", "italic": False},
        ],
        "minecraft:enchantment_glint_override": True,
        "minecraft:custom_data": {NS: {"group": "condensed", "tier": TIER_KIND[tier], "item": item}},
    }


def tier_item_snbt(item, tier):
    """Item stack argument (for /give) of a plain, condensed or super condensed item."""
    if tier == 0:
        return mc(item)
    components = ["%s=%s" % (k, json.dumps(v, separators=(",", ":"))) for k, v in tier_components(item, tier).items()]
    return "%s[%s]" % (mc(item), ",".join(components))


def tier_item_predicate_arg(item, tier):
    """Item predicate argument (for clear / execute if items) matching exactly one variant."""
    if tier == 0:
        return "%s[!minecraft:custom_data]" % mc(item)
    return '%s[minecraft:custom_data~{%s:{tier:"%s"}}]' % (mc(item), NS, TIER_KIND[tier])


def spawner_components_snbt(id_expr, path_expr):
    """Components of a spawner item; arguments may be macro placeholders."""
    return (
        '{"minecraft:block_entity_data":{id:"minecraft:mob_spawner",SpawnData:{entity:{id:"%s"}}},'
        '"minecraft:item_name":[{translate:"entity.minecraft.%s",color:"gold"},{text:" Spawner"}],'
        '"minecraft:custom_data":{%s:{spawner:"%s"}}}'
    ) % (id_expr, path_expr, NS, id_expr)


def spawner_item_snbt(id_expr, path_expr):
    return (
        'minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"%s"}}},'
        'minecraft:item_name=[{translate:"entity.minecraft.%s",color:"gold"},{text:" Spawner"}],'
        'minecraft:custom_data={%s:{spawner:"%s"}}]'
    ) % (id_expr, path_expr, NS, id_expr)


def tier_predicate(item, tier):
    return {
        "items": mc(item),
        "predicates": {"minecraft:custom_data": '{%s:{tier:"%s"}}' % (NS, TIER_KIND[tier])},
    }


def any_tier_predicate(item):
    return {
        "items": mc(item),
        "predicates": {"minecraft:custom_data": '{%s:{group:"condensed"}}' % NS},
    }


def placeholder(model, name, color, lore):
    return {
        "id": PLACEHOLDER_ITEM,
        "components": {
            "minecraft:item_model": model,
            "minecraft:item_name": {"text": name, "color": color},
            "minecraft:lore": [{"text": line, "color": "gray", "italic": False} for line in lore],
            "minecraft:enchantment_glint_override": True,
            "minecraft:custom_data": {NS: {"group": "placeholder"}},
        },
    }


# --------------------------------------------------------------------------- linear expressions
# Results are linear combinations of the player's counters, e.g. n - h + a1 - 9v.

class Expr:
    def __init__(self, terms=None, const=0):
        self.terms = dict(terms or {})
        self.const = const

    @staticmethod
    def var(name, coef=1):
        return Expr({name: coef})

    def __add__(self, other):
        other = other if isinstance(other, Expr) else Expr(const=other)
        terms = dict(self.terms)
        for k, v in other.terms.items():
            terms[k] = terms.get(k, 0) + v
        return Expr({k: v for k, v in terms.items() if v}, self.const + other.const)

    def __neg__(self):
        return Expr({k: -v for k, v in self.terms.items()}, -self.const)

    def __sub__(self, other):
        return self + (-(other if isinstance(other, Expr) else Expr(const=other)))

    def __mul__(self, k):
        return Expr({n: v * k for n, v in self.terms.items() if v * k}, self.const * k)

    __rmul__ = __mul__

    def evaluate(self, values):
        return self.const + sum(values.get(k, 0) * v for k, v in self.terms.items())

    def is_zero(self):
        return not self.terms and self.const == 0

    def commands(self, target="#r"):
        """Scoreboard commands that store this expression in `<target> cs.tmp`."""
        cmds = ["scoreboard players set %s cs.tmp %d" % (target, self.const)]
        for name, coef in sorted(self.terms.items()):
            if coef in (1, -1):
                op = "+=" if coef == 1 else "-="
                cmds.append("scoreboard players operation %s cs.tmp %s @s cs.%s" % (target, op, name))
            else:
                cmds.append("scoreboard players operation #t cs.tmp = @s cs.%s" % name)
                cmds.append("scoreboard players operation #t cs.tmp *= #%d cs.tmp" % abs(coef))
                op = "+=" if coef > 0 else "-="
                cmds.append("scoreboard players operation %s cs.tmp %s #t cs.tmp" % (target, op))
        return cmds

    def constants(self):
        return {abs(c) for c in self.terms.values() if abs(c) != 1}


V = Expr.var


# --------------------------------------------------------------------------- recipe model

class IngredientClass:
    """Slots of one condensable base item inside a recipe, tracked by a counter prefix."""

    def __init__(self, item, required_tier, slots, prefix):
        self.item = item
        self.required_tier = required_tier  # None = plain items expected (condense recipes)
        self.slots = slots
        self.prefix = prefix


class Recipe:
    def __init__(self, key, kind, recipe_id, classes, **extra):
        self.key = key
        self.kind = kind  # condense | spawner
        self.recipe_id = recipe_id
        self.classes = classes
        self.index = 0
        self.__dict__.update(extra)

    @property
    def adv_dir(self):
        return "craft/" + self.key

    def outputs(self):
        """{give target: Expr}, give target = tier item id, 'spawner:<mob>' or a vanilla item."""
        out = {}

        def add(target, expr):
            out[target] = out.get(target, Expr()) + expr

        if self.kind == "condense":
            x = self.item
            # plain crafts -> condensed; fully condensed crafts -> super condensed
            add(tier_item_id(x, C), V("n") - V("h"))
            if HAS_SUPER[x]:
                add(tier_item_id(x, S), V("v"))
            # everything else is refunded exactly
            add(tier_item_id(x, C), V("a1") - 9 * V("v"))
            if HAS_SUPER[x]:
                add(tier_item_id(x, S), V("a2"))
            add(tier_item_id(x, 0), 9 * V("h") - V("a1") - V("a2"))
        elif self.kind == "spawner":
            add("spawner:" + self.mob, V("v"))
            failed = V("n") - V("v")
            for cls in self.classes:
                refund = {}
                for tier in tiers_of(cls.item):
                    used = cls.slots * V("v") if tier == cls.required_tier else Expr()
                    refund[tier] = V(cls.prefix + str(tier)) - used
                    add(tier_item_id(cls.item, tier), refund[tier])
                plain = cls.slots * failed
                for expr in refund.values():
                    plain = plain - expr
                add(tier_item_id(cls.item, 0), plain)
            for item, count in self.vanilla_ingredients.items():
                add("vanilla:" + item, count * failed)
        return {k: v for k, v in out.items() if not v.is_zero()}

    @property
    def result(self):
        """(target, count) the crafting grid itself hands out, None for vanilla recipes."""
        if self.kind == "condense":
            return tier_item_id(self.item, C), 1
        if self.kind == "spawner":
            return "placeholder", 1
        return None

    def resolution(self):
        """{target: Expr} the resolver adds (or removes, when negative) after one craft
        so that the grid's result plus these changes equals outputs()."""
        out = self.outputs()
        if self.result:
            target, count = self.result
            out[target] = out.get(target, Expr()) - count * V("n")
        return {k: v for k, v in out.items() if not v.is_zero()}

    def counters_used(self):
        used = {"n"}
        if self.kind == "condense":
            used.add("h")
        if (self.kind == "condense" and HAS_SUPER[self.item]) or self.kind == "spawner":
            used.add("v")
        for cls in self.classes:
            for tier in tiers_of(cls.item):
                used.add(cls.prefix + str(tier))
        return used


def build_recipes():
    recipes = []
    for item, name, has_super in CONDENSED:
        recipes.append(Recipe(
            "condense_" + item, "condense", "%s:condense/%s" % (NS, item),
            [IngredientClass(item, None, 9, "a")], item=item,
        ))
    seen_layouts = {}
    for mob, pattern, key in SPAWNERS:
        layout = tuple(
            tuple(None if ch == " " else (key[ch][0] if isinstance(key[ch], tuple) else key[ch]) for ch in row)
            for row in pattern
        )
        if layout in seen_layouts:
            raise SystemExit("duplicate spawner layout: %s and %s" % (seen_layouts[layout], mob))
        seen_layouts[layout] = mob
        if pattern[1][1] == " " or key[pattern[1][1]] != "iron_bars":
            raise SystemExit("spawner %s is missing iron bars in the center" % mob)
        counts = {}
        for row in pattern:
            for ch in row:
                if ch != " ":
                    counts[ch] = counts.get(ch, 0) + 1
        classes, vanilla = [], {}
        for ch, value in key.items():
            if isinstance(value, tuple):
                prefix = "ab"[len(classes)]
                classes.append(IngredientClass(value[0], value[1], counts[ch], prefix))
            else:
                vanilla[value] = counts[ch]
        recipes.append(Recipe(
            "spawner_" + mob, "spawner", "%s:spawner/%s" % (NS, mob), classes,
            mob=mob, pattern=pattern, grid_key=key, vanilla_ingredients=vanilla,
        ))
    for i, recipe in enumerate(recipes, start=1):
        recipe.index = i
    return recipes


# --------------------------------------------------------------------------- file writer

class Pack:
    def __init__(self, root):
        self.root = root
        self.files = {}

    def json(self, path, data):
        self.files[path] = json.dumps(data, indent=2) + "\n"

    def function(self, name, lines, namespace=NS):
        self.files["data/%s/function/%s.mcfunction" % (namespace, name)] = "\n".join(lines) + "\n"

    def advancement(self, name, data):
        self.json("data/%s/advancement/%s.json" % (NS, name), data)

    def recipe(self, name, data):
        self.json("data/%s/recipe/%s.json" % (NS, name), data)

    def write(self):
        if self.root.exists():
            shutil.rmtree(self.root)
        for path, text in sorted(self.files.items()):
            target = self.root / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text(text)


# --------------------------------------------------------------------------- generation


def gen_recipes(pack, recipes):
    for r in recipes:
        if r.kind == "condense":
            x = r.item
            pack.recipe("condense/" + x, {
                "type": "minecraft:crafting_shaped",
                "category": "misc",
                "group": NS + "_condense",
                "show_notification": False,
                "pattern": ["XXX", "XXX", "XXX"],
                "key": {"X": mc(x)},
                "result": {"id": mc(x), "components": tier_components(x, C)},
            })
        elif r.kind == "spawner":
            key = {}
            for ch, value in r.grid_key.items():
                key[ch] = mc(value[0]) if isinstance(value, tuple) else mc(value)
            lore = []
            for ch, value in r.grid_key.items():
                if isinstance(value, tuple):
                    count = sum(row.count(ch) for row in r.pattern)
                    lore.append("%d %s" % (count, display_name(value[0], value[1])))
            lore.append("+ Iron Bars")
            pack.recipe("spawner/" + r.mob, {
                "type": "minecraft:crafting_shaped",
                "category": "misc",
                "group": NS + "_spawner",
                "show_notification": False,
                "pattern": r.pattern,
                "key": key,
                "result": placeholder("minecraft:spawner", mob_title(r.mob) + " Spawner", "gold", lore),
            })


def gen_advancements(pack, recipes):
    for r in recipes:
        root = "%s:%s/root" % (NS, r.adv_dir)
        pack.advancement(r.adv_dir + "/root", {
            "criteria": {"never": {"trigger": "minecraft:impossible"}},
        })

        def child(name, ingredients, counter):
            conditions = {"recipes": r.recipe_id}
            if ingredients:
                conditions["ingredients"] = ingredients
            pack.advancement("%s/%s" % (r.adv_dir, name), {
                "parent": root,
                "criteria": {"crafted": {"trigger": "minecraft:recipe_crafted", "conditions": conditions}},
                "rewards": {"function": "%s:%s/on_%s" % (NS, r.adv_dir, counter)},
            })

        used = r.counters_used()
        if "n" in used:
            child("any", [], "n")
        if "h" in used:
            child("has_condensed", [any_tier_predicate(r.item)], "h")
        if "v" in used:
            if r.kind == "condense":
                child("valid", [tier_predicate(r.item, C)] * 9, "v")
            else:
                ingredients = []
                for cls in r.classes:
                    ingredients += [tier_predicate(cls.item, cls.required_tier)] * cls.slots
                child("valid", ingredients, "v")
        for cls in r.classes:
            for tier in tiers_of(cls.item):
                counter = cls.prefix + str(tier)
                for k in range(1, cls.slots + 1):
                    child("%s_%d" % (counter, k), [tier_predicate(cls.item, tier)] * k, counter)

        # Locking the recipe makes the game unlock it again right after all
        # recipe_crafted rewards of this craft ran, which triggers the `end`
        # advancement while the result is already on the cursor / in the inventory.
        for counter in sorted(used):
            pack.function(r.adv_dir + "/on_" + counter, [
                "execute unless score @s cs.recipe matches %d run function %s:reset" % (r.index, NS),
                "scoreboard players set @s cs.recipe %d" % r.index,
                "scoreboard players add @s cs.%s 1" % counter,
                "advancement revoke @s from " + root,
                "recipe take @s " + r.recipe_id,
            ])
        end = "%s:%s/end" % (NS, r.adv_dir)
        pack.advancement(r.adv_dir + "/end", {
            "criteria": {"unlocked": {"trigger": "minecraft:recipe_unlocked", "conditions": {"recipes": r.recipe_id}}},
            "rewards": {"function": end},
        })
        pack.function(r.adv_dir + "/end", [
            "advancement revoke @s only " + end,
            "execute unless score @s cs.recipe matches %d run return fail" % r.index,
            "function %s:resolve/%s" % (NS, r.key),
            "function %s:reset" % NS,
        ])


MAX_STACK = {
    "ender_pearl": 16,
    "goat_horn": 1,
    "saddle": 1,
    "totem_of_undying": 1,
}


def output_targets():
    """{give target: (item stack argument, max stack size)} for everything a resolver can hand out."""
    targets = {}
    for item, _, has_super in CONDENSED:
        for tier in [0, C] + ([S] if has_super else []):
            targets[tier_item_id(item, tier)] = (tier_item_snbt(item, tier), MAX_STACK.get(item, 64))
    targets["vanilla:iron_bars"] = ("minecraft:iron_bars", 64)
    for mob, _, _ in SPAWNERS:
        targets["spawner:" + mob] = (spawner_item_snbt("minecraft:" + mob, mob), 64)
    return targets


def give_function_for(target):
    if target.startswith("spawner:"):
        return "%s:spawner/give_%s" % (NS, target.split(":", 1)[1])
    if target.startswith("vanilla:"):
        return "%s:item/%s" % (NS, target.split(":", 1)[1])
    return "%s:item/%s" % (NS, target)


def cursor_function_for(target):
    return "%s:cursor/%s" % (NS, target.replace(":", "_"))


PLACEHOLDER_PREDICATE = '%s[minecraft:custom_data~{%s:{group:"placeholder"}}]' % (PLACEHOLDER_ITEM, NS)


def take_targets():
    """{target: (item predicate argument, tracks debt)} for crafting results the resolver may take back."""
    targets = {"placeholder": (PLACEHOLDER_PREDICATE, False)}
    for item, _, has_super in CONDENSED:
        for tier in [0, C] + ([S] if has_super else []):
            targets[tier_item_id(item, tier)] = (tier_item_predicate_arg(item, tier), True)
    return targets


# Hand out spawners first so they are the item that lands on the cursor.
OUTPUT_ORDER = ["spawner:", "super_condensed_", "condensed_"]


def output_priority(target):
    for i, prefix in enumerate(OUTPUT_ORDER):
        if target.startswith(prefix):
            return i, target
    return len(OUTPUT_ORDER), target


def gen_take(pack):
    debt_dispatch = []
    for index, (target, (predicate, debt)) in enumerate(sorted(take_targets().items()), start=1):
        lines = [
            "# Removes -#r %s, from the cursor first, then from the inventory." % target,
            "scoreboard players set #want cs.tmp 0",
            "scoreboard players operation #want cs.tmp -= #r cs.tmp",
            "execute store result score #k cs.tmp if items entity @s player.cursor " + predicate,
            "scoreboard players operation #k cs.tmp < #want cs.tmp",
            "scoreboard players operation #want cs.tmp -= #k cs.tmp",
            "execute if score #k cs.tmp matches 1.. run scoreboard players set #cursor cs.tmp 1",
            "execute store result storage %s:tmp take.k int -1 run scoreboard players get #k cs.tmp" % NS,
            "execute if score #k cs.tmp matches 1.. run function %s:take/cursor with storage %s:tmp take" % (NS, NS),
            "execute if score #want cs.tmp matches ..0 run return 0",
            "execute store result storage %s:tmp take.n int 1 run scoreboard players get #want cs.tmp" % NS,
            "execute store result score #k cs.tmp run function %s:take/clear/%s with storage %s:tmp take" % (NS, target, NS),
            "scoreboard players operation #want cs.tmp -= #k cs.tmp",
        ]
        if debt:
            # A result thrown with Q is dropped only after this runs.
            lines += [
                "execute if score #want cs.tmp matches 1.. run scoreboard players operation @s cs.debt += #want cs.tmp",
                "execute if score #want cs.tmp matches 1.. run scoreboard players set @s cs.debt_item %d" % index,
            ]
            debt_dispatch.append("execute if score @s cs.debt_item matches %d run function %s:debt/%s" % (index, NS, target))
            pack.function("debt/" + target, [
                "execute as @e[type=minecraft:item,distance=..8] if items entity @s contents %s run function %s:debt/reduce"
                % (predicate, NS),
            ])
        pack.function("take/" + target, lines)
        pack.function("take/clear/" + target, ["$return run clear @s %s $(n)" % predicate])
    pack.function("take/cursor", [
        '$item modify entity @s player.cursor {type:"minecraft:set_count",count:$(k),add:true}',
    ])

    pack.function("debt/dispatch", [
        "# Removes crafted items that were thrown out of the result slot with Q.",
        "scoreboard players operation #debt cs.tmp = @s cs.debt",
        "data modify storage %s:tmp debt.uuid set from entity @s UUID" % NS,
    ] + debt_dispatch + [
        "scoreboard players set @s cs.debt 0",
        "scoreboard players set @s cs.debt_item 0",
    ])
    pack.function("debt/reduce", [
        "execute if score #debt cs.tmp matches ..0 run return fail",
        "execute unless data entity @s Thrower run return fail",
        "execute store result score #k cs.tmp run data get entity @s Age",
        "execute if score #k cs.tmp matches 3.. run return fail",
        "data modify storage %s:tmp debt.cmp set from storage %s:tmp debt.uuid" % (NS, NS),
        "execute store success score #k cs.tmp run data modify storage %s:tmp debt.cmp set from entity @s Thrower" % NS,
        "execute if score #k cs.tmp matches 1 run return fail",
        "execute store result score #k cs.tmp run data get entity @s Item.count",
        "execute if score #k cs.tmp <= #debt cs.tmp run return run function %s:debt/kill" % NS,
        "scoreboard players operation #k cs.tmp -= #debt cs.tmp",
        "execute store result entity @s Item.count int 1 run scoreboard players get #k cs.tmp",
        "scoreboard players set #debt cs.tmp 0",
    ])
    pack.function("debt/kill", [
        "scoreboard players operation #debt cs.tmp -= #k cs.tmp",
        "kill @s",
    ])


def gen_resolvers(pack, recipes):
    constants = set()
    targets = output_targets()
    for r in recipes:
        lines = ["# %s (%s): runs right after one craft" % (r.recipe_id, r.kind)]
        # #cursor = the result was picked up with the cursor and the cursor is now
        # empty, so the first output goes there (like a vanilla craft would).
        lines.append("scoreboard players set #cursor cs.tmp 0")
        resolution = r.resolution()
        if r.result and r.result[0] in resolution:
            expr = resolution[r.result[0]]
            constants |= expr.constants()
            lines += expr.commands()
            lines.append("execute if score #r cs.tmp matches ..-1 run function %s:take/%s" % (NS, r.result[0]))
            lines.append("execute if items entity @s player.cursor * run scoreboard players set #cursor cs.tmp 0")
        for target, expr in sorted(resolution.items(), key=lambda kv: output_priority(kv[0])):
            if target == "placeholder":
                continue
            constants |= expr.constants()
            lines += expr.commands()
            lines.append("execute store result storage %s:tmp give.count int 1 run scoreboard players get #r cs.tmp" % NS)
            lines.append("execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..%d run function %s with storage %s:tmp give"
                         % (targets[target][1], cursor_function_for(target), NS))
            lines.append("execute if score #r cs.tmp matches 1.. run function %s with storage %s:tmp give"
                         % (give_function_for(target), NS))
        pack.function("resolve/" + r.key, lines)
    pack.function("reset", [
        "scoreboard players set @s cs.recipe 0",
    ] + ["scoreboard players set @s cs.%s 0" % c for c in COUNTERS])
    return constants


def gen_items(pack):
    items = set()
    for item, _, has_super in CONDENSED:
        items.add((item, 0))
        items.add((item, C))
        if has_super:
            items.add((item, S))
    for item, tier in sorted(items):
        pack.function("item/" + tier_item_id(item, tier), [
            "$give @s %s $(count)" % tier_item_snbt(item, tier),
        ])
    pack.function("item/iron_bars", ["$give @s minecraft:iron_bars $(count)"])

    for mob, _, _ in SPAWNERS:
        pack.function("spawner/give_" + mob, [
            "$give @s %s $(count)" % spawner_item_snbt("minecraft:" + mob, mob),
        ])
    for target, (snbt, _) in output_targets().items():
        pack.function(cursor_function_for(target).split(":", 1)[1], [
            "$item replace entity @s player.cursor with %s $(count)" % snbt,
            "scoreboard players set #cursor cs.tmp 0",
            "scoreboard players set #r cs.tmp 0",
        ])
    pack.function("spawner/give", [
        "# Arguments: id (e.g. minecraft:zombie), path (e.g. zombie), count",
        "$give @s %s $(count)" % spawner_item_snbt("$(id)", "$(path)"),
    ])

    # Player facing helpers
    pack.function("give", [
        "# Give a crafted-style spawner (operators).",
        '# Usage: /function %s:give {mob:"zombie",amount:1}' % NS,
        '$function %s:spawner/give {id:"minecraft:$(mob)",path:"$(mob)",count:$(amount)}' % NS,
        '$tellraw @s [{text:"Gave $(amount) ",color:"gold"},{translate:"entity.minecraft.$(mob)"},{text:" Spawner"}]',
    ])
    pack.function("give_item", [
        "# Gives condensed items, e.g.",
        '# /function %s:give_item {item:"condensed_bone",amount:8}' % NS,
        "$function %s:item/$(item) {count:$(amount)}" % NS,
    ])


def gen_spawner_mechanics(pack):
    # Silk touch drops the spawner with its mob stored in custom data.
    pack.json("data/minecraft/loot_table/blocks/spawner.json", {
        "type": "minecraft:block",
        "pools": [{
            "rolls": 1,
            "condition": "minecraft:tool/can_silk_touch",
            "entries": [{
                "type": "minecraft:item",
                "name": "minecraft:spawner",
                "modifier": [
                    {"type": "minecraft:set_custom_data", "tag": '{%s:{group:"raw_spawner"}}' % NS},
                    {
                        "type": "minecraft:copy_custom_data",
                        "source": "block_entity",
                        "ops": [{"source": "SpawnData.entity.id", "target": NS + ".dropped", "op": "replace"}],
                    },
                ],
            }],
        }],
        "random_sequence": "minecraft:blocks/spawner",
    })
    raw = 'minecraft:spawner[minecraft:custom_data~{%s:{group:"raw_spawner"}}]' % NS
    pack.function("drop/check", [
        "tag @s add cs.seen",
        "execute if items entity @s contents %s run return run function %s:drop/fix" % (raw, NS),
        "execute if items entity @s contents %s[minecraft:custom_data~{%s:{group:\"placeholder\"}}] run kill @s"
        % (PLACEHOLDER_ITEM, NS),
    ])
    pack.function("drop/fix", [
        "data remove storage %s:tmp drop" % NS,
        'data modify storage %s:tmp drop.id set from entity @s Item.components."minecraft:custom_data".%s.dropped'
        % (NS, NS),
        "execute unless data storage %s:tmp drop.id run return run data remove entity @s "
        'Item.components."minecraft:custom_data"' % NS,
        "data modify storage %s:tmp drop.path set string storage %s:tmp drop.id 10" % (NS, NS),
        "function %s:drop/apply with storage %s:tmp drop" % (NS, NS),
    ])
    pack.function("drop/apply", [
        "$data modify entity @s Item.components set value %s" % spawner_components_snbt("$(id)", "$(path)"),
    ])

    # Non-operators cannot apply block entity data when placing, so the mob is
    # copied onto the freshly placed spawner.
    marked = "minecraft:spawner[minecraft:custom_data~{%s:{}}]" % NS
    pack.advancement("place_spawner", {
        "criteria": {"placed": {
            "trigger": "minecraft:placed_block",
            "conditions": {"location": {
                "type": "minecraft:match_tool",
                "predicate": {
                    "items": "minecraft:spawner",
                    "predicates": {"minecraft:custom_data": "{%s:{}}" % NS},
                },
            }},
        }},
        "rewards": {"function": NS + ":place/placed"},
    })
    pack.function("place/placed", [
        "advancement revoke @s only %s:place_spawner" % NS,
        "data remove storage %s:tmp place" % NS,
        "execute if items entity @s weapon.mainhand %s run data modify storage %s:tmp place.id set from entity @s "
        'SelectedItem.components."minecraft:custom_data".%s.spawner' % (marked, NS, NS),
        "execute unless data storage %s:tmp place.id if items entity @s weapon.offhand %s run data modify storage "
        '%s:tmp place.id set from entity @s equipment.offhand.components."minecraft:custom_data".%s.spawner'
        % (NS, marked, NS, NS),
        "execute unless data storage %s:tmp place.id run return fail" % NS,
        "data modify storage %s:tmp place.path set string storage %s:tmp place.id 10" % (NS, NS),
        "scoreboard players set #steps cs.tmp 0",
        "execute anchored eyes positioned ^ ^ ^ run function %s:place/ray with storage %s:tmp place" % (NS, NS),
    ])
    pack.function("place/ray", [
        "$execute if block ~ ~ ~ minecraft:spawner run return run function %s:place/set {id:\"$(id)\",path:\"$(path)\"}"
        % NS,
        "scoreboard players add #steps cs.tmp 1",
        "execute if score #steps cs.tmp matches ..80 positioned ^ ^ ^0.1 run function %s:place/ray with storage %s:tmp place"
        % (NS, NS),
    ])
    pack.function("place/set", [
        '$execute unless data block ~ ~ ~ SpawnData.entity.id run data merge block ~ ~ ~ {SpawnData:{entity:{id:"$(id)"}}}',
        '$tellraw @s [{translate:"entity.minecraft.$(path)",color:"gold"},{text:" Spawner Placed!"}]',
    ])

    pack.function("spawner/mined", [
        "scoreboard players set @s cs.mined 0",
        "execute if entity @s[gamemode=creative] run return fail",
        'execute if items entity @s weapon.mainhand *[minecraft:enchantments~[{enchantments:"minecraft:silk_touch"}]] '
        'run return run tellraw @s {text:"Spawner Dropped!",color:"gold"}',
        'tellraw @s {text:"Spawner Broke!",color:"gold"}',
    ])


def gen_core(pack, recipes, constants):
    objectives = ["cs.recipe", "cs.tmp", "cs.debt", "cs.debt_item"] + ["cs." + c for c in COUNTERS]
    load = ["scoreboard objectives add %s dummy" % o for o in objectives]
    load.append("scoreboard objectives add cs.mined minecraft.mined:minecraft.spawner")
    load += ["scoreboard players set #%d cs.tmp %d" % (c, c) for c in sorted(constants)]
    pack.function("load", load)

    pack.function("tick", [
        "execute as @a[scores={cs.recipe=1..}] run function %s:reset" % NS,
        "execute as @a[scores={cs.debt=1..}] at @s run function %s:debt/dispatch" % NS,
        "clear @a " + PLACEHOLDER_PREDICATE,
        "execute as @e[type=minecraft:item,tag=!cs.seen] run function %s:drop/check" % NS,
        "execute as @a[scores={cs.mined=1..}] run function %s:spawner/mined" % NS,
    ])

    uninstall = ["scoreboard objectives remove %s" % o for o in objectives + ["cs.mined"]]
    uninstall.append("data remove storage %s:tmp give" % NS)
    uninstall.append("data remove storage %s:tmp take" % NS)
    uninstall.append("data remove storage %s:tmp debt" % NS)
    uninstall.append('tellraw @s {text:"Craftable Spawners scoreboards removed. Disable the data pack next.",color:"gold"}')
    pack.function("uninstall", uninstall)

    pack.json("data/minecraft/tags/function/load.json", {"values": [NS + ":load"]})
    pack.json("data/minecraft/tags/function/tick.json", {"values": [NS + ":tick"]})

    unlocked = [r.recipe_id for r in recipes if r.kind in ("condense", "spawner")]
    pack.advancement("unlock_recipes", {
        "criteria": {"tick": {"trigger": "minecraft:tick"}},
        "rewards": {"recipes": unlocked},
    })

    pack.json("pack.mcmeta", {
        "pack": {"description": DESCRIPTION, "min_format": PACK_FORMAT, "max_format": PACK_FORMAT},
    })


def generate(out=OUT):
    recipes = build_recipes()
    pack = Pack(out)
    gen_recipes(pack, recipes)
    gen_advancements(pack, recipes)
    constants = gen_resolvers(pack, recipes)
    gen_take(pack)
    gen_items(pack)
    gen_spawner_mechanics(pack)
    gen_core(pack, recipes, constants)
    pack.write()
    return pack, recipes


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--zip", action="store_true", help="also write dist/%s.zip" % PACK_NAME)
    args = parser.parse_args()
    if OUT_ROOT.exists():
        shutil.rmtree(OUT_ROOT)
    pack, recipes = generate()
    print("Wrote %d files for %d recipes to %s" % (len(pack.files), len(recipes), OUT))
    if args.zip:
        dist = REPO / "dist"
        dist.mkdir(exist_ok=True)
        archive = dist / (PACK_NAME + ".zip")
        with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as zf:
            for path in sorted(pack.files):
                zf.write(OUT / path, path)
        print("Wrote " + str(archive))


if __name__ == "__main__":
    main()
