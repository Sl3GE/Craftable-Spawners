execute unless score @s cs.recipe matches 30 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 30
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_rabbit/root
recipe take @s craftable_spawners:condense/rabbit
