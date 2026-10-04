execute unless score @s cs.recipe matches 44 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 44
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_white_wool/root
recipe take @s craftable_spawners:uncondense/white_wool
