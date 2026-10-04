# Future spawner support

Java Edition 26.3 mobs with a spawn egg and **no** craftable-spawner recipe yet.

Already in the pack (22): blaze, chicken, cow, creeper, enderman, ghast, horse, iron golem, magma cube, pig, sheep, skeleton, slime, snow golem, spider, squid, villager, witch, wither, wither skeleton, zombie, zombified piglin.

Proposed recipes below are **not** in the pack. Same rules as the existing ones: **Iron Bars** in the center, `C` = Condensed, `SC` = Super Condensed. A layout is the base item in each slot. Condensed and Super Condensed share that item id, so a proposal cannot reuse an existing layout at the other tier. Each recipe uses one or two condensed items (the generator tracks at most two).

Items marked **C only** get no Super Condensed tier, same as nether star, ghast tear, and the storage blocks. Everything else is proposed with both tiers; the recipe asks for Super Condensed.

## Proposed recipes

| Mob (`id`) | Custom items |
| --- | --- |
| allay | 8 SC amethyst shard |
| armadillo | 8 SC armadillo scute |
| axolotl | 4 SC tropical fish (sides) |
| bee | 8 SC honeycomb |
| bogged | 3 SC red mushroom (top) + 5 SC bone |
| breeze | 8 SC breeze rod |
| camel | 8 SC cactus |
| camel_husk | 3 SC cactus (top) + 5 SC rotten flesh |
| cat | 4 SC string (corners) |
| cave_spider | 4 SC spider eye (corners) + 4 SC string (sides) |
| cod | 8 SC cod |
| creaking | 8 C resin block |
| dolphin | 4 SC cod (sides) |
| drowned | 3 SC prismarine block (top) + 5 SC rotten flesh |
| elder_guardian | 8 C wet sponge |
| endermite | 4 SC ender pearl (sides) |
| evoker | 8 C totem of undying |
| fox | 8 SC sweet berries |
| frog | 8 C ochre froglight |
| glow_squid | 8 SC glow ink sac |
| goat | 8 C goat horn |
| guardian | 8 SC prismarine block |
| hoglin | 3 SC crimson fungus (top) + 5 SC porkchop |
| husk | 3 SC sand (top) + 5 SC rotten flesh |
| llama | 3 SC white wool (top) + 5 SC leather |
| mooshroom | 3 SC red mushroom (top) + 5 SC beef |
| nautilus | 8 C nautilus shell |
| ocelot | 4 SC cod (corners) + 4 SC salmon (sides) |
| panda | 8 SC bamboo block |
| parched | 3 SC sand (top) + 5 SC bone |
| parrot | 8 SC feather |
| phantom | 8 SC phantom membrane |
| piglin | 4 SC gold block (sides) |
| piglin_brute | 4 SC gold block (corners) + 4 SC iron block (sides) |
| polar_bear | 3 SC salmon (top) + 5 SC cod |
| pufferfish | 8 SC pufferfish |
| rabbit | 3 SC rabbit hide (top) + 5 SC rabbit |
| ravager | 8 C saddle |
| salmon | 8 SC salmon |
| shulker | 8 C shulker shell |
| silverfish | 8 SC cobblestone |
| skeleton_horse | 3 SC leather (top) + 5 SC bone |
| sniffer | 4 SC torchflower seeds (corners) + 4 SC pitcher pod (sides) |
| stray | 3 SC snow block (top) + 5 SC bone |
| strider | 3 SC warped fungus (top) + 5 SC string |
| sulfur_cube | 4 C potent sulfur (corners) + 4 C slime block (sides) |
| tadpole | 4 C ochre froglight (sides) |
| tropical_fish | 8 SC tropical fish |
| turtle | 3 SC turtle scute (top) + 5 SC seagrass |
| warden | 8 C sculk catalyst |
| wolf | 4 SC bone (sides) |
| zoglin | 3 SC rotten flesh (top) + 5 SC porkchop |
| zombie_horse | 3 SC rotten flesh (top) + 5 SC leather |
| zombie_nautilus | 3 C nautilus shell (top) + 5 SC rotten flesh |
| zombie_villager | 3 C emerald block (top) + 5 SC rotten flesh |

55 mobs. Also no egg (unused in vanilla survival): `giant`, `illusioner`.

## New condensed items

