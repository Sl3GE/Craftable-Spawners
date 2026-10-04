advancement revoke @s only craftable_spawners:craft/uncondense_salmon/end
execute unless score @s cs.recipe matches 96 run return fail
function craftable_spawners:resolve/uncondense_salmon
function craftable_spawners:reset
