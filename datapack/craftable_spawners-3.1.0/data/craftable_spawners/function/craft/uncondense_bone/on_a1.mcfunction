execute unless score @s cs.recipe matches 62 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 62
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_bone/root
recipe take @s minecraft:bone_meal
