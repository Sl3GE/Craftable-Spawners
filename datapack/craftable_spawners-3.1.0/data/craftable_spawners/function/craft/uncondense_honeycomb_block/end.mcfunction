advancement revoke @s only craftable_spawners:craft/uncondense_honeycomb_block/end
execute unless score @s cs.recipe matches 88 run return fail
function craftable_spawners:resolve/uncondense_honeycomb_block
function craftable_spawners:reset
