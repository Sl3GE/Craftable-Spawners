advancement revoke @s only craftable_spawners:craft/spawner_turtle/end
execute unless score @s cs.recipe matches 193 run return fail
function craftable_spawners:resolve/spawner_turtle
function craftable_spawners:reset
