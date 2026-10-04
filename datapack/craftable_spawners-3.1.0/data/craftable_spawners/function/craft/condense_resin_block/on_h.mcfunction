execute unless score @s cs.recipe matches 56 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 56
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_resin_block/root
recipe take @s craftable_spawners:condense/resin_block
