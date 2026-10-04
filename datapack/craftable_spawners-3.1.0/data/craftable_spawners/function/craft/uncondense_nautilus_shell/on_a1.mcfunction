execute unless score @s cs.recipe matches 114 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 114
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_nautilus_shell/root
recipe take @s craftable_spawners:uncondense/nautilus_shell
