execute unless score @s cs.recipe matches 101 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 101
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_breeze_rod/root
recipe take @s craftable_spawners:uncondense/breeze_rod
