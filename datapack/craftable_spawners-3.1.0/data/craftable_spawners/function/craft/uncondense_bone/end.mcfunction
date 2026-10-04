advancement revoke @s only craftable_spawners:craft/uncondense_bone/end
execute unless score @s cs.recipe matches 62 run return fail
function craftable_spawners:resolve/uncondense_bone
function craftable_spawners:reset
