advancement revoke @s only craftable_spawners:craft/spawner_husk/end
execute unless score @s cs.recipe matches 168 run return fail
function craftable_spawners:resolve/spawner_husk
function craftable_spawners:reset
