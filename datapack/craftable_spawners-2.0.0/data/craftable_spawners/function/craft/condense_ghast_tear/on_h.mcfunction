execute unless score @s cs.recipe matches 9 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 9
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_ghast_tear/root
recipe take @s craftable_spawners:condense/ghast_tear
