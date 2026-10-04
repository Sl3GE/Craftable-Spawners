execute unless score @s cs.recipe matches 76 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 76
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_leather/root
recipe take @s craftable_spawners:uncondense/leather
