execute unless score @s cs.recipe matches 27 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 27
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_rotten_flesh/root
recipe take @s craftable_spawners:uncondense/rotten_flesh
