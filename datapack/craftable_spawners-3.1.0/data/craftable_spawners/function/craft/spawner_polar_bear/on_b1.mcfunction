execute unless score @s cs.recipe matches 179 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 179
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_polar_bear/root
recipe take @s craftable_spawners:spawner/polar_bear
