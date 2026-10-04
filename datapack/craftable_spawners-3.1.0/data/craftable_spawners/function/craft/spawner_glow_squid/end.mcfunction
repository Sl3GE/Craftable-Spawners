advancement revoke @s only craftable_spawners:craft/spawner_glow_squid/end
execute unless score @s cs.recipe matches 164 run return fail
function craftable_spawners:resolve/spawner_glow_squid
function craftable_spawners:reset
