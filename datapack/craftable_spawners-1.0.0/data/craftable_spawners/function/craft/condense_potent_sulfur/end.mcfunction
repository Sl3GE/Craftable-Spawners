advancement revoke @s only craftable_spawners:craft/condense_potent_sulfur/end
execute unless score @s cs.recipe matches 55 run return fail
function craftable_spawners:resolve/condense_potent_sulfur
function craftable_spawners:reset
