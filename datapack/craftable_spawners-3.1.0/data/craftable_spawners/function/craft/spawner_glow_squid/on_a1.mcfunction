execute unless score @s cs.recipe matches 164 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 164
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_glow_squid/root
recipe take @s craftable_spawners:spawner/glow_squid
