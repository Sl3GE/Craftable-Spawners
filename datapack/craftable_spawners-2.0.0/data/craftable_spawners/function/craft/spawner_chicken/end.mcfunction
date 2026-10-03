advancement revoke @s only craftable_spawners:craft/spawner_chicken/end
execute unless score @s cs.recipe matches 71 run return fail
function craftable_spawners:resolve/spawner_chicken
function craftable_spawners:reset
