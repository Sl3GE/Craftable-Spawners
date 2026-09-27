execute unless score @s cs.recipe matches 36 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 36
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_nether_star/root
