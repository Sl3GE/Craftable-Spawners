execute unless score @s cs.recipe matches 14 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 14
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_iron_block/root
