advancement revoke @s only craftable_spawners:craft/condense_magma_cream/end
execute unless score @s cs.recipe matches 8 run return fail
function craftable_spawners:resolve/condense_magma_cream
function craftable_spawners:reset
