advancement revoke @s only craftable_spawners:craft/spawner_wither_skeleton/end
execute unless score @s cs.recipe matches 62 run return fail
function craftable_spawners:resolve/spawner_wither_skeleton
function craftable_spawners:reset
