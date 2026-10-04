advancement revoke @s only craftable_spawners:craft/uncondense_turtle_scute/end
execute unless score @s cs.recipe matches 105 run return fail
function craftable_spawners:resolve/uncondense_turtle_scute
function craftable_spawners:reset
