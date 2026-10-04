execute unless score @s cs.recipe matches 192 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 192
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_tropical_fish/root
recipe take @s craftable_spawners:spawner/tropical_fish
