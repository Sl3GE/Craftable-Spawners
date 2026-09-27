execute unless score @s cs.recipe matches 47 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 47
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/uncondense_ink_sac/root
