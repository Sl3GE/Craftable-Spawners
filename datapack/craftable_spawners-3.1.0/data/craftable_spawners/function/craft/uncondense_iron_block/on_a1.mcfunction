execute unless score @s cs.recipe matches 75 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 75
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_iron_block/root
recipe take @s minecraft:iron_ingot_from_iron_block
