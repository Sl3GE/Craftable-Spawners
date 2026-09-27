execute unless score @s cs.recipe matches 2 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 2
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_rotten_flesh/root
