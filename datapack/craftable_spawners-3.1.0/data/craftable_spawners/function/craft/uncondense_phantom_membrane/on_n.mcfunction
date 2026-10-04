execute unless score @s cs.recipe matches 103 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 103
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_phantom_membrane/root
recipe take @s craftable_spawners:uncondense/phantom_membrane
