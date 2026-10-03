execute unless score @s cs.recipe matches 4 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 4
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/condense_gunpowder/root
recipe take @s craftable_spawners:condense/gunpowder
