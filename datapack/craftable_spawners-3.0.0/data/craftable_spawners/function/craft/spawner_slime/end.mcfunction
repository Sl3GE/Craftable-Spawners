advancement revoke @s only craftable_spawners:craft/spawner_slime/end
execute unless score @s cs.recipe matches 57 run return fail
function craftable_spawners:resolve/spawner_slime
function craftable_spawners:reset
