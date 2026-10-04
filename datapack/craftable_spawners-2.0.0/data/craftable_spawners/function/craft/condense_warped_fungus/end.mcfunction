advancement revoke @s only craftable_spawners:craft/condense_warped_fungus/end
execute unless score @s cs.recipe matches 47 run return fail
function craftable_spawners:resolve/condense_warped_fungus
function craftable_spawners:reset
