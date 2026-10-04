execute unless score @s cs.recipe matches 113 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 113
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_goat_horn/root
recipe take @s craftable_spawners:uncondense/goat_horn
