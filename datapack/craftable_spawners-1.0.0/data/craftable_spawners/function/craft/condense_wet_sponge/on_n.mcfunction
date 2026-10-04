execute unless score @s cs.recipe matches 57 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 57
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_wet_sponge/root
recipe take @s craftable_spawners:condense/wet_sponge
