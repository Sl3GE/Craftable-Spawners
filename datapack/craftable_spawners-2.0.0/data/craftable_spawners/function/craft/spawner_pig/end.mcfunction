advancement revoke @s only craftable_spawners:craft/spawner_pig/end
execute unless score @s cs.recipe matches 68 run return fail
function craftable_spawners:resolve/spawner_pig
function craftable_spawners:reset
