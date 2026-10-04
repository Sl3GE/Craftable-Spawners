advancement revoke @s only craftable_spawners:craft/spawner_sheep/end
execute unless score @s cs.recipe matches 78 run return fail
function craftable_spawners:resolve/spawner_sheep
function craftable_spawners:reset
