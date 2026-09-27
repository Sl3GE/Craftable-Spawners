# minecraft:redstone (uncondense_vanilla)
scoreboard players set #cursor cs.tmp 0
execute if items entity @s player.cursor minecraft:command_block[minecraft:custom_data~{craftable_spawners:{group:"placeholder"}}] run scoreboard players set #cursor cs.tmp 1
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a2
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_redstone_block with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_redstone_block with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a1
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
scoreboard players operation #t cs.tmp = @s cs.a2
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/redstone_block with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/redstone_block with storage craftable_spawners:tmp give
