advancement revoke @s only craftable_spawners:craft/condense_ochre_froglight/end
execute unless score @s cs.recipe matches 54 run return fail
function craftable_spawners:resolve/condense_ochre_froglight
function craftable_spawners:reset
