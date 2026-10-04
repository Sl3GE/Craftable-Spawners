advancement revoke @s only craftable_spawners:craft/spawner_zombified_piglin/end
execute unless score @s cs.recipe matches 71 run return fail
function craftable_spawners:resolve/spawner_zombified_piglin
function craftable_spawners:reset
