execute unless score @s cs.recipe matches 118 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 118
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_wet_sponge/root
recipe take @s craftable_spawners:uncondense/wet_sponge
