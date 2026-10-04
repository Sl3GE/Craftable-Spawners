advancement revoke @s only craftable_spawners:craft/spawner_allay/end
execute unless score @s cs.recipe matches 84 run return fail
function craftable_spawners:resolve/spawner_allay
function craftable_spawners:reset
