advancement revoke @s only craftable_spawners:craft/uncondense_chicken/end
execute unless score @s cs.recipe matches 84 run return fail
function craftable_spawners:resolve/uncondense_chicken
function craftable_spawners:reset
