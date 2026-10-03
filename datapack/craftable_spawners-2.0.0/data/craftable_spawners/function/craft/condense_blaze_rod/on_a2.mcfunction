execute unless score @s cs.recipe matches 3 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 3
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/condense_blaze_rod/root
recipe take @s craftable_spawners:condense/blaze_rod
