advancement revoke @s only craftable_spawners:craft/spawner_dolphin/end
execute unless score @s cs.recipe matches 157 run return fail
function craftable_spawners:resolve/spawner_dolphin
function craftable_spawners:reset
