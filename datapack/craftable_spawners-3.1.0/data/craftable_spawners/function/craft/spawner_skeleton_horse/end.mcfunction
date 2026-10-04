advancement revoke @s only craftable_spawners:craft/spawner_skeleton_horse/end
execute unless score @s cs.recipe matches 186 run return fail
function craftable_spawners:resolve/spawner_skeleton_horse
function craftable_spawners:reset
