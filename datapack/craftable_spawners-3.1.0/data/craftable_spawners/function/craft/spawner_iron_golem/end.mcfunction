advancement revoke @s only craftable_spawners:craft/spawner_iron_golem/end
execute unless score @s cs.recipe matches 136 run return fail
function craftable_spawners:resolve/spawner_iron_golem
function craftable_spawners:reset
