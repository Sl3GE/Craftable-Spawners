execute unless score @s cs.recipe matches 91 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 91
scoreboard players add @s cs.b1 1
advancement revoke @s from craftable_spawners:craft/spawner_camel_husk/root
recipe take @s craftable_spawners:spawner/camel_husk
