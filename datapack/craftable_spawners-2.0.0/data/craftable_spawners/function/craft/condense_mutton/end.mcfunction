advancement revoke @s only craftable_spawners:craft/condense_mutton/end
execute unless score @s cs.recipe matches 20 run return fail
function craftable_spawners:resolve/condense_mutton
function craftable_spawners:reset
