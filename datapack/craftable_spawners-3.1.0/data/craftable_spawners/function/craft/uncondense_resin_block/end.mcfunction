advancement revoke @s only craftable_spawners:craft/uncondense_resin_block/end
execute unless score @s cs.recipe matches 117 run return fail
function craftable_spawners:resolve/uncondense_resin_block
function craftable_spawners:reset
