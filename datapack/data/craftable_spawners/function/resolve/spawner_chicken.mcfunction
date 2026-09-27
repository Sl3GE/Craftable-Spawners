# craftable_spawners:spawner/chicken (spawner)
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.b1
scoreboard players operation #r cs.tmp -= @s cs.b2
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/chicken with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.b1
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_chicken with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_feather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/feather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:spawner/give_chicken with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.b2
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/super_condensed_chicken with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/super_condensed_feather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.n
scoreboard players operation #r cs.tmp -= @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/iron_bars with storage craftable_spawners:tmp give
