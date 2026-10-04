execute unless score @s cs.recipe matches 14 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 14
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_iron_block/root
recipe take @s craftable_spawners:condense/iron_block
