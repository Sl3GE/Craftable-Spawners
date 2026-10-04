execute unless score @s cs.recipe matches 96 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 96
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_salmon/root
recipe take @s craftable_spawners:uncondense/salmon
