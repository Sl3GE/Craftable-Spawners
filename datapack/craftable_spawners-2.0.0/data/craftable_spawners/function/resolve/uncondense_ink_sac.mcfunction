# minecraft:black_dye (uncondense_vanilla)
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a2
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_ink_sac with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a1
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
scoreboard players operation #t cs.tmp = @s cs.a2
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/ink_sac with storage craftable_spawners:tmp give
