execute unless score @s cs.recipe matches 46 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 46
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_red_mushroom/root
recipe take @s craftable_spawners:condense/red_mushroom
