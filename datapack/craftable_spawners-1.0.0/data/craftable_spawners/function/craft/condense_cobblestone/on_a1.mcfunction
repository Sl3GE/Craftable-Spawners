execute unless score @s cs.recipe matches 49 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 49
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_cobblestone/root
recipe take @s craftable_spawners:condense/cobblestone
