execute unless score @s cs.recipe matches 128 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 128
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_enderman/root
recipe take @s craftable_spawners:spawner/enderman
