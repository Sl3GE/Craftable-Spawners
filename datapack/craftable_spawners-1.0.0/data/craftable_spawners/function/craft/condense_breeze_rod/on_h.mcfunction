execute unless score @s cs.recipe matches 40 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 40
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_breeze_rod/root
recipe take @s craftable_spawners:condense/breeze_rod
