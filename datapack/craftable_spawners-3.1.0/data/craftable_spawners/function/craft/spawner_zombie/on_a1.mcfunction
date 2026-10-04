execute unless score @s cs.recipe matches 124 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 124
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_zombie/root
recipe take @s craftable_spawners:spawner/zombie
