execute unless score @s cs.recipe matches 22 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 22
scoreboard players add @s cs.n 1
advancement revoke @s from craftable_spawners:craft/condense_ink_sac/root
recipe take @s craftable_spawners:condense/ink_sac
