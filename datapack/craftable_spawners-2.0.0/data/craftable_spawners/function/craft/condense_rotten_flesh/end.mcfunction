advancement revoke @s only craftable_spawners:craft/condense_rotten_flesh/end
execute unless score @s cs.recipe matches 2 run return fail
function craftable_spawners:resolve/condense_rotten_flesh
function craftable_spawners:reset
