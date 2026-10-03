execute unless score @s cs.recipe matches 18 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 18
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_snow_block/root
recipe take @s craftable_spawners:condense/snow_block
