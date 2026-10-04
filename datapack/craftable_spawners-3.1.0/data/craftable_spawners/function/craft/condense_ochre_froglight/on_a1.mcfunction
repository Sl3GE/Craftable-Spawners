execute unless score @s cs.recipe matches 54 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 54
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/condense_ochre_froglight/root
recipe take @s craftable_spawners:condense/ochre_froglight
