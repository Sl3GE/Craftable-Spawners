advancement revoke @s only craftable_spawners:craft/spawner_piglin/end
execute unless score @s cs.recipe matches 116 run return fail
function craftable_spawners:resolve/spawner_piglin
function craftable_spawners:reset
