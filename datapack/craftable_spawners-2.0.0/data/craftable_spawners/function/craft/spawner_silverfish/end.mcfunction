advancement revoke @s only craftable_spawners:craft/spawner_silverfish/end
execute unless score @s cs.recipe matches 124 run return fail
function craftable_spawners:resolve/spawner_silverfish
function craftable_spawners:reset
