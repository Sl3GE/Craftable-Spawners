execute unless score @s cs.recipe matches 104 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 104
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_seagrass/root
recipe take @s craftable_spawners:uncondense/seagrass
