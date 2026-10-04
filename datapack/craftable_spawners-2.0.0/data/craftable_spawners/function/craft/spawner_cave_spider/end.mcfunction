advancement revoke @s only craftable_spawners:craft/spawner_cave_spider/end
execute unless score @s cs.recipe matches 93 run return fail
function craftable_spawners:resolve/spawner_cave_spider
function craftable_spawners:reset
