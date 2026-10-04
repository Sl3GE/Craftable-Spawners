advancement revoke @s only craftable_spawners:craft/spawner_sulfur_cube/end
execute unless score @s cs.recipe matches 190 run return fail
function craftable_spawners:resolve/spawner_sulfur_cube
function craftable_spawners:reset
