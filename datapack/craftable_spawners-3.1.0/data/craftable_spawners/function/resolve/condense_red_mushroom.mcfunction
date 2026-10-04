# craftable_spawners:condense/red_mushroom (condense): runs right after one craft
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.h
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #9 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute if score #r cs.tmp matches ..-1 run function craftable_spawners:take/condensed_red_mushroom
execute if items entity @s player.cursor * run scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.h
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #9 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_red_mushroom with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_red_mushroom with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.h
scoreboard players operation #t cs.tmp *= #9 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/red_mushroom with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/red_mushroom with storage craftable_spawners:tmp give
