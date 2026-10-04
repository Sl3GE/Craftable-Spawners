execute unless score @s cs.recipe matches 86 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 86
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/spawner_axolotl/root
recipe take @s craftable_spawners:spawner/axolotl
