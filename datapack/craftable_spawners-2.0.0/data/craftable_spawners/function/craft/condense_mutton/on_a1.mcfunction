execute unless score @s cs.recipe matches 20 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 20
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_mutton/root
recipe take @s craftable_spawners:condense/mutton
