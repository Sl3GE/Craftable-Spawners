advancement revoke @s only craftable_spawners:craft/spawner_guardian/end
execute unless score @s cs.recipe matches 105 run return fail
function craftable_spawners:resolve/spawner_guardian
function craftable_spawners:reset
