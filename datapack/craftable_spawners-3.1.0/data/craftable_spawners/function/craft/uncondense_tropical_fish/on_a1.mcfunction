execute unless score @s cs.recipe matches 97 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 97
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_tropical_fish/root
recipe take @s craftable_spawners:uncondense/tropical_fish
