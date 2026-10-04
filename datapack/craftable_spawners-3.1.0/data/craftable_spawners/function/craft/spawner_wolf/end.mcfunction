advancement revoke @s only craftable_spawners:craft/spawner_wolf/end
execute unless score @s cs.recipe matches 195 run return fail
function craftable_spawners:resolve/spawner_wolf
function craftable_spawners:reset
