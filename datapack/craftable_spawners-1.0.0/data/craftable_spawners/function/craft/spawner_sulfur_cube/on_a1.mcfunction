execute unless score @s cs.recipe matches 129 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 129
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_sulfur_cube/root
recipe take @s craftable_spawners:spawner/sulfur_cube
