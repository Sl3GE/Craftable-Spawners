advancement revoke @s only craftable_spawners:craft/spawner_piglin_brute/end
execute unless score @s cs.recipe matches 117 run return fail
function craftable_spawners:resolve/spawner_piglin_brute
function craftable_spawners:reset
