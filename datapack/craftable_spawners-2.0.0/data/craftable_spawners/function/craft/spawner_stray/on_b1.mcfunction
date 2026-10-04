execute unless score @s cs.recipe matches 127 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 127
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_stray/root
recipe take @s craftable_spawners:spawner/stray
