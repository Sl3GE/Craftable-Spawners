execute unless score @s cs.recipe matches 30 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 30
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_string/root
recipe take @s craftable_spawners:uncondense/string
