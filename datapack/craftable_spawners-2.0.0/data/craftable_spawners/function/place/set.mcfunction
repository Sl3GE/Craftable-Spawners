$execute unless data block ~ ~ ~ SpawnData.entity.id run data merge block ~ ~ ~ {SpawnData:{entity:{id:"$(id)"}}}
$tellraw @s [{translate:"entity.minecraft.$(path)",color:"gold"},{text:" Spawner Placed!"}]
