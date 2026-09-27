execute unless score @s cs.recipe matches 17 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 17
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_carved_pumpkin/root
