execute unless score @s cs.recipe matches 40 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 40
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_leather/root
recipe take @s craftable_spawners:uncondense/leather
