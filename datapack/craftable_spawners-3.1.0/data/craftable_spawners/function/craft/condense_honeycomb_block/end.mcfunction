advancement revoke @s only craftable_spawners:craft/condense_honeycomb_block/end
execute unless score @s cs.recipe matches 27 run return fail
function craftable_spawners:resolve/condense_honeycomb_block
function craftable_spawners:reset
