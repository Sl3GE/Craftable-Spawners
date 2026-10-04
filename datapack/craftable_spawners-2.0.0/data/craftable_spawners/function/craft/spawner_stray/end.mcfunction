advancement revoke @s only craftable_spawners:craft/spawner_stray/end
execute unless score @s cs.recipe matches 127 run return fail
function craftable_spawners:resolve/spawner_stray
function craftable_spawners:reset
