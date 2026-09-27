execute unless score @s cs.recipe matches 31 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 31
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_ender_pearl/root
