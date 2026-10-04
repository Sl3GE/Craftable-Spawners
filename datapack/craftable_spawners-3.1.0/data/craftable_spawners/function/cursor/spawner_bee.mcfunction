$item replace entity @s player.cursor with minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:bee"}}},minecraft:item_name=[{translate:"entity.minecraft.bee",color:"gold"},{text:" Spawner"}],minecraft:custom_data={craftable_spawners:{spawner:"minecraft:bee"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
