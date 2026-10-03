execute unless score @s cs.recipe matches 17 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 17
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/condense_carved_pumpkin/root
recipe take @s craftable_spawners:condense/carved_pumpkin
