execute unless score @s cs.recipe matches 52 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 52
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_goat_horn/root
recipe take @s craftable_spawners:condense/goat_horn
