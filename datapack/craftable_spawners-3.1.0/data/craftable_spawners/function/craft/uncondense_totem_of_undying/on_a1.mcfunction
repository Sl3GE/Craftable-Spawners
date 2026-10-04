execute unless score @s cs.recipe matches 120 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 120
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_totem_of_undying/root
recipe take @s craftable_spawners:uncondense/totem_of_undying
