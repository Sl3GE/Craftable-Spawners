advancement revoke @s only craftable_spawners:craft/spawner_snow_golem/end
execute unless score @s cs.recipe matches 138 run return fail
function craftable_spawners:resolve/spawner_snow_golem
function craftable_spawners:reset
