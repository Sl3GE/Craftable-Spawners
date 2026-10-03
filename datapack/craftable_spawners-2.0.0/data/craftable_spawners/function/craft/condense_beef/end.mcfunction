advancement revoke @s only craftable_spawners:craft/condense_beef/end
execute unless score @s cs.recipe matches 16 run return fail
function craftable_spawners:resolve/condense_beef
function craftable_spawners:reset
