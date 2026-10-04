execute unless score @s cs.recipe matches 155 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 155
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_cod/root
recipe take @s craftable_spawners:spawner/cod
