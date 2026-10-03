tag @s add cs.seen
execute if items entity @s contents minecraft:spawner[minecraft:custom_data~{craftable_spawners:{group:"raw_spawner"}}] run return run function craftable_spawners:drop/fix
execute if items entity @s contents minecraft:command_block[minecraft:custom_data~{craftable_spawners:{group:"placeholder"}}] run kill @s
