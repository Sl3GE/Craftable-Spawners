execute unless score @s cs.recipe matches 37 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 37
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_amethyst_shard/root
recipe take @s craftable_spawners:condense/amethyst_shard
