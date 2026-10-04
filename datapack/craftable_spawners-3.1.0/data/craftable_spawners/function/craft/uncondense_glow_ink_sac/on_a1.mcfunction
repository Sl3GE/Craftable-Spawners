execute unless score @s cs.recipe matches 93 run function craftable_spawners:reset
scoreboard players set @s cs.recipe 93
scoreboard players add @s cs.a1 1
advancement revoke @s from craftable_spawners:craft/uncondense_glow_ink_sac/root
recipe take @s craftable_spawners:uncondense/glow_ink_sac
