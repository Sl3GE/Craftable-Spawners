execute unless score @s cs.recipe matches 109 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 109
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_crimson_fungus/root
recipe take @s craftable_spawners:uncondense/crimson_fungus
