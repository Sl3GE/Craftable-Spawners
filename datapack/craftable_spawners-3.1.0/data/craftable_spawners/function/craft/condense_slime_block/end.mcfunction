advancement revoke @s only craftable_spawners:craft/condense_slime_block/end
execute unless score @s cs.recipe matches 7 run return fail
function craftable_spawners:resolve/condense_slime_block
function craftable_spawners:reset
