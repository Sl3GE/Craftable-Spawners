advancement revoke @s only craftable_spawners:craft/uncondense_redstone_block/end
execute unless score @s cs.recipe matches 38 run return fail
function craftable_spawners:resolve/uncondense_redstone_block
function craftable_spawners:reset
