execute unless score @s cs.recipe matches 72 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 72
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_wither/root
recipe take @s craftable_spawners:spawner/wither
