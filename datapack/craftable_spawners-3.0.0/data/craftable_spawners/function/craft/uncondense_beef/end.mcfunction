advancement revoke @s only craftable_spawners:craft/uncondense_beef/end
execute unless score @s cs.recipe matches 41 run return fail
function craftable_spawners:resolve/uncondense_beef
function craftable_spawners:reset
