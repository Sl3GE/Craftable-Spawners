advancement revoke @s only craftable_spawners:craft/uncondense_emerald_block/end
execute unless score @s cs.recipe matches 50 run return fail
function craftable_spawners:resolve/uncondense_emerald_block
function craftable_spawners:reset
