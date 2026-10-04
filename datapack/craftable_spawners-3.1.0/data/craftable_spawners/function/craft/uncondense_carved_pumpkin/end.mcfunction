advancement revoke @s only craftable_spawners:craft/uncondense_carved_pumpkin/end
execute unless score @s cs.recipe matches 78 run return fail
function craftable_spawners:resolve/uncondense_carved_pumpkin
function craftable_spawners:reset
