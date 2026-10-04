execute unless score @s cs.recipe matches 190 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 190
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_sulfur_cube/root
recipe take @s craftable_spawners:spawner/sulfur_cube
