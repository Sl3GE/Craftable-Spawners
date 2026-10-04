advancement revoke @s only craftable_spawners:craft/spawner_bogged/end
execute unless score @s cs.recipe matches 149 run return fail
function craftable_spawners:resolve/spawner_bogged
function craftable_spawners:reset
