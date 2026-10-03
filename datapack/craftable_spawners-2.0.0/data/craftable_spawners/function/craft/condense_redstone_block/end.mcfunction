advancement revoke @s only craftable_spawners:craft/condense_redstone_block/end
execute unless score @s cs.recipe matches 13 run return fail
function craftable_spawners:resolve/condense_redstone_block
function craftable_spawners:reset
