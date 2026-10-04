advancement revoke @s only craftable_spawners:craft/condense_sweet_berries/end
execute unless score @s cs.recipe matches 28 run return fail
function craftable_spawners:resolve/condense_sweet_berries
function craftable_spawners:reset
