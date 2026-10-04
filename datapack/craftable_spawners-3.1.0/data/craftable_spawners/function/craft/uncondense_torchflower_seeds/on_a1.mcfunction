execute unless score @s cs.recipe matches 99 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 99
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_torchflower_seeds/root
recipe take @s craftable_spawners:uncondense/torchflower_seeds
