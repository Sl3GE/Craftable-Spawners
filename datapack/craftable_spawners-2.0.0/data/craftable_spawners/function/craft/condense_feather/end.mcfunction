advancement revoke @s only craftable_spawners:craft/condense_feather/end
execute unless score @s cs.recipe matches 24 run return fail
function craftable_spawners:resolve/condense_feather
function craftable_spawners:reset
