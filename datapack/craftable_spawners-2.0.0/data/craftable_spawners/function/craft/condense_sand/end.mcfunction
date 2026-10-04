advancement revoke @s only craftable_spawners:craft/condense_sand/end
execute unless score @s cs.recipe matches 51 run return fail
function craftable_spawners:resolve/condense_sand
function craftable_spawners:reset
