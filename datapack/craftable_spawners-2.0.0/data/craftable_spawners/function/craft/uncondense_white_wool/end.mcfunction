advancement revoke @s only craftable_spawners:craft/uncondense_white_wool/end
execute unless score @s cs.recipe matches 44 run return fail
function craftable_spawners:resolve/uncondense_white_wool
function craftable_spawners:reset
