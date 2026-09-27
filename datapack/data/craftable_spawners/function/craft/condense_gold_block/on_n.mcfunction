execute unless score @s cs.recipe matches 10 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 10
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_gold_block/root
