execute unless score @s cs.recipe matches 138 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 138
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_zombie_villager/root
recipe take @s craftable_spawners:spawner/zombie_villager
