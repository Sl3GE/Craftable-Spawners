execute unless score @s cs.recipe matches 137 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 137
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_zombie_nautilus/root
recipe take @s craftable_spawners:spawner/zombie_nautilus
