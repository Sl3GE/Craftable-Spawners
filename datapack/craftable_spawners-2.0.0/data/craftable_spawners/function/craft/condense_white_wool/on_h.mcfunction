execute unless score @s cs.recipe matches 19 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 19
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_white_wool/root
recipe take @s craftable_spawners:condense/white_wool
