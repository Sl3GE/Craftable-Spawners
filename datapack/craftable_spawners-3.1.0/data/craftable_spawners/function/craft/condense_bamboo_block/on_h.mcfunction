execute unless score @s cs.recipe matches 29 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 29
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_bamboo_block/root
recipe take @s craftable_spawners:condense/bamboo_block
