advancement revoke @s only craftable_spawners:craft/spawner_warden/end
execute unless score @s cs.recipe matches 194 run return fail
function craftable_spawners:resolve/spawner_warden
function craftable_spawners:reset
