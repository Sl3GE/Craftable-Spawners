execute unless score @s cs.recipe matches 19 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 19
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_white_wool/root
