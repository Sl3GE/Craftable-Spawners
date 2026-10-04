advancement revoke @s only craftable_spawners:craft/condense_saddle/end
execute unless score @s cs.recipe matches 60 run return fail
function craftable_spawners:resolve/condense_saddle
function craftable_spawners:reset
