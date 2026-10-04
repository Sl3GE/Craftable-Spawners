$item replace entity @s player.cursor with minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"minecraft:dolphin"}}},minecraft:item_name=[{translate:"entity.minecraft.dolphin",color:"gold"},{text:" Spawner"}],minecraft:custom_data={craftable_spawners:{spawner:"minecraft:dolphin"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
