advancement revoke @s only craftable_spawners:craft/spawner_nautilus/end
execute unless score @s cs.recipe matches 110 run return fail
function craftable_spawners:resolve/spawner_nautilus
function craftable_spawners:reset
