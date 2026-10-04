execute unless score @s cs.recipe matches 82 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 82
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_porkchop/root
recipe take @s craftable_spawners:uncondense/porkchop
