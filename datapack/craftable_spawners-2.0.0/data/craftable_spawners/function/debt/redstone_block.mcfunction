execute as @e[type=minecraft:item,distance=..8] if items entity @s contents minecraft:redstone_block[!minecraft:custom_data] run function craftable_spawners:debt/reduce
