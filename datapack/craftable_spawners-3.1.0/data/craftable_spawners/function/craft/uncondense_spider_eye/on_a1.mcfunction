execute unless score @s cs.recipe matches 111 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 111
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_spider_eye/root
recipe take @s craftable_spawners:uncondense/spider_eye
