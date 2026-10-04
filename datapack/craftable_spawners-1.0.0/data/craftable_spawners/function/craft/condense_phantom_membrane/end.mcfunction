advancement revoke @s only craftable_spawners:craft/condense_phantom_membrane/end
execute unless score @s cs.recipe matches 42 run return fail
function craftable_spawners:resolve/condense_phantom_membrane
function craftable_spawners:reset
