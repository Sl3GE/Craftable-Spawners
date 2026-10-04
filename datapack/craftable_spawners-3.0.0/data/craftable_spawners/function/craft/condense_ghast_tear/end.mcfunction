advancement revoke @s only craftable_spawners:craft/condense_ghast_tear/end
execute unless score @s cs.recipe matches 9 run return fail
function craftable_spawners:resolve/condense_ghast_tear
function craftable_spawners:reset
