advancement revoke @s only craftable_spawners:craft/condense_rabbit/end
execute unless score @s cs.recipe matches 30 run return fail
function craftable_spawners:resolve/condense_rabbit
function craftable_spawners:reset
