advancement revoke @s only craftable_spawners:craft/uncondense_pufferfish/end
execute unless score @s cs.recipe matches 94 run return fail
function craftable_spawners:resolve/uncondense_pufferfish
function craftable_spawners:reset
