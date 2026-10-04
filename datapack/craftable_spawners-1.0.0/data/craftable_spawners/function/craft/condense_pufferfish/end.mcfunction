advancement revoke @s only craftable_spawners:craft/condense_pufferfish/end
execute unless score @s cs.recipe matches 33 run return fail
function craftable_spawners:resolve/condense_pufferfish
function craftable_spawners:reset
