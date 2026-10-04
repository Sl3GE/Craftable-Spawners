execute unless score @s cs.recipe matches 32 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 32
scoreboard players add @s cs.h 1
advancement revoke @s from craftable_spawners:craft/condense_glow_ink_sac/root
recipe take @s craftable_spawners:condense/glow_ink_sac
