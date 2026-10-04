advancement revoke @s only craftable_spawners:craft/uncondense_sweet_berries/end
execute unless score @s cs.recipe matches 89 run return fail
function craftable_spawners:resolve/uncondense_sweet_berries
function craftable_spawners:reset
