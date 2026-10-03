advancement revoke @s only craftable_spawners:craft/condense_gold_block/end
execute unless score @s cs.recipe matches 10 run return fail
function craftable_spawners:resolve/condense_gold_block
function craftable_spawners:reset
