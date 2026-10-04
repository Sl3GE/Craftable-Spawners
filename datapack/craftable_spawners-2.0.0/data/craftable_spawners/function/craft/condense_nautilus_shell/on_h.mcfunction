execute unless score @s cs.recipe matches 53 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 53
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_nautilus_shell/root
recipe take @s craftable_spawners:condense/nautilus_shell
