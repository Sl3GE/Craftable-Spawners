advancement revoke @s only craftable_spawners:craft/uncondense_gunpowder/end
execute unless score @s cs.recipe matches 65 run return fail
function craftable_spawners:resolve/uncondense_gunpowder
function craftable_spawners:reset
