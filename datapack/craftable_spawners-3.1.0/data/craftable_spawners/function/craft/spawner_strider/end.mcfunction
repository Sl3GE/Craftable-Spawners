advancement revoke @s only craftable_spawners:craft/spawner_strider/end
execute unless score @s cs.recipe matches 189 run return fail
function craftable_spawners:resolve/spawner_strider
function craftable_spawners:reset
