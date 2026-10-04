advancement revoke @s only craftable_spawners:craft/spawner_blaze/end
execute unless score @s cs.recipe matches 64 run return fail
function craftable_spawners:resolve/spawner_blaze
function craftable_spawners:reset
