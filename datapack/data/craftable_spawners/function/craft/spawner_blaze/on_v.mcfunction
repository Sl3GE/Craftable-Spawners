execute unless score @s cs.recipe matches 53 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 53
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_blaze/root
