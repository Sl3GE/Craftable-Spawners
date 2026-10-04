advancement revoke @s only craftable_spawners:craft/uncondense_glow_ink_sac/end
execute unless score @s cs.recipe matches 93 run return fail
function craftable_spawners:resolve/uncondense_glow_ink_sac
function craftable_spawners:reset
