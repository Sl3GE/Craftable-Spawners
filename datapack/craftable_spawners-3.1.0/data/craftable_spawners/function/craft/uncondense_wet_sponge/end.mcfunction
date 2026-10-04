advancement revoke @s only craftable_spawners:craft/uncondense_wet_sponge/end
execute unless score @s cs.recipe matches 118 run return fail
function craftable_spawners:resolve/uncondense_wet_sponge
function craftable_spawners:reset
