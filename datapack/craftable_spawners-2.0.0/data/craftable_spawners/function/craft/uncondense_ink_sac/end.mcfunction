advancement revoke @s only craftable_spawners:craft/uncondense_ink_sac/end
execute unless score @s cs.recipe matches 47 run return fail
function craftable_spawners:resolve/uncondense_ink_sac
function craftable_spawners:reset
