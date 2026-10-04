$item replace entity @s player.cursor with minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:husk"}}},minecraft:item_name=[{translate:"entity.minecraft.husk",color:"gold"},{text:" Spawner"}],minecraft:custom_data={craftable_spawners:{spawner:"minecraft:husk"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
