advancement revoke @s only craftable_spawners:craft/uncondense_ghast_tear/end
execute unless score @s cs.recipe matches 34 run return fail
function craftable_spawners:resolve/uncondense_ghast_tear
function craftable_spawners:reset
