execute unless score @s cs.recipe matches 133 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 133
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_warden/root
recipe take @s craftable_spawners:spawner/warden
