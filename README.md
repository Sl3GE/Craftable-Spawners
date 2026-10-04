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
  9 items back (for bone, blaze rod, ink sac, storage blocks, bamboo blocks, and
  resin blocks you get the vanilla output plus the rest of the value, e.g. 3
  bone meal + 8 bones, 2 bamboo planks + 8 bamboo blocks, or 9 resin clumps +
  8 resin blocks).
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
wool, mutton, porkchop, ink sac, chicken, feather, emerald block, armadillo
scute, honeycomb block, sweet berries, block of bamboo, rabbit, rabbit hide,
glow ink sac, pufferfish, cod, salmon, tropical fish, amethyst shard,
torchflower seeds, pitcher pod, breeze rod, prismarine, phantom membrane,
seagrass, turtle scute, cactus, red mushroom, warped fungus, crimson fungus,
cobblestone, spider eye, sand, goat horn, nautilus shell, ochre froglight,
potent sulfur, block of resin, wet sponge, sculk catalyst, totem of undying,
saddle, shulker shell.

### Spawner recipes

All recipes have Iron Bars in the center.

| Spawner | Surrounded by |
| --- | --- |
| Skeleton, Zombie, Blaze, Creeper, Spider, Enderman, Magma Cube | 8 Condensed bone / rotten flesh / blaze rod / gunpowder / string / ender pearl / magma cream |
| Pig, Horse, Squid, Slime, Ghast, Zombified Piglin, Wither, Wither Skeleton, Iron Golem | 8 Condensed porkchop / leather / ink sac / slime block / ghast tear / gold block / nether star / wither skeleton skull / iron block |
| Allay, Armadillo, Bee, Breeze, Camel, Cod, Creaking, Elder Guardian, Evoker, Fox, Frog, Glow Squid, Goat, Guardian, Nautilus, Panda, Parrot, Phantom, Pufferfish, Ravager, Salmon, Shulker, Silverfish, Tropical Fish, Warden | 8 Condensed amethyst shard / armadillo scute / honeycomb block / breeze rod / cactus / cod / resin block / wet sponge / totem of undying / sweet berries / ochre froglight / glow ink sac / goat horn / prismarine / nautilus shell / bamboo block / feather / phantom membrane / pufferfish / saddle / salmon / shulker shell / cobblestone / tropical fish / sculk catalyst |
| Villager | 4 Condensed Emerald Blocks on the sides (corners empty) |
| Axolotl, Dolphin, Endermite, Piglin, Tadpole, Wolf | 4 Condensed tropical fish / cod / ender pearl / gold block / ochre froglight / bone on the sides (corners empty) |
| Cat | 4 Condensed String (corners) |
| Witch | 4 Condensed Gunpowder (corners) + 4 Condensed Redstone Blocks (sides) |
| Cave Spider | 4 Condensed Spider Eye (corners) + 4 Condensed String (sides) |
| Ocelot | 4 Condensed Cod (corners) + 4 Condensed Salmon (sides) |
| Piglin Brute | 4 Condensed Gold Blocks (corners) + 4 Condensed Iron Blocks (sides) |
| Sniffer | 4 Condensed Torchflower Seeds (corners) + 4 Condensed Pitcher Pods (sides) |
| Sulfur Cube | 4 Condensed Potent Sulfur (corners) + 4 Condensed Slime Blocks (sides) |
| Cow, Chicken, Sheep, Snow Golem | 3 Condensed leather / feather / white wool / carved pumpkin (top row) + 5 Condensed beef / chicken / mutton / snow block |
| Bogged, Mooshroom | 3 Condensed Red Mushroom (top row) + 5 Condensed bone / beef |
| Camel Husk, Drowned, Husk, Zombie Nautilus, Zombie Villager | 3 Condensed cactus / prismarine / sand / nautilus shell / emerald block (top row) + 5 Condensed Rotten Flesh |
| Hoglin, Zoglin | 3 Condensed crimson fungus / rotten flesh (top row) + 5 Condensed Porkchop |
| Llama, Zombie Horse | 3 Condensed white wool / rotten flesh (top row) + 5 Condensed Leather |
| Parched, Stray, Skeleton Horse | 3 Condensed sand / snow block / leather (top row) + 5 Condensed Bone |
| Polar Bear | 3 Condensed Salmon (top row) + 5 Condensed Cod |
| Rabbit | 3 Condensed Rabbit Hide (top row) + 5 Condensed Rabbit |
| Strider | 3 Condensed Warped Fungus (top row) + 5 Condensed String |
| Turtle | 3 Condensed Turtle Scute (top row) + 5 Condensed Seagrass |

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
