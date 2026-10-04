execute unless score @s cs.recipe matches 11 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 11
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_nether_star/root
recipe take @s craftable_spawners:condense/nether_star
