execute unless score @s cs.recipe matches 34 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 34
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_cod/root
recipe take @s craftable_spawners:condense/cod
