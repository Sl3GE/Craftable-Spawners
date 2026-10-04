execute unless score @s cs.recipe matches 160 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 160
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_endermite/root
recipe take @s craftable_spawners:spawner/endermite
