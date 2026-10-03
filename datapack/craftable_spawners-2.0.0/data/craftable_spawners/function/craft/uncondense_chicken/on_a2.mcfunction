execute unless score @s cs.recipe matches 48 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 48
scoreboard players add @s cs.a2 1
advancement revoke @s from craftable_spawners:craft/uncondense_chicken/root
recipe take @s craftable_spawners:uncondense/chicken
