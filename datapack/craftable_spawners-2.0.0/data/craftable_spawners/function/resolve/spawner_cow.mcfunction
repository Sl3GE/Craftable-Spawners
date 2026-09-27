# craftable_spawners:spawner/cow (spawner)
scoreboard players set #cursor cs.tmp 0
execute if items entity @s player.cursor minecraft:command_block[minecraft:custom_data~{craftable_spawners:{group:"placeholder"}}] run scoreboard players set #cursor cs.tmp 1
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/spawner_cow with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:spawner/give_cow with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.b1
scoreboard players operation #r cs.tmp -= @s cs.b2
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/beef with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/beef with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.b1
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_beef with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_beef with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a1
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/condensed_leather with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/condensed_leather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp -= @s cs.a1
scoreboard players operation #r cs.tmp -= @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.n
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/leather with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/leather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.b2
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #5 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/super_condensed_beef with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/super_condensed_beef with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.a2
scoreboard players operation #t cs.tmp = @s cs.v
scoreboard players operation #t cs.tmp *= #3 cs.tmp
scoreboard players operation #r cs.tmp -= #t cs.tmp
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/super_condensed_leather with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/super_condensed_leather with storage craftable_spawners:tmp give
scoreboard players set #r cs.tmp 0
scoreboard players operation #r cs.tmp += @s cs.n
scoreboard players operation #r cs.tmp -= @s cs.v
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/vanilla_iron_bars with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/iron_bars with storage craftable_spawners:tmp give
