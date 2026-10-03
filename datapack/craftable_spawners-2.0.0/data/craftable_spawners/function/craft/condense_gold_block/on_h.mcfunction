execute unless score @s cs.recipe matches 10 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 10
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_gold_block/root
recipe take @s craftable_spawners:condense/gold_block
