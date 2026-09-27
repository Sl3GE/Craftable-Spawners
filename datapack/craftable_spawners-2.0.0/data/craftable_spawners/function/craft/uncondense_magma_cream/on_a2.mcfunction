execute unless score @s cs.recipe matches 33 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 33
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/uncondense_magma_cream/root
