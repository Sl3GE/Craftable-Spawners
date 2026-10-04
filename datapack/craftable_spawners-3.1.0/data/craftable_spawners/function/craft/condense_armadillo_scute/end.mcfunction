advancement revoke @s only craftable_spawners:craft/condense_armadillo_scute/end
execute unless score @s cs.recipe matches 26 run return fail
function craftable_spawners:resolve/condense_armadillo_scute
function craftable_spawners:reset
