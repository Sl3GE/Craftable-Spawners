execute unless score @s cs.recipe matches 28 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 28
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_sweet_berries/root
recipe take @s craftable_spawners:condense/sweet_berries
