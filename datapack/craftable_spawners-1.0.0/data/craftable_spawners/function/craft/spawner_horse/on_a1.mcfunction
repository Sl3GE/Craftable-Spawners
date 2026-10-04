execute unless score @s cs.recipe matches 80 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 80
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_horse/root
recipe take @s craftable_spawners:spawner/horse
