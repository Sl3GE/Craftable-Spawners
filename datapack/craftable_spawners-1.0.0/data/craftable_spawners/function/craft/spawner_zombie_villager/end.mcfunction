advancement revoke @s only craftable_spawners:craft/spawner_zombie_villager/end
execute unless score @s cs.recipe matches 138 run return fail
function craftable_spawners:resolve/spawner_zombie_villager
function craftable_spawners:reset
