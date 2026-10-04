advancement revoke @s only craftable_spawners:craft/spawner_spider/end
execute unless score @s cs.recipe matches 66 run return fail
function craftable_spawners:resolve/spawner_spider
function craftable_spawners:reset
