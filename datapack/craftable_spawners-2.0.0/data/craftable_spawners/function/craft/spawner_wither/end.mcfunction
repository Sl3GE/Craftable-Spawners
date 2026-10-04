advancement revoke @s only craftable_spawners:craft/spawner_wither/end
execute unless score @s cs.recipe matches 72 run return fail
function craftable_spawners:resolve/spawner_wither
function craftable_spawners:reset
