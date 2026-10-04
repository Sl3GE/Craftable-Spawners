advancement revoke @s only craftable_spawners:craft/uncondense_spider_eye/end
execute unless score @s cs.recipe matches 111 run return fail
function craftable_spawners:resolve/uncondense_spider_eye
function craftable_spawners:reset
