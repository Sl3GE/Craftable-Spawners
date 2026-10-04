execute unless score @s cs.recipe matches 180 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 180
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_pufferfish/root
recipe take @s craftable_spawners:spawner/pufferfish
