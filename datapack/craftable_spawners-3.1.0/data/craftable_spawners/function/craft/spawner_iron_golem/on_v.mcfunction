execute unless score @s cs.recipe matches 136 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 136
scoreboard players add @s cs.v 1
advancement revoke @s from craftable_spawners:craft/spawner_iron_golem/root
recipe take @s craftable_spawners:spawner/iron_golem
