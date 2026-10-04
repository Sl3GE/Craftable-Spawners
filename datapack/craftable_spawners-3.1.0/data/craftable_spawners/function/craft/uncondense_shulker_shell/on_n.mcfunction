execute unless score @s cs.recipe matches 122 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 122
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/uncondense_shulker_shell/root
recipe take @s craftable_spawners:uncondense/shulker_shell
