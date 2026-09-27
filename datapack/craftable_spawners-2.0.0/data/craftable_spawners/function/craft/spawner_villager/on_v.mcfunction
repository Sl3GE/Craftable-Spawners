execute unless score @s cs.recipe matches 72 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 72
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_villager/root
