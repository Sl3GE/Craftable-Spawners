execute unless score @s cs.recipe matches 41 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 41
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_prismarine/root
recipe take @s craftable_spawners:condense/prismarine
