execute unless score @s cs.recipe matches 1 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 1
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_bone/root
recipe take @s craftable_spawners:condense/bone
