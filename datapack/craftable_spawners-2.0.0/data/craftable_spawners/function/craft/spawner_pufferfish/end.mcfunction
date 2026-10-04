advancement revoke @s only craftable_spawners:craft/spawner_pufferfish/end
execute unless score @s cs.recipe matches 119 run return fail
function craftable_spawners:resolve/spawner_pufferfish
function craftable_spawners:reset
