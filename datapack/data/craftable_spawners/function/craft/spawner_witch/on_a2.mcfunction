execute unless score @s cs.recipe matches 63 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 63
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/spawner_witch/root
