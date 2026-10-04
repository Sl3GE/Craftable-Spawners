execute unless score @s cs.recipe matches 159 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 159
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_elder_guardian/root
recipe take @s craftable_spawners:spawner/elder_guardian
