advancement revoke @s only craftable_spawners:craft/condense_snow_block/end
execute unless score @s cs.recipe matches 18 run return fail
function craftable_spawners:resolve/condense_snow_block
function craftable_spawners:reset
