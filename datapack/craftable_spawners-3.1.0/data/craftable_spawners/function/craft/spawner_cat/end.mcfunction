advancement revoke @s only craftable_spawners:craft/spawner_cat/end
execute unless score @s cs.recipe matches 153 run return fail
function craftable_spawners:resolve/spawner_cat
function craftable_spawners:reset
