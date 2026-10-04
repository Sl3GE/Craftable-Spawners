advancement revoke @s only craftable_spawners:craft/spawner_skeleton/end
execute unless score @s cs.recipe matches 123 run return fail
function craftable_spawners:resolve/spawner_skeleton
function craftable_spawners:reset
