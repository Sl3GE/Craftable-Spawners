advancement revoke @s only craftable_spawners:craft/spawner_cow/end
execute unless score @s cs.recipe matches 137 run return fail
function craftable_spawners:resolve/spawner_cow
function craftable_spawners:reset
