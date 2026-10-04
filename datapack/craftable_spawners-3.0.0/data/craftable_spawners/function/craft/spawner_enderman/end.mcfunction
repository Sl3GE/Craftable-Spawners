advancement revoke @s only craftable_spawners:craft/spawner_enderman/end
execute unless score @s cs.recipe matches 56 run return fail
function craftable_spawners:resolve/spawner_enderman
function craftable_spawners:reset
