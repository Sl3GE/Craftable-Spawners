execute unless score @s cs.recipe matches 85 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 85
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_feather/root
recipe take @s craftable_spawners:uncondense/feather
