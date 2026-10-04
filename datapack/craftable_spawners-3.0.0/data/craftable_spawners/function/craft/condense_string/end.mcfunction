advancement revoke @s only craftable_spawners:craft/condense_string/end
execute unless score @s cs.recipe matches 5 run return fail
function craftable_spawners:resolve/condense_string
function craftable_spawners:reset
