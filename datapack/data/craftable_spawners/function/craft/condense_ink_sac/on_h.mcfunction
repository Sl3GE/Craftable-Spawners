execute unless score @s cs.recipe matches 22 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 22
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_ink_sac/root
