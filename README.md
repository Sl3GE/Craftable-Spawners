# Craftable Spawners

A Minecraft **Java Edition 26.3** data pack that lets players craft mob spawners
without any commands. It is a port of the original 1.16 Spigot plugin (whose
source is still in `src/` for reference).

## Installation

1. Copy the `datapack` folder into your world's `datapacks` folder and rename
   it to `craftable_spawners` (or run `python3 tools/generate_datapack.py --zip`
   and drop `dist/craftable_spawners.zip` in instead).
2. Run `/reload` or restart the world.

## How it works in game

* **Condensing**: 9 of an item in a crafting table make 1 *Condensed* item, and
  9 *Condensed* items make 1 *Super Condensed* item.
* **Un-condensing**: put a single condensed item in any crafting grid to get the
  9 items back (for bone, blaze rod, ink sac and storage blocks you get the
  vanilla output plus the rest of the value, e.g. 3 bone meal + 8 bones).
* **Spawners**: surround Iron Bars with condensed items (recipes below).
* **Silk Touch** mining a spawner drops it with its mob kept. Placing it
  restores the mob, even for players who are not operators.

While crafting, the result slot shows a preview item. When you take it, it is
replaced with the real result on the next tick. If the grid held the wrong
items (for example plain bones in a spawner recipe), the craft is undone and
every ingredient is given back. Crafter blocks produce only the preview item,
so use a crafting table.

### Condensable items

Condensed and Super Condensed: bone, rotten flesh, blaze rod, gunpowder, string,
ender pearl, magma cream, redstone block, leather, beef, carved pumpkin, snow
block, white wool, mutton, porkchop, ink sac, chicken, feather.

Condensed only: slime block, ghast tear, gold block, nether star, wither
skeleton skull, iron block, emerald block.

### Spawner recipes

All recipes have Iron Bars in the center.

| Spawner | Surrounded by |
| --- | --- |
| Skeleton, Zombie, Blaze, Creeper, Spider, Enderman, Magma Cube | 8 Super Condensed bone / rotten flesh / blaze rod / gunpowder / string / ender pearl / magma cream |
| Pig, Horse, Squid | 8 Super Condensed porkchop / leather / ink sac |
| Slime, Ghast, Zombified Piglin, Wither, Wither Skeleton, Iron Golem | 8 Condensed slime block / ghast tear / gold block / nether star / wither skeleton skull / iron block |
| Villager | 4 Condensed Emerald Blocks on the sides (corners empty) |
| Witch | 4 Super Condensed Gunpowder (corners) + 4 Super Condensed Redstone Blocks (sides) |
| Cow | 3 Super Condensed Leather (top row) + 5 Super Condensed Beef |
| Chicken | 3 Super Condensed Feather (top row) + 5 Super Condensed Chicken |
| Sheep | 3 Super Condensed White Wool (top row) + 5 Super Condensed Mutton |
| Snow Golem | 3 Super Condensed Carved Pumpkin (top row) + 5 Super Condensed Snow Block |

## Commands (operators)

The plugin's `/giveSpawner <entityType> <amount>` is now a function:

```
/function craftable_spawners:give {mob:"zombie",amount:1}
/function craftable_spawners:give_item {item:"super_condensed_bone",amount:8}
```

To remove the pack cleanly, run `/function craftable_spawners:uninstall` and
then `/datapack disable "file/craftable_spawners"`.

## Development

The data pack is generated. Edit `tools/generate_datapack.py` (the item and
recipe tables are at the top), then run:

```
python3 tools/generate_datapack.py
python3 tools/test_accounting.py
```

`test_accounting.py` simulates random crafts (plain, condensed and super
condensed items mixed) against the generated advancements and checks that
every craft resolves to exactly the right items or refund.
