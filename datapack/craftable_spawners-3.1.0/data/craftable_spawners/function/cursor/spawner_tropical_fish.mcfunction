$item replace entity @s player.cursor with minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:tropical_fish"}}},minecraft:item_name=[{translate:"entity.minecraft.tropical_fish",color:"gold"},{text:" Spawner"}],minecraft:custom_data={craftable_spawners:{spawner:"minecraft:tropical_fish"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
