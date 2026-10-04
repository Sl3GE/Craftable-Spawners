execute unless score @s cs.recipe matches 163 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 163
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/spawner_frog/root
recipe take @s craftable_spawners:spawner/frog
