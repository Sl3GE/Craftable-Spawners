execute unless score @s cs.recipe matches 92 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 92
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_cat/root
recipe take @s craftable_spawners:spawner/cat
