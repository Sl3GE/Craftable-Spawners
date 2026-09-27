execute unless score @s cs.recipe matches 11 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 11
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_nether_star/root
