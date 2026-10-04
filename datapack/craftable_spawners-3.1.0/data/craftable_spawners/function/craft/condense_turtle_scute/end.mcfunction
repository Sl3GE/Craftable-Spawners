advancement revoke @s only craftable_spawners:craft/condense_turtle_scute/end
execute unless score @s cs.recipe matches 44 run return fail
function craftable_spawners:resolve/condense_turtle_scute
function craftable_spawners:reset
