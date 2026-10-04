execute unless score @s cs.recipe matches 156 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 156
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_creaking/root
recipe take @s craftable_spawners:spawner/creaking
