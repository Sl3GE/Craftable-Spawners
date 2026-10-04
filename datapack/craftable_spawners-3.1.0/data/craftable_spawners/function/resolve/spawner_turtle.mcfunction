# craftable_spawners:spawner/turtle (spawner): runs right after one craft
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.n
execute if score #r cs.tmp matches ..-1 run function craftable_spawners:take/placeholder
execute if items entity @s player.cursor * run scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/spawner_turtle with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:spawner/give_turtle with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.b1
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_seagrass with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_seagrass with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_turtle_scute with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_turtle_scute with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.b1
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/seagrass with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/seagrass with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.a1
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/turtle_scute with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/turtle_scute with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.n
scoreboard players operation #r cs.tmp -= @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/vanilla_iron_bars with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/iron_bars with storage craftable_spawners:tmp give
