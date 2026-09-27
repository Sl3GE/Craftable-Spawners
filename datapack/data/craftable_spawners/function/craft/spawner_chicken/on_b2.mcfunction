execute unless score @s cs.recipe matches 71 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 71
scoreboard players add @s cs.b2 1
advancement revoke @s from craftable_spawners:craft/spawner_chicken/root
