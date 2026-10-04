execute unless score @s cs.recipe matches 42 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 42
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_carved_pumpkin/root
recipe take @s craftable_spawners:uncondense/carved_pumpkin
