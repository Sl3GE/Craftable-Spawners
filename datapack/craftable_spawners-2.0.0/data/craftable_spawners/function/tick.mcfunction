execute as @a[scores={cs.recipe=1..}] run function craftable_spawners:reset
execute as @a[scores={cs.debt=1..}] at @s run function craftable_spawners:debt/dispatch
clear @a minecraft:command_block[minecraft:custom_data~{craftable_spawners:{group:"placeholder"}}]
execute as @e[type=minecraft:item,tag=!cs.seen] run function craftable_spawners:drop/check
execute as @a[scores={cs.mined=1..}] run function craftable_spawners:spawner/mined
