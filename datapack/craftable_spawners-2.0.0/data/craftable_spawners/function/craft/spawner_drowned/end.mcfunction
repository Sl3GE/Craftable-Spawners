advancement revoke @s only craftable_spawners:craft/spawner_drowned/end
execute unless score @s cs.recipe matches 97 run return fail
function craftable_spawners:resolve/spawner_drowned
function craftable_spawners:reset
