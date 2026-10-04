execute unless score @s cs.recipe matches 187 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 187
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_sniffer/root
recipe take @s craftable_spawners:spawner/sniffer
