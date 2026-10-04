execute unless score @s cs.recipe matches 142 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 142
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_squid/root
recipe take @s craftable_spawners:spawner/squid
