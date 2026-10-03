advancement revoke @s only craftable_spawners:craft/condense_chicken/end
execute unless score @s cs.recipe matches 23 run return fail
function craftable_spawners:resolve/condense_chicken
function craftable_spawners:reset
