execute unless score @s cs.recipe matches 50 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 50
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_spider_eye/root
recipe take @s craftable_spawners:condense/spider_eye
