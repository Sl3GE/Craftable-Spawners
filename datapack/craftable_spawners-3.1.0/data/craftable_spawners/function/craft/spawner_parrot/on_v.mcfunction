execute unless score @s cs.recipe matches 175 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 175
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_parrot/root
recipe take @s craftable_spawners:spawner/parrot
