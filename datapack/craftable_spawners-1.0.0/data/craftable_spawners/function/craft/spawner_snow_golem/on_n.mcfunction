execute unless score @s cs.recipe matches 77 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 77
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_snow_golem/root
recipe take @s craftable_spawners:spawner/snow_golem
