advancement revoke @s only craftable_spawners:craft/uncondense_blaze_rod/end
execute unless score @s cs.recipe matches 28 run return fail
function craftable_spawners:resolve/uncondense_blaze_rod
function craftable_spawners:reset
