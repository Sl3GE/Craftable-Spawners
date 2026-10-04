advancement revoke @s only craftable_spawners:craft/spawner_breeze/end
execute unless score @s cs.recipe matches 150 run return fail
function craftable_spawners:resolve/spawner_breeze
function craftable_spawners:reset
