execute unless score @s cs.recipe matches 66 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 66
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_snow_golem/root
