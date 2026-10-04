# Future spawner support

Java Edition 26.3 mobs with a spawn egg and **no** craftable-spawner recipe yet.

Already in the pack (22): blaze, chicken, cow, creeper, enderman, ghast, horse, iron golem, magma cube, pig, sheep, skeleton, slime, snow golem, spider, squid, villager, witch, wither, wither skeleton, zombie, zombified piglin.

Proposed recipes below are **not** in the pack. Same rules as the existing ones: **Iron Bars** in the center, `C` = Condensed. A layout is the base item in each slot. A proposal cannot reuse an existing layout, because the crafting recipe matches the base item id. Each recipe uses one or two condensed items (the generator tracks at most two).

## Proposed recipes

| Mob (`id`) | Custom items |
| --- | --- |
| allay | 8 C amethyst shard |
| armadillo | 8 C armadillo scute |
| axolotl | 4 C tropical fish (sides) |
| bee | 8 C honeycomb block |
| bogged | 3 C red mushroom (top) + 5 C bone |
| breeze | 8 C breeze rod |
| camel | 8 C cactus |
| camel_husk | 3 C cactus (top) + 5 C rotten flesh |
| cat | 4 C string (corners) |
| cave_spider | 4 C spider eye (corners) + 4 C string (sides) |
| cod | 8 C cod |
| creaking | 8 C resin block |
| dolphin | 4 C cod (sides) |
| drowned | 3 C prismarine block (top) + 5 C rotten flesh |
| elder_guardian | 8 C wet sponge |
| endermite | 4 C ender pearl (sides) |
| evoker | 8 C totem of undying |
| fox | 8 C sweet berries |
| frog | 8 C ochre froglight |
| glow_squid | 8 C glow ink sac |
| goat | 8 C goat horn |
| guardian | 8 C prismarine block |
| hoglin | 3 C crimson fungus (top) + 5 C porkchop |
| husk | 3 C sand (top) + 5 C rotten flesh |
| llama | 3 C white wool (top) + 5 C leather |
| mooshroom | 3 C red mushroom (top) + 5 C beef |
| nautilus | 8 C nautilus shell |
| ocelot | 4 C cod (corners) + 4 C salmon (sides) |
| panda | 8 C bamboo block |
| parched | 3 C sand (top) + 5 C bone |
| parrot | 8 C feather |
| phantom | 8 C phantom membrane |
| piglin | 4 C gold block (sides) |
| piglin_brute | 4 C gold block (corners) + 4 C iron block (sides) |
| polar_bear | 3 C salmon (top) + 5 C cod |
| pufferfish | 8 C pufferfish |
| rabbit | 3 C rabbit hide (top) + 5 C rabbit |
| ravager | 8 C saddle |
| salmon | 8 C salmon |
| shulker | 8 C shulker shell |
| silverfish | 8 C cobblestone |
| skeleton_horse | 3 C leather (top) + 5 C bone |
| sniffer | 4 C torchflower seeds (corners) + 4 C pitcher pod (sides) |
| stray | 3 C snow block (top) + 5 C bone |
| strider | 3 C warped fungus (top) + 5 C string |
| sulfur_cube | 4 C potent sulfur (corners) + 4 C slime block (sides) |
| tadpole | 4 C ochre froglight (sides) |
| tropical_fish | 8 C tropical fish |
| turtle | 3 C turtle scute (top) + 5 C seagrass |
| warden | 8 C sculk catalyst |
| wolf | 4 C bone (sides) |
| zoglin | 3 C rotten flesh (top) + 5 C porkchop |
| zombie_horse | 3 C rotten flesh (top) + 5 C leather |
| zombie_nautilus | 3 C nautilus shell (top) + 5 C rotten flesh |
| zombie_villager | 3 C emerald block (top) + 5 C rotten flesh |

55 mobs. Also no egg (unused in vanilla survival): `giant`, `illusioner`.

## New condensed items

Armadillo scute, honeycomb block, sweet berries, bamboo block, rabbit, rabbit hide, glow ink sac, pufferfish, cod, salmon, tropical fish, amethyst shard, torchflower seeds, pitcher pod, breeze rod, prismarine block, phantom membrane, seagrass, turtle scute, cactus, red mushroom, warped fungus, crimson fungus, cobblestone, spider eye, sand, goat horn, nautilus shell, ochre froglight, potent sulfur, resin block, wet sponge, sculk catalyst, totem of undying, saddle, shulker shell.

Reused from the current pack, in a new layout: string, feather, bone, white wool, leather, beef, rotten flesh, porkchop, snow block, ender pearl, gold block, iron block, emerald block, slime block.

Piglin uses four condensed gold blocks on the sides, and the zombified piglin keeps the full ring. Piglin brute uses gold blocks on the corners and iron blocks on the sides, and the iron golem keeps the full ring of condensed iron blocks.

## Where the ingredient is not a kill drop

Tipped arrows are not used. Stray, bogged, and parched each drop a different tipped arrow, but every tipped arrow is the same item id, so the recipe could not tell them apart. Goat horns of every instrument share one id too; the goat recipe accepts any horn.

| Mob | Stand-in | Why |
| --- | --- | --- |
| camel | cactus | No kill drop. Camels eat cactus. Camel husk keeps the cactus row and fills the rest with rotten flesh. |
| wolf | bone | No kill drop. Bones tame wolves. Four sides, against the skeleton's full ring. |
| bee | honeycomb block | No kill drop. Honeycomb comes from the nest. The recipe uses honeycomb blocks crafted from that. |
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
| drowned | prismarine block | The kill drop is rotten flesh (zombie keeps the full ring). Three condensed prismarine blocks sit on the top row. Guardians keep the full ring of condensed prismarine blocks. |
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
