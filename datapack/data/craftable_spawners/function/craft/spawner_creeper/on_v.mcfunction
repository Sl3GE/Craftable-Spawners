execute unless score @s cs.recipe matches 54 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 54
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_creeper/root
