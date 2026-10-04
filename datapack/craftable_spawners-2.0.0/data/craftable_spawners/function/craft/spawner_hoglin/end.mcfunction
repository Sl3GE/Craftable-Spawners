advancement revoke @s only craftable_spawners:craft/spawner_hoglin/end
execute unless score @s cs.recipe matches 106 run return fail
function craftable_spawners:resolve/spawner_hoglin
function craftable_spawners:reset
