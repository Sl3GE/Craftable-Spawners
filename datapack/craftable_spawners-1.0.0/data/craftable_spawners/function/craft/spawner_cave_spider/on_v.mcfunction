execute unless score @s cs.recipe matches 93 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 93
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_cave_spider/root
recipe take @s craftable_spawners:spawner/cave_spider
