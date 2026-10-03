advancement revoke @s only craftable_spawners:craft/condense_porkchop/end
execute unless score @s cs.recipe matches 21 run return fail
function craftable_spawners:resolve/condense_porkchop
function craftable_spawners:reset
