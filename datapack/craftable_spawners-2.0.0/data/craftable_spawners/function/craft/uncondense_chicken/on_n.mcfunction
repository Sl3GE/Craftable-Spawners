execute unless score @s cs.recipe matches 48 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 48
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_chicken/root
