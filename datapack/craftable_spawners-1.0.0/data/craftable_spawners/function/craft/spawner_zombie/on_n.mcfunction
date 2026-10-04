execute unless score @s cs.recipe matches 63 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 63
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_zombie/root
recipe take @s craftable_spawners:spawner/zombie
