advancement revoke @s only craftable_spawners:craft/uncondense_gold_block/end
execute unless score @s cs.recipe matches 71 run return fail
function craftable_spawners:resolve/uncondense_gold_block
function craftable_spawners:reset
