advancement revoke @s only craftable_spawners:craft/uncondense_goat_horn/end
execute unless score @s cs.recipe matches 113 run return fail
function craftable_spawners:resolve/uncondense_goat_horn
function craftable_spawners:reset