Super Condensed tier: armadillo scute, honeycomb, sweet berries, bamboo block, rabbit, rabbit hide, glow ink sac, pufferfish, cod, salmon, tropical fish, amethyst shard, torchflower seeds, pitcher pod, breeze rod, prismarine block, phantom membrane, seagrass, turtle scute, cactus, red mushroom, warped fungus, crimson fungus, cobblestone, spider eye, sand.

Condensed only: goat horn, nautilus shell, ochre froglight, potent sulfur, resin block, wet sponge, sculk catalyst, totem of undying, saddle, shulker shell.

Reused from the current pack, in a new layout: string, feather, bone, white wool, leather, beef, rotten flesh, porkchop, snow block, ender pearl, gold block, iron block, emerald block, slime block.

Gold block and iron block are condensed-only today. These two recipes need a Super Condensed tier for both. Zombified piglin keeps the full ring of condensed gold blocks, and the iron golem keeps the full ring of condensed iron blocks.

## Where the ingredient is not a kill drop

Tipped arrows are not used. Stray, bogged, and parched each drop a different tipped arrow, but every tipped arrow is the same item id, so the recipe could not tell them apart. Goat horns of every instrument share one id too; the goat recipe accepts any horn.

| Mob | Stand-in | Why |
| --- | --- | --- |
| camel | cactus | No kill drop. Camels eat cactus. Camel husk keeps the cactus row and fills the rest with rotten flesh. |
| wolf | bone | No kill drop. Bones tame wolves. Four sides, against the skeleton's full ring. |
| bee | honeycomb | No kill drop. Honeycomb comes from the nest. |
| fox | sweet berries | No kill drop. Foxes breed with them and often hold them. |
| goat | goat horn | Horns come from ramming, not from dying. |
| ocelot | cod + salmon | No kill drop. Ocelots trust either fish. The fish mobs keep the full rings. |
| panda | bamboo block | Pandas drop bamboo. The recipe uses blocks of bamboo crafted from that drop. |
| axolotl | tropical fish | No kill drop. Axolotls breed with tropical fish. |
| frog, tadpole | ochre froglight | Neither drops an item. A frog makes ochre froglight by eating a magma cube. The other two froglights are left out so the item stays one id. Tadpole is the same item on the sides only. |
| allay | amethyst shard | No kill drop. Amethyst shards duplicate allays. |
| sniffer | torchflower seeds + pitcher pod | No kill drop. Sniffers dig both up. |
| sulfur_cube | potent sulfur + slime block | No kill drop. Sulfur is mined in sulfur caves, and nine sulfur craft one potent sulfur. Condensed slime blocks sit on the sides. The slime spawner keeps the full ring. |
| bogged | red mushroom | Bones are the kill drop (skeleton already uses a full ring). Shearing a bogged drops mushrooms. |
| drowned | prismarine block | The kill drop is rotten flesh (zombie keeps the full ring). Three super condensed prismarine blocks sit on the top row. Guardians keep the full ring of super condensed prismarine blocks. |
| husk, parched | sand | Kill drops match zombie and skeleton. Sand is the desert item those two share, with rotten flesh or bone as the body. |
| stray | snow block | Kill drop is bone. Snow block is the existing cold item (snow golem keeps pumpkin + snow). |
| creaking | resin block | The mob drops nothing. Resin clumps come from the creaking heart, and nine clumps craft a block of resin. |
| silverfish | cobblestone | No drop. Stand-in for the infested stone they leave. |
| piglin | gold block | Piglins pick up and barter for gold. Their kill drop is worn gold gear. Four on the sides, against the zombified piglin's full ring. |
| piglin_brute | gold block + iron block | The kill drop is a golden axe, which has durability. Gold blocks on the corners, iron blocks on the sides. |
| endermite | ender pearl | No drop. Endermen keep the full ring; an endermite is the sides only. |
| hoglin | crimson fungus | Porkchop is the kill drop (pig keeps the full ring). Crimson fungus is the crimson-forest food. |
| strider | warped fungus | String is the kill drop (spider keeps the full ring). Warped fungus is the strider food. |
| turtle | turtle scute | Seagrass is the kill drop. A scute drops when a baby turtle grows up. |
| zombie_nautilus | nautilus shell | The kill drop is rotten flesh. The shell is the nautilus rare drop, used here as the top row. |
| zombie_villager | emerald block | The kill drop is rotten flesh. Three condensed emerald blocks sit on the top row. Villagers keep four condensed emerald blocks on the sides. |
