execute unless score @s cs.recipe matches 29 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 29
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/uncondense_gunpowder/root
