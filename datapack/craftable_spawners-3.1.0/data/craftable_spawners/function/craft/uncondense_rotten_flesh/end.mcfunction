advancement revoke @s only craftable_spawners:craft/uncondense_rotten_flesh/end
execute unless score @s cs.recipe matches 63 run return fail
function craftable_spawners:resolve/uncondense_rotten_flesh
function craftable_spawners:reset
