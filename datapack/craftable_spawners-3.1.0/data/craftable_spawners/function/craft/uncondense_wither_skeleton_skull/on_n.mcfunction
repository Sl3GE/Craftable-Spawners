execute unless score @s cs.recipe matches 73 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 73
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_wither_skeleton_skull/root
recipe take @s craftable_spawners:uncondense/wither_skeleton_skull
