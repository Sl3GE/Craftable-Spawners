advancement revoke @s only craftable_spawners:craft/spawner_tadpole/end
execute unless score @s cs.recipe matches 130 run return fail
function craftable_spawners:resolve/spawner_tadpole
function craftable_spawners:reset
