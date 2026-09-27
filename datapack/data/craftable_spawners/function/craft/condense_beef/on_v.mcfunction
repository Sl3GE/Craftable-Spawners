execute unless score @s cs.recipe matches 16 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 16
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_beef/root
