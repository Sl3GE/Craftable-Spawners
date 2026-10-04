execute unless score @s cs.recipe matches 55 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 55
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_potent_sulfur/root
recipe take @s craftable_spawners:condense/potent_sulfur
