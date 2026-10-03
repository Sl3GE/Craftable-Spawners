execute unless score @s cs.recipe matches 16 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 16
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_beef/root
recipe take @s craftable_spawners:condense/beef
