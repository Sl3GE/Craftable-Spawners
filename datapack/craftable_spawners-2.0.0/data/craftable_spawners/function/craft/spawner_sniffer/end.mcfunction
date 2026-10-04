advancement revoke @s only craftable_spawners:craft/spawner_sniffer/end
execute unless score @s cs.recipe matches 126 run return fail
function craftable_spawners:resolve/spawner_sniffer
function craftable_spawners:reset
