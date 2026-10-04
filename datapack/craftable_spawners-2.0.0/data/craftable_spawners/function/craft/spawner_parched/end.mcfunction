advancement revoke @s only craftable_spawners:craft/spawner_parched/end
execute unless score @s cs.recipe matches 113 run return fail
function craftable_spawners:resolve/spawner_parched
function craftable_spawners:reset
