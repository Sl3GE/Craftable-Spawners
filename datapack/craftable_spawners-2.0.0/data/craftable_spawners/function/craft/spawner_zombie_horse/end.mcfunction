advancement revoke @s only craftable_spawners:craft/spawner_zombie_horse/end
execute unless score @s cs.recipe matches 136 run return fail
function craftable_spawners:resolve/spawner_zombie_horse
function craftable_spawners:reset
