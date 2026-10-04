advancement revoke @s only craftable_spawners:craft/condense_crimson_fungus/end
execute unless score @s cs.recipe matches 48 run return fail
function craftable_spawners:resolve/condense_crimson_fungus
function craftable_spawners:reset
