advancement revoke @s only craftable_spawners:craft/uncondense_mutton/end
execute unless score @s cs.recipe matches 45 run return fail
function craftable_spawners:resolve/uncondense_mutton
function craftable_spawners:reset
