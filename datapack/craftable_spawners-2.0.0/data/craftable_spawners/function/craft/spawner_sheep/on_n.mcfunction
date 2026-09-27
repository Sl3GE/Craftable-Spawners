execute unless score @s cs.recipe matches 67 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 67
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_sheep/root
