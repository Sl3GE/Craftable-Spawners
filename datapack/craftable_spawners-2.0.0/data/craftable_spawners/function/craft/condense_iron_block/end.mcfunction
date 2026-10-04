advancement revoke @s only craftable_spawners:craft/condense_iron_block/end
execute unless score @s cs.recipe matches 14 run return fail
function craftable_spawners:resolve/condense_iron_block
function craftable_spawners:reset
