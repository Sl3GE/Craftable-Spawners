execute unless score @s cs.recipe matches 43 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 43
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_seagrass/root
recipe take @s craftable_spawners:condense/seagrass
