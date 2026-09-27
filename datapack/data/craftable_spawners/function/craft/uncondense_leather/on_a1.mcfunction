execute unless score @s cs.recipe matches 40 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 40
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_leather/root
