advancement revoke @s only craftable_spawners:craft/spawner_frog/end
execute unless score @s cs.recipe matches 102 run return fail
function craftable_spawners:resolve/spawner_frog
function craftable_spawners:reset
