execute unless score @s cs.recipe matches 27 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 27
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_honeycomb_block/root
recipe take @s craftable_spawners:condense/honeycomb_block
