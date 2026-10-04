advancement revoke @s only craftable_spawners:craft/uncondense_leather/end
execute unless score @s cs.recipe matches 76 run return fail
function craftable_spawners:resolve/uncondense_leather
function craftable_spawners:reset
