execute unless score @s cs.recipe matches 174 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 174
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_parched/root
recipe take @s craftable_spawners:spawner/parched
