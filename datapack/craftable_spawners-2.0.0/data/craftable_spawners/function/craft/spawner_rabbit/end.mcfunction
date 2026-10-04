advancement revoke @s only craftable_spawners:craft/spawner_rabbit/end
execute unless score @s cs.recipe matches 120 run return fail
function craftable_spawners:resolve/spawner_rabbit
function craftable_spawners:reset
