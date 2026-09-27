#!/usr/bin/env python3
"""Generates the Craftable Spawners data pack for Minecraft Java Edition 26.3.

Run from anywhere:  python3 tools/generate_datapack.py [--zip]

Vanilla crafting recipes can only match ingredients by item type, so the
condensed items (which are ordinary items carrying custom data) cannot be
required directly by a recipe. Instead every recipe that involves them is
validated after the fact:

* Each custom recipe outputs a harmless placeholder item.
* Hidden advancements using the `minecraft:recipe_crafted` trigger count, for
  every craft, how many condensed / super condensed items were in the grid.
* On the next tick the counts are turned into the real result (or an exact
  refund of the ingredients) and the placeholders are deleted.

Un-condensing items that already have a vanilla single-item recipe (bone,
blaze rod, iron block, ...) keeps the vanilla output and tops it up with the
remaining value, so vanilla behaviour and Crafter automation stay untouched.
"""

import argparse
import json
import shutil
import zipfile
from pathlib import Path

NS = "craftable_spawners"
PACK_FORMAT = 121  # Java Edition 26.3
DESCRIPTION = "Craftable Spawners - craft mob spawners from condensed mob drops"

REPO = Path(__file__).resolve().parent.parent
OUT = REPO / "datapack"

PLACEHOLDER_ITEM = "minecraft:command_block"

# (item id, display name, has a super condensed tier)
CONDENSED = [
    # Hostile mob items
    ("bone", "Bone", True),
    ("rotten_flesh", "Rotten Flesh", True),
    ("blaze_rod", "Blaze Rod", True),
    ("gunpowder", "Gunpowder", True),
    ("string", "String", True),
    ("ender_pearl", "Ender Pearl", True),
    ("slime_block", "Slime Block", False),
    ("magma_cream", "Magma Cream", True),
    ("ghast_tear", "Ghast Tear", False),
    ("gold_block", "Gold Block", False),
    ("nether_star", "Nether Star", False),
    ("wither_skeleton_skull", "Wither Skeleton Skull", False),
    ("redstone_block", "Redstone Block", True),
    # Friendly mob items
    ("iron_block", "Iron Block", False),
    ("leather", "Leather", True),
    ("beef", "Beef", True),
    ("carved_pumpkin", "Carved Pumpkin", True),
    ("snow_block", "Snow Block", True),
    ("white_wool", "White Wool", True),
    ("mutton", "Mutton", True),
    ("porkchop", "Porkchop", True),
    ("ink_sac", "Ink Sac", True),
    ("chicken", "Chicken", True),
    ("feather", "Feather", True),
    ("emerald_block", "Emerald Block", False),
]

# Vanilla single-ingredient recipes that already use one of the condensed base
# items. Un-condensing those items piggybacks on the vanilla recipe.
VANILLA_UNCONDENSE = {
    "bone": "minecraft:bone_meal",
    "blaze_rod": "minecraft:blaze_powder",
    "ink_sac": "minecraft:black_dye",
    "slime_block": "minecraft:slime_ball",
    "redstone_block": "minecraft:redstone",
    "iron_block": "minecraft:iron_ingot_from_iron_block",
    "gold_block": "minecraft:gold_ingot_from_gold_block",
    "emerald_block": "minecraft:emerald",
}

RING = ["XXX", "XIX", "XXX"]
C, S = 1, 2  # condensed / super condensed

