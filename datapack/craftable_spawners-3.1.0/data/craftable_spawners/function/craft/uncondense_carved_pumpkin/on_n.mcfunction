execute unless score @s cs.recipe matches 78 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 78
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_carved_pumpkin/root
recipe take @s craftable_spawners:uncondense/carved_pumpkin
