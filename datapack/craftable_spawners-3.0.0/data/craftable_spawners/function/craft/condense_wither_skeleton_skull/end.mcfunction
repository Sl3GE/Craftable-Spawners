advancement revoke @s only craftable_spawners:craft/condense_wither_skeleton_skull/end
execute unless score @s cs.recipe matches 12 run return fail
function craftable_spawners:resolve/condense_wither_skeleton_skull
function craftable_spawners:reset
