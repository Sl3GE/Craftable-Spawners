execute unless score @s cs.recipe matches 62 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 62
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_wither_skeleton/root
