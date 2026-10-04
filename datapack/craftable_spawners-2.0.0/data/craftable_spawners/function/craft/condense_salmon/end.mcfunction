advancement revoke @s only craftable_spawners:craft/condense_salmon/end
execute unless score @s cs.recipe matches 35 run return fail
function craftable_spawners:resolve/condense_salmon
function craftable_spawners:reset
