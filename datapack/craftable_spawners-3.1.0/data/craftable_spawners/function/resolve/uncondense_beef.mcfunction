# craftable_spawners:uncondense/beef (uncondense): runs right after one craft
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a1
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
scoreboard players operation #r cs.tmp -= @s cs.a2
execute if score #r cs.tmp matches ..-1 run function craftable_spawners:take/beef
execute if items entity @s player.cursor * run scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
scoreboard players operation #t cs.tmp = @s cs.a1
scoreboard players operation #t cs.tmp *= #8 cs.tmp
scoreboard players operation #r cs.tmp += #t cs.tmp
scoreboard players operation #r cs.tmp -= @s cs.a2
execute store result storage craftable_spawners:tmp give.count int 1 run scoreboard players get #r cs.tmp
execute if score #cursor cs.tmp matches 1 if score #r cs.tmp matches 1..64 run function craftable_spawners:cursor/beef with storage craftable_spawners:tmp give
execute if score #r cs.tmp matches 1.. run function craftable_spawners:item/beef with storage craftable_spawners:tmp give
