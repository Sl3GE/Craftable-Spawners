advancement revoke @s only craftable_spawners:craft/spawner_villager/end
execute unless score @s cs.recipe matches 72 run return fail
function craftable_spawners:resolve/spawner_villager
function craftable_spawners:reset
