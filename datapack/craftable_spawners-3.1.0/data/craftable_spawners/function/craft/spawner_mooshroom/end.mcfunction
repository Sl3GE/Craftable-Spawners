advancement revoke @s only craftable_spawners:craft/spawner_mooshroom/end
execute unless score @s cs.recipe matches 170 run return fail
function craftable_spawners:resolve/spawner_mooshroom
function craftable_spawners:reset
