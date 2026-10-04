advancement revoke @s only craftable_spawners:craft/spawner_endermite/end
execute unless score @s cs.recipe matches 99 run return fail
function craftable_spawners:resolve/spawner_endermite
function craftable_spawners:reset
