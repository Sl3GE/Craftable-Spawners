advancement revoke @s only craftable_spawners:craft/condense_bamboo_block/end
execute unless score @s cs.recipe matches 29 run return fail
function craftable_spawners:resolve/condense_bamboo_block
function craftable_spawners:reset
