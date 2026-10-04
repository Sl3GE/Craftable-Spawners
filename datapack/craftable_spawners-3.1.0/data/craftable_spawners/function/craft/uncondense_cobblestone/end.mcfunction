advancement revoke @s only craftable_spawners:craft/uncondense_cobblestone/end
execute unless score @s cs.recipe matches 110 run return fail
function craftable_spawners:resolve/uncondense_cobblestone
function craftable_spawners:reset
