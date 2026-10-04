execute unless score @s cs.recipe matches 36 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 36
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_tropical_fish/root
recipe take @s craftable_spawners:condense/tropical_fish
