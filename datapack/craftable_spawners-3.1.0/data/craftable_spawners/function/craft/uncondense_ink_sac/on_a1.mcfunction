execute unless score @s cs.recipe matches 83 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 83
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_ink_sac/root
recipe take @s minecraft:black_dye
