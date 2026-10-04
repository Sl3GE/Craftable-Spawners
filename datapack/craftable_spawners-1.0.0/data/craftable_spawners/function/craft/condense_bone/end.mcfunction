advancement revoke @s only craftable_spawners:craft/condense_bone/end
execute unless score @s cs.recipe matches 1 run return fail
function craftable_spawners:resolve/condense_bone
function craftable_spawners:reset
