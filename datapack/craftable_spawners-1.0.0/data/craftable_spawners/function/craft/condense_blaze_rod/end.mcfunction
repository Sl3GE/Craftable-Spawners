advancement revoke @s only craftable_spawners:craft/condense_blaze_rod/end
execute unless score @s cs.recipe matches 3 run return fail
function craftable_spawners:resolve/condense_blaze_rod
function craftable_spawners:reset
