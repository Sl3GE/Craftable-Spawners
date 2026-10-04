execute unless score @s cs.recipe matches 98 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 98
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_amethyst_shard/root
recipe take @s craftable_spawners:uncondense/amethyst_shard
