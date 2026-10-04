execute unless score @s cs.recipe matches 140 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 140
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_pig/root
recipe take @s craftable_spawners:spawner/pig
