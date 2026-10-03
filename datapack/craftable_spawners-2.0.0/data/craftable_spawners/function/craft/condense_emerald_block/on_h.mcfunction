execute unless score @s cs.recipe matches 25 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 25
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_emerald_block/root
recipe take @s craftable_spawners:condense/emerald_block
