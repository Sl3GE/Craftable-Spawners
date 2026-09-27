execute unless score @s cs.recipe matches 64 run function craftable_spawners:resolve/dispatch
scoreboard players set @s cs.recipe 64
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_iron_golem/root
