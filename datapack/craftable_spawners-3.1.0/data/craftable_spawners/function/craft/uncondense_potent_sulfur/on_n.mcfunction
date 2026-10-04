execute unless score @s cs.recipe matches 116 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 116
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_potent_sulfur/root
recipe take @s craftable_spawners:uncondense/potent_sulfur
