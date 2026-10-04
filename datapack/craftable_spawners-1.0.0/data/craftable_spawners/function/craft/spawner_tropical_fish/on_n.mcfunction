execute unless score @s cs.recipe matches 131 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 131
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_tropical_fish/root
recipe take @s craftable_spawners:spawner/tropical_fish
