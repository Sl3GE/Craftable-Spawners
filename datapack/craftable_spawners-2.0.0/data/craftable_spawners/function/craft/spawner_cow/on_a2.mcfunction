execute unless score @s cs.recipe matches 65 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 65
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/spawner_cow/root
