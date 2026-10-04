advancement revoke @s only craftable_spawners:craft/condense_breeze_rod/end
execute unless score @s cs.recipe matches 40 run return fail
function craftable_spawners:resolve/condense_breeze_rod
function craftable_spawners:reset
