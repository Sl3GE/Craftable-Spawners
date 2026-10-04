execute unless score @s cs.recipe matches 23 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 23
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_chicken/root
recipe take @s craftable_spawners:condense/chicken
