execute unless score @s cs.recipe matches 31 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 31
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_ender_pearl/root
recipe take @s craftable_spawners:uncondense/ender_pearl
