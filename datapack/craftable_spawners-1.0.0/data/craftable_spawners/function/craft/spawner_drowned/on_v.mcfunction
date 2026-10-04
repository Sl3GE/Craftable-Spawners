execute unless score @s cs.recipe matches 97 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 97
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_drowned/root
recipe take @s craftable_spawners:spawner/drowned
