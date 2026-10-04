advancement revoke @s only craftable_spawners:craft/spawner_zoglin/end
execute unless score @s cs.recipe matches 135 run return fail
function craftable_spawners:resolve/spawner_zoglin
function craftable_spawners:reset
