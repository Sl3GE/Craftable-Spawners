advancement revoke @s only craftable_spawners:craft/condense_emerald_block/end
execute unless score @s cs.recipe matches 25 run return fail
function craftable_spawners:resolve/condense_emerald_block
function craftable_spawners:reset
