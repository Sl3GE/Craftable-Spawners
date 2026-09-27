# Arguments: id (e.g. minecraft:zombie), path (e.g. zombie), count
$give @s minecraft:spawner[minecraft:block_entity_data={id:"minecraft:mob_spawner",SpawnData:{entity:{id:"$(id)"}}},minecraft:item_name=[{translate:"entity.minecraft.$(path)",color:"gold"},{text:" Spawner"}],minecraft:custom_data={craftable_spawners:{spawner:"$(id)"}}] $(count)
