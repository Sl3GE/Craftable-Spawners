# Craftable Spawners

A Minecraft **Java Edition 26.3** data pack that lets players craft mob spawners
without any commands.

## Installation

1. Copy `datapack/craftable_spawners-<version>` into your world's `datapacks`
   folder (or run `python3 tools/generate_datapack.py --zip` and drop
   `dist/craftable_spawners-<version>.zip` in instead).
2. Run `/reload` or restart the world.

## How it works in game

* **Condensing**: 9 of an item in a crafting table make 1 *Condensed* item.
* **Un-condensing**: put a single condensed item in any crafting grid to get the
  9 items back (for bone, blaze rod, ink sac and storage blocks you get the
  vanilla output plus the rest of the value, e.g. 3 bone meal + 8 bones).
* **Spawners**: surround Iron Bars with condensed items (recipes below).
* **Silk Touch** mining a spawner drops it with its mob kept. Placing it
  restores the mob, even for players who are not operators.

Condensing shows the real Condensed item in the result slot, so clicking or
shift-clicking it stacks exactly like a vanilla craft. Vanilla recipes only
check item types, so the result slot can't tell a condensed item from a plain
one:

* Un-condensing shows a single plain item, but a Condensed item gives 9.
* Spawner recipes show a preview spawner that turns into the real one.

The swap happens in the same instant as the craft. If the grid held the wrong
items (for example plain bones in a spawner recipe), the craft is undone and
every ingredient is given back. Crafter blocks can condense plain items. Don't
feed them Condensed items, because Crafters can't tell them from plain items and the
extra value is lost. They also can't make spawners or un-condense, so use a
crafting table for those.

### Condensable items

Bone, rotten flesh, blaze rod, gunpowder, string, ender pearl, slime block,
magma cream, ghast tear, gold block, nether star, wither skeleton skull,
redstone block, iron block, leather, beef, carved pumpkin, snow block, white
wool, mutton, porkchop, ink sac, chicken, feather, emerald block.

### Spawner recipes

All recipes have Iron Bars in the center.

| Spawner | Surrounded by |
| --- | --- |
| Skeleton, Zombie, Blaze, Creeper, Spider, Enderman, Magma Cube | 8 Condensed bone / rotten flesh / blaze rod / gunpowder / string / ender pearl / magma cream |
| Pig, Horse, Squid | 8 Condensed porkchop / leather / ink sac |
| Slime, Ghast, Zombified Piglin, Wither, Wither Skeleton, Iron Golem | 8 Condensed slime block / ghast tear / gold block / nether star / wither skeleton skull / iron block |
| Villager | 4 Condensed Emerald Blocks on the sides (corners empty) |
| Witch | 4 Condensed Gunpowder (corners) + 4 Condensed Redstone Blocks (sides) |
| Cow | 3 Condensed Leather (top row) + 5 Condensed Beef |
| Chicken | 3 Condensed Feather (top row) + 5 Condensed Chicken |
| Sheep | 3 Condensed White Wool (top row) + 5 Condensed Mutton |
| Snow Golem | 3 Condensed Carved Pumpkin (top row) + 5 Condensed Snow Block |

## Commands (operators)

Operators can give spawners and condensed items:

```
/function craftable_spawners:give {mob:"zombie",amount:1}
/function craftable_spawners:give_item {item:"condensed_bone",amount:8}
```

To remove the pack cleanly, run `/function craftable_spawners:uninstall` and
then `/datapack disable "file/craftable_spawners-<version>"`.

## Development

The data pack is generated. Edit `tools/generate_datapack.py` (the version and
the item and recipe tables are at the top), then run:

```
python3 tools/generate_datapack.py
python3 tools/test_accounting.py
```

`test_accounting.py` simulates random crafts (plain and condensed items mixed)
against the generated advancements and checks that every craft resolves to
exactly the right items or refund.
