advancement revoke @s only craftable_spawners:craft/spawner_creaking/end
execute unless score @s cs.recipe matches 95 run return fail
function craftable_spawners:resolve/spawner_creaking
function craftable_spawners:reset
