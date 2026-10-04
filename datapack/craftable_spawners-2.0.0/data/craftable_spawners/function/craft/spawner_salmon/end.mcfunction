advancement revoke @s only craftable_spawners:craft/spawner_salmon/end
execute unless score @s cs.recipe matches 122 run return fail
function craftable_spawners:resolve/spawner_salmon
function craftable_spawners:reset
