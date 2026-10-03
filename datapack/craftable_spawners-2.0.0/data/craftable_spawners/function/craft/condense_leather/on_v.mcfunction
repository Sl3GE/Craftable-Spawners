execute unless score @s cs.recipe matches 15 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 15
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_leather/root
recipe take @s craftable_spawners:condense/leather
