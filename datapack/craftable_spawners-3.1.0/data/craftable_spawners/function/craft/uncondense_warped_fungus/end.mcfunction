advancement revoke @s only craftable_spawners:craft/uncondense_warped_fungus/end
execute unless score @s cs.recipe matches 108 run return fail
function craftable_spawners:resolve/uncondense_warped_fungus
function craftable_spawners:reset