# (mob, pattern, key). Key values are either a vanilla item id or (base item, tier).
SPAWNERS = [
    # Hostile
    ("skeleton", RING, {"X": ("bone", S), "I": "iron_bars"}),
    ("zombie", RING, {"X": ("rotten_flesh", S), "I": "iron_bars"}),
    ("blaze", RING, {"X": ("blaze_rod", S), "I": "iron_bars"}),
    ("creeper", RING, {"X": ("gunpowder", S), "I": "iron_bars"}),
    ("spider", RING, {"X": ("string", S), "I": "iron_bars"}),
    ("enderman", RING, {"X": ("ender_pearl", S), "I": "iron_bars"}),
    ("slime", RING, {"X": ("slime_block", C), "I": "iron_bars"}),
    ("magma_cube", RING, {"X": ("magma_cream", S), "I": "iron_bars"}),
    ("ghast", RING, {"X": ("ghast_tear", C), "I": "iron_bars"}),
    ("zombified_piglin", RING, {"X": ("gold_block", C), "I": "iron_bars"}),
    ("wither", RING, {"X": ("nether_star", C), "I": "iron_bars"}),
    ("wither_skeleton", RING, {"X": ("wither_skeleton_skull", C), "I": "iron_bars"}),
    ("witch", ["GRG", "RIR", "GRG"], {"G": ("gunpowder", S), "R": ("redstone_block", S), "I": "iron_bars"}),
    # Friendly
    ("iron_golem", RING, {"X": ("iron_block", C), "I": "iron_bars"}),
    ("cow", ["LLL", "BIB", "BBB"], {"L": ("leather", S), "B": ("beef", S), "I": "iron_bars"}),
    ("snow_golem", ["CCC", "BIB", "BBB"], {"C": ("carved_pumpkin", S), "B": ("snow_block", S), "I": "iron_bars"}),
    ("sheep", ["WWW", "MIM", "MMM"], {"W": ("white_wool", S), "M": ("mutton", S), "I": "iron_bars"}),
    ("pig", RING, {"X": ("porkchop", S), "I": "iron_bars"}),
    ("horse", RING, {"X": ("leather", S), "I": "iron_bars"}),
    ("squid", RING, {"X": ("ink_sac", S), "I": "iron_bars"}),
    ("chicken", ["FFF", "CIC", "CCC"], {"F": ("feather", S), "C": ("chicken", S), "I": "iron_bars"}),
    ("villager", [" E ", "EIE", " E "], {"E": ("emerald_block", C), "I": "iron_bars"}),
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


def custom_data_snbt(item, tier):
    return '{%s:{group:"condensed",tier:"%s",item:"%s"}}' % (NS, TIER_KIND[tier], item)


def tier_item_snbt(item, tier):
    """Item stack argument (for /give) of a plain, condensed or super condensed item."""
    if tier == 0:
        return mc(item)
    name = display_name(item, tier)
    worth = "Worth %d %s" % (TIER_WORTH[tier], ITEM_NAMES[item])
    components = [
        'minecraft:item_name={text:"%s",color:"%s"}' % (name, TIER_COLOR[tier]),
        'minecraft:lore=[{text:"%s",color:"gray",italic:false}]' % worth,
        "minecraft:enchantment_glint_override=true",
        "minecraft:custom_data=" + custom_data_snbt(item, tier),
    ]
    return "%s[%s]" % (mc(item), ",".join(components))


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
        self.kind = kind  # condense | uncondense | uncondense_vanilla | spawner
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
        elif self.kind == "uncondense":
            x = self.item
            add(tier_item_id(x, 0), 9 * V("a1") + (V("n") - V("a1") - V("a2")))
            if HAS_SUPER[x]:
                add(tier_item_id(x, C), 9 * V("a2"))
        elif self.kind == "uncondense_vanilla":
            # The vanilla output (worth one base item) is kept; top up the rest.
            x = self.item
            add(tier_item_id(x, 0), 8 * V("a1") + 8 * V("a2"))
            if HAS_SUPER[x]:
                add(tier_item_id(x, C), 8 * V("a2"))
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

    def counters_used(self):
        used = set()
        if self.kind != "uncondense_vanilla":
            used.add("n")
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
    for item, name, has_super in CONDENSED:
        if item in VANILLA_UNCONDENSE:
            recipes.append(Recipe(
                "uncondense_" + item, "uncondense_vanilla", VANILLA_UNCONDENSE[item],
                [IngredientClass(item, None, 1, "a")], item=item,
            ))
        else:
            recipes.append(Recipe(
                "uncondense_" + item, "uncondense", "%s:uncondense/%s" % (NS, item),
                [IngredientClass(item, None, 1, "a")], item=item,
            ))
    for mob, pattern, key in SPAWNERS:
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
                "pattern": ["XXX", "XXX", "XXX"],
                "key": {"X": mc(x)},
                "result": placeholder(
                    mc(x), display_name(x, C), TIER_COLOR[C],
                    ["9 %s -> %s" % (ITEM_NAMES[x], display_name(x, C))]
                    + (["9 %s -> %s" % (display_name(x, C), display_name(x, S))] if HAS_SUPER[x] else []),
                ),
            })
        elif r.kind == "uncondense":
            x = r.item
            lore = ["%s -> 9 %s" % (display_name(x, C), ITEM_NAMES[x])]
            if HAS_SUPER[x]:
                lore.append("%s -> 9 %s" % (display_name(x, S), display_name(x, C)))
            lore.append("Plain items are returned unchanged")
            pack.recipe("uncondense/" + x, {
                "type": "minecraft:crafting_shapeless",
                "category": "misc",
                "group": NS + "_uncondense",
                "ingredients": [mc(x)],
                "result": placeholder(mc(x), "Uncondense " + ITEM_NAMES[x], "dark_green", lore),
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

        for counter in sorted(used):
            pack.function(r.adv_dir + "/on_" + counter, [
                "execute unless score @s cs.recipe matches %d run function %s:resolve/dispatch" % (r.index, NS),
                "scoreboard players set @s cs.recipe %d" % r.index,
                "scoreboard players add @s cs.%s 1" % counter,
                "advancement revoke @s from " + root,
            ])


def give_function_for(target):
    if target.startswith("spawner:"):
        return "%s:spawner/give_%s" % (NS, target.split(":", 1)[1])
    if target.startswith("vanilla:"):
        return "%s:item/%s" % (NS, target.split(":", 1)[1])
    return "%s:item/%s" % (NS, target)


def gen_resolvers(pack, recipes):
    constants = set()
    dispatch = []
    for r in recipes:
        lines = ["# %s (%s)" % (r.recipe_id, r.kind)]
        for target, expr in sorted(r.outputs().items()):
            constants |= expr.constants()
            lines += expr.commands()
            lines.append("execute store result storage %s:tmp give.count int 1 run scoreboard players get #r cs.tmp" % NS)
            lines.append("execute if score #r cs.tmp matches 1.. run function %s with storage %s:tmp give"
                         % (give_function_for(target), NS))
        pack.function("resolve/" + r.key, lines)
        dispatch.append("execute if score @s cs.recipe matches %d run function %s:resolve/%s" % (r.index, NS, r.key))
    dispatch.append("scoreboard players set @s cs.recipe 0")
    dispatch += ["scoreboard players set @s cs.%s 0" % c for c in COUNTERS]
    pack.function("resolve/dispatch", [
        "# Turns the crafts counted since the last resolve into real items.",
    ] + dispatch)
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
    pack.function("spawner/give", [
        "# Arguments: id (e.g. minecraft:zombie), path (e.g. zombie), count",
        "$give @s %s $(count)" % spawner_item_snbt("$(id)", "$(path)"),
    ])

    # Player facing helpers
    pack.function("give", [
        "# Replacement for the plugin's /giveSpawner command.",
        '# Usage: /function %s:give {mob:"zombie",amount:1}' % NS,
        '$function %s:spawner/give {id:"minecraft:$(mob)",path:"$(mob)",count:$(amount)}' % NS,
        '$tellraw @s [{text:"Gave $(amount) ",color:"gold"},{translate:"entity.minecraft.$(mob)"},{text:" Spawner"}]',
    ])
    pack.function("give_item", [
        "# Gives condensed items, e.g.",
        '# /function %s:give_item {item:"super_condensed_bone",amount:8}' % NS,
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
    objectives = ["cs.recipe", "cs.tmp"] + ["cs." + c for c in COUNTERS]
    load = ["scoreboard objectives add %s dummy" % o for o in objectives]
    load.append("scoreboard objectives add cs.mined minecraft.mined:minecraft.spawner")
    load += ["scoreboard players set #%d cs.tmp %d" % (c, c) for c in sorted(constants)]
    pack.function("load", load)

    pack.function("tick", [
        "execute as @a[scores={cs.recipe=1..}] run function %s:resolve/dispatch" % NS,
        'clear @a %s[minecraft:custom_data~{%s:{group:"placeholder"}}]' % (PLACEHOLDER_ITEM, NS),
        "execute as @e[type=minecraft:item,tag=!cs.seen] run function %s:drop/check" % NS,
        "execute as @a[scores={cs.mined=1..}] run function %s:spawner/mined" % NS,
    ])

    uninstall = ["scoreboard objectives remove %s" % o for o in objectives + ["cs.mined"]]
    uninstall.append("data remove storage %s:tmp give" % NS)
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
    gen_items(pack)
    gen_spawner_mechanics(pack)
    gen_core(pack, recipes, constants)
    pack.write()
    return pack, recipes


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--zip", action="store_true", help="also write dist/craftable_spawners.zip")
    args = parser.parse_args()
    pack, recipes = generate()
    print("Wrote %d files for %d recipes to %s" % (len(pack.files), len(recipes), OUT))
    if args.zip:
        dist = REPO / "dist"
        dist.mkdir(exist_ok=True)
        archive = dist / "craftable_spawners.zip"
        with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as zf:
            for path in sorted(pack.files):
                zf.write(OUT / path, path)
        print("Wrote " + str(archive))


if __name__ == "__main__":
    main()
