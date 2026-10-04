execute unless score @s cs.recipe matches 71 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 71
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_gold_block/root
recipe take @s minecraft:gold_ingot_from_gold_block
