advancement revoke @s only craftable_spawners:craft/uncondense_porkchop/end
execute unless score @s cs.recipe matches 46 run return fail
function craftable_spawners:resolve/uncondense_porkchop
function craftable_spawners:reset
