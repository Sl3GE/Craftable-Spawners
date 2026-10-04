execute unless score @s cs.recipe matches 8 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 8
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_magma_cream/root
recipe take @s craftable_spawners:condense/magma_cream
