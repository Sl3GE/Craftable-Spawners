execute unless score @s cs.recipe matches 38 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 38
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_torchflower_seeds/root
recipe take @s craftable_spawners:condense/torchflower_seeds
