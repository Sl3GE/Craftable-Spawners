advancement revoke @s only craftable_spawners:craft/condense_cobblestone/end
execute unless score @s cs.recipe matches 49 run return fail
function craftable_spawners:resolve/condense_cobblestone
function craftable_spawners:reset
