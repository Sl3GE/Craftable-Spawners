advancement revoke @s only craftable_spawners:craft/condense_nether_star/end
execute unless score @s cs.recipe matches 11 run return fail
function craftable_spawners:resolve/condense_nether_star
function craftable_spawners:reset
