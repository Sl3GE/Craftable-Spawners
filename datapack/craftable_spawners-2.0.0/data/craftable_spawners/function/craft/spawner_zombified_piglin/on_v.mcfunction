execute unless score @s cs.recipe matches 60 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 60
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_zombified_piglin/root
