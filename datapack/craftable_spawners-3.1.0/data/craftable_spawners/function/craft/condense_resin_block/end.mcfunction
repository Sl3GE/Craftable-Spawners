advancement revoke @s only craftable_spawners:craft/condense_resin_block/end
execute unless score @s cs.recipe matches 56 run return fail
function craftable_spawners:resolve/condense_resin_block
function craftable_spawners:reset
