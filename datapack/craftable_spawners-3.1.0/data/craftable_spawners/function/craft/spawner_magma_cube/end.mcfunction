advancement revoke @s only craftable_spawners:craft/spawner_magma_cube/end
execute unless score @s cs.recipe matches 130 run return fail
function craftable_spawners:resolve/spawner_magma_cube
function craftable_spawners:reset
