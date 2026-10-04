advancement revoke @s only craftable_spawners:craft/condense_totem_of_undying/end
execute unless score @s cs.recipe matches 59 run return fail
function craftable_spawners:resolve/condense_totem_of_undying
function craftable_spawners:reset
