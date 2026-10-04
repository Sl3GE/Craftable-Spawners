advancement revoke @s only craftable_spawners:craft/uncondense_phantom_membrane/end
execute unless score @s cs.recipe matches 103 run return fail
function craftable_spawners:resolve/uncondense_phantom_membrane
function craftable_spawners:reset
