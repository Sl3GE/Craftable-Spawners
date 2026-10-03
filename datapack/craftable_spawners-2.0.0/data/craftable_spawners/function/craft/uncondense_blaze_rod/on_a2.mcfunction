execute unless score @s cs.recipe matches 28 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 28
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/uncondense_blaze_rod/root
recipe take @s minecraft:blaze_powder
