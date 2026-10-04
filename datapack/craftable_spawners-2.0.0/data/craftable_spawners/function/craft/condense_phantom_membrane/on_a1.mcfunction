execute unless score @s cs.recipe matches 42 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 42
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_phantom_membrane/root
recipe take @s craftable_spawners:condense/phantom_membrane
