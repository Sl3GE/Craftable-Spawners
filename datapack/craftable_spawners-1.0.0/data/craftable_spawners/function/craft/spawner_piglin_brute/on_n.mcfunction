execute unless score @s cs.recipe matches 117 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 117
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_piglin_brute/root
recipe take @s craftable_spawners:spawner/piglin_brute
