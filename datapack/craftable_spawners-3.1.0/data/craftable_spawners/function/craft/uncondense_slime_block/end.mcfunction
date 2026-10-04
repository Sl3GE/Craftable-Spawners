advancement revoke @s only craftable_spawners:craft/uncondense_slime_block/end
execute unless score @s cs.recipe matches 68 run return fail
function craftable_spawners:resolve/uncondense_slime_block
function craftable_spawners:reset
