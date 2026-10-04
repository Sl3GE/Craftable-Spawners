execute unless score @s cs.recipe matches 108 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 108
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_warped_fungus/root
recipe take @s craftable_spawners:uncondense/warped_fungus
