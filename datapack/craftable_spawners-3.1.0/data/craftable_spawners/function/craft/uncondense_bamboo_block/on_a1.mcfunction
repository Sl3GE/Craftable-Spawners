execute unless score @s cs.recipe matches 90 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 90
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_bamboo_block/root
recipe take @s minecraft:bamboo_planks
