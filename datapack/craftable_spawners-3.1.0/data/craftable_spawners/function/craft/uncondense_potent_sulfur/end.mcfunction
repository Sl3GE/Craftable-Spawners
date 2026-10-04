advancement revoke @s only craftable_spawners:craft/uncondense_potent_sulfur/end
execute unless score @s cs.recipe matches 116 run return fail
function craftable_spawners:resolve/uncondense_potent_sulfur
function craftable_spawners:reset
