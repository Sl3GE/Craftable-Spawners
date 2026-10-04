advancement revoke @s only craftable_spawners:craft/condense_gunpowder/end
execute unless score @s cs.recipe matches 4 run return fail
function craftable_spawners:resolve/condense_gunpowder
function craftable_spawners:reset
