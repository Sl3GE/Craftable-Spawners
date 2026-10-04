advancement revoke @s only craftable_spawners:craft/spawner_bee/end
execute unless score @s cs.recipe matches 148 run return fail
function craftable_spawners:resolve/spawner_bee
function craftable_spawners:reset
