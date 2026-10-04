advancement revoke @s only craftable_spawners:craft/spawner_ravager/end
execute unless score @s cs.recipe matches 121 run return fail
function craftable_spawners:resolve/spawner_ravager
function craftable_spawners:reset
