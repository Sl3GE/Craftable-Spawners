advancement revoke @s only craftable_spawners:craft/uncondense_totem_of_undying/end
execute unless score @s cs.recipe matches 120 run return fail
function craftable_spawners:resolve/uncondense_totem_of_undying
function craftable_spawners:reset
