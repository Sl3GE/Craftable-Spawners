advancement revoke @s only craftable_spawners:craft/spawner_witch/end
execute unless score @s cs.recipe matches 63 run return fail
function craftable_spawners:resolve/spawner_witch
function craftable_spawners:reset
