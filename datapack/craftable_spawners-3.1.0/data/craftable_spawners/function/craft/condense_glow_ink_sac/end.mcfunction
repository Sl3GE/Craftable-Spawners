advancement revoke @s only craftable_spawners:craft/condense_glow_ink_sac/end
execute unless score @s cs.recipe matches 32 run return fail
function craftable_spawners:resolve/condense_glow_ink_sac
function craftable_spawners:reset
