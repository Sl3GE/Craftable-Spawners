execute unless score @s cs.recipe matches 103 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 103
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_glow_squid/root
recipe take @s craftable_spawners:spawner/glow_squid
