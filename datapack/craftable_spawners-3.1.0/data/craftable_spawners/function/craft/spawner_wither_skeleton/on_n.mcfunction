execute unless score @s cs.recipe matches 134 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 134
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_wither_skeleton/root
recipe take @s craftable_spawners:spawner/wither_skeleton
