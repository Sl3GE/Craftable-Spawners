# Replacement for the plugin's /giveSpawner command.
# Usage: /function craftable_spawners:give {mob:"zombie",amount:1}
$function craftable_spawners:spawner/give {id:"minecraft:$(mob)",path:"$(mob)",count:$(amount)}
$tellraw @s [{text:"Gave $(amount) ",color:"gold"},{translate:"entity.minecraft.$(mob)"},{text:" Spawner"}]
