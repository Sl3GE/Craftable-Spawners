advancement revoke @s only craftable_spawners:craft/condense_spider_eye/end
execute unless score @s cs.recipe matches 50 run return fail
function craftable_spawners:resolve/condense_spider_eye
function craftable_spawners:reset
