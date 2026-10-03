advancement revoke @s only craftable_spawners:craft/condense_white_wool/end
execute unless score @s cs.recipe matches 19 run return fail
function craftable_spawners:resolve/condense_white_wool
function craftable_spawners:reset
