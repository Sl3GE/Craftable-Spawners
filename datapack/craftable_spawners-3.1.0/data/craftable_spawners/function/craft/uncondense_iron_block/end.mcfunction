advancement revoke @s only craftable_spawners:craft/uncondense_iron_block/end
execute unless score @s cs.recipe matches 75 run return fail
function craftable_spawners:resolve/uncondense_iron_block
function craftable_spawners:reset
