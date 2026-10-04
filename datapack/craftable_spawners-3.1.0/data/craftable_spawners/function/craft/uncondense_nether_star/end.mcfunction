advancement revoke @s only craftable_spawners:craft/uncondense_nether_star/end
execute unless score @s cs.recipe matches 72 run return fail
function craftable_spawners:resolve/uncondense_nether_star
function craftable_spawners:reset
