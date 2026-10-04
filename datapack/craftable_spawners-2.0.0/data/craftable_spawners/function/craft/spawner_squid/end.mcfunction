advancement revoke @s only craftable_spawners:craft/spawner_squid/end
execute unless score @s cs.recipe matches 81 run return fail
function craftable_spawners:resolve/spawner_squid
function craftable_spawners:reset
