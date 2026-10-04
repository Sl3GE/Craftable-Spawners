advancement revoke @s only craftable_spawners:craft/condense_leather/end
execute unless score @s cs.recipe matches 15 run return fail
function craftable_spawners:resolve/condense_leather
function craftable_spawners:reset
