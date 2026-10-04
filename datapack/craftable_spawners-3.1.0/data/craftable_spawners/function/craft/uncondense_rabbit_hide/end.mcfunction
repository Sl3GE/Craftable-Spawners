advancement revoke @s only craftable_spawners:craft/uncondense_rabbit_hide/end
execute unless score @s cs.recipe matches 92 run return fail
function craftable_spawners:resolve/uncondense_rabbit_hide
function craftable_spawners:reset
