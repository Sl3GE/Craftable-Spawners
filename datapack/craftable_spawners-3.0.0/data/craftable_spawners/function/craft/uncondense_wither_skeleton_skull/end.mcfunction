advancement revoke @s only craftable_spawners:craft/uncondense_wither_skeleton_skull/end
execute unless score @s cs.recipe matches 37 run return fail
function craftable_spawners:resolve/uncondense_wither_skeleton_skull
function craftable_spawners:reset
