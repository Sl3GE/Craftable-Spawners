advancement revoke @s only craftable_spawners:craft/spawner_creeper/end
execute unless score @s cs.recipe matches 65 run return fail
function craftable_spawners:resolve/spawner_creeper
function craftable_spawners:reset
