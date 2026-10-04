# Future spawner support

Java Edition 26.3 mobs with a spawn egg and **no** craftable-spawner recipe yet.

Already in the pack (77): every mob that has a spawn egg. Recipes are in `docs/existing-spawner-support.md`.

None missing. Also no egg (unused in vanilla survival): `giant`, `illusioner`.

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
| drowned | prismarine | The kill drop is rotten flesh (zombie keeps the full ring). Three condensed prismarine sit on the top row. Guardians keep the full ring of condensed prismarine. |
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
