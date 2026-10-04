advancement revoke @s only craftable_spawners:craft/spawner_parrot/end
execute unless score @s cs.recipe matches 175 run return fail
function craftable_spawners:resolve/spawner_parrot
function craftable_spawners:reset
