advancement revoke @s only craftable_spawners:craft/spawner_camel_husk/end
execute unless score @s cs.recipe matches 91 run return fail
function craftable_spawners:resolve/spawner_camel_husk
function craftable_spawners:reset
