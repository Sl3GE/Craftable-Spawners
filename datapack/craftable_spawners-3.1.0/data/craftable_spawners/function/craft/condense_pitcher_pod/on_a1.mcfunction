execute unless score @s cs.recipe matches 39 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 39
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_pitcher_pod/root
recipe take @s craftable_spawners:condense/pitcher_pod
