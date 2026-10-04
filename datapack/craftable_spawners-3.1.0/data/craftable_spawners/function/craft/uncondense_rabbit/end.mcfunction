advancement revoke @s only craftable_spawners:craft/uncondense_rabbit/end
execute unless score @s cs.recipe matches 91 run return fail
function craftable_spawners:resolve/uncondense_rabbit
function craftable_spawners:reset
