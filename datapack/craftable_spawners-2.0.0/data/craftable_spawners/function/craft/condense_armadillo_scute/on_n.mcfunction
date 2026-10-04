execute unless score @s cs.recipe matches 26 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 26
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_armadillo_scute/root
recipe take @s craftable_spawners:condense/armadillo_scute
