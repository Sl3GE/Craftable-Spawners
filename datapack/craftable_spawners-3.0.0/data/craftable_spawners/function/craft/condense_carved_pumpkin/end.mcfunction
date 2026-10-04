advancement revoke @s only craftable_spawners:craft/condense_carved_pumpkin/end
execute unless score @s cs.recipe matches 17 run return fail
function craftable_spawners:resolve/condense_carved_pumpkin
function craftable_spawners:reset
