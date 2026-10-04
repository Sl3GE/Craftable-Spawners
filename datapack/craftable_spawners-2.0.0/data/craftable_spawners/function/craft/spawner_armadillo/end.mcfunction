advancement revoke @s only craftable_spawners:craft/spawner_armadillo/end
execute unless score @s cs.recipe matches 85 run return fail
function craftable_spawners:resolve/spawner_armadillo
function craftable_spawners:reset
