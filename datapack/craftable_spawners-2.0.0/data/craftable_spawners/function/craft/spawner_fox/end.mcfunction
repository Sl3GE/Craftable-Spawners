advancement revoke @s only craftable_spawners:craft/spawner_fox/end
execute unless score @s cs.recipe matches 101 run return fail
function craftable_spawners:resolve/spawner_fox
function craftable_spawners:reset
