advancement revoke @s only craftable_spawners:craft/condense_ender_pearl/end
execute unless score @s cs.recipe matches 6 run return fail
function craftable_spawners:resolve/condense_ender_pearl
function craftable_spawners:reset
