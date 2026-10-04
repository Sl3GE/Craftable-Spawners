execute unless score @s cs.recipe matches 94 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 94
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_cod/root
recipe take @s craftable_spawners:spawner/cod
