execute unless score @s cs.recipe matches 88 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 88
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_honeycomb_block/root
recipe take @s craftable_spawners:uncondense/honeycomb_block
