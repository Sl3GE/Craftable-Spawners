execute unless score @s cs.recipe matches 64 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 64
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_blaze_rod/root
recipe take @s minecraft:blaze_powder
