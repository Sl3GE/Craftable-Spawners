advancement revoke @s only craftable_spawners:craft/spawner_panda/end
execute unless score @s cs.recipe matches 173 run return fail
function craftable_spawners:resolve/spawner_panda
function craftable_spawners:reset
