advancement revoke @s only craftable_spawners:craft/spawner_shulker/end
execute unless score @s cs.recipe matches 184 run return fail
function craftable_spawners:resolve/spawner_shulker
function craftable_spawners:reset
