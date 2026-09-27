execute unless score @s cs.recipe matches 39 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 39
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_iron_block/root
