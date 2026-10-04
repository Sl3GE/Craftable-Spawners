advancement revoke @s only craftable_spawners:craft/uncondense_feather/end
execute unless score @s cs.recipe matches 85 run return fail
function craftable_spawners:resolve/uncondense_feather
function craftable_spawners:reset
