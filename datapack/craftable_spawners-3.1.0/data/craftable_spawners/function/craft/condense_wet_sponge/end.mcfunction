advancement revoke @s only craftable_spawners:craft/condense_wet_sponge/end
execute unless score @s cs.recipe matches 57 run return fail
function craftable_spawners:resolve/condense_wet_sponge
function craftable_spawners:reset
