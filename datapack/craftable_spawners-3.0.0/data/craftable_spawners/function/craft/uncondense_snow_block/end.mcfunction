advancement revoke @s only craftable_spawners:craft/uncondense_snow_block/end
execute unless score @s cs.recipe matches 43 run return fail
function craftable_spawners:resolve/uncondense_snow_block
function craftable_spawners:reset
