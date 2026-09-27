# craftable_spawners:condense/emerald_block (condense)
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.h
scoreboard players operation #r cs.tmp += @s cs.n
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #9 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_emerald_block with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.h
scoreboard players operation #t cs.tmp *= #9 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/emerald_block with storage craftable_spawners:tmp give
