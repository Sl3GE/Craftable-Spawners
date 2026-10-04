execute unless score @s cs.recipe matches 61 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 61
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_shulker_shell/root
recipe take @s craftable_spawners:condense/shulker_shell
