advancement revoke @s only craftable_spawners:craft/spawner_zombie_nautilus/end
execute unless score @s cs.recipe matches 198 run return fail
function craftable_spawners:resolve/spawner_zombie_nautilus
function craftable_spawners:reset
