advancement revoke @s only craftable_spawners:craft/uncondense_sand/end
execute unless score @s cs.recipe matches 112 run return fail
function craftable_spawners:resolve/uncondense_sand
function craftable_spawners:reset
