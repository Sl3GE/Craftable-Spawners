$item replace entity @s player.cursor with minecraft:sculk_catalyst[minecraft:item_name={"text":"Condensed Sculk Catalyst","color":"dark_green"},minecraft:lore=[{"text":"Worth 9 Sculk Catalyst","color":"gray","italic":false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={"craftable_spawners":{"group":"condensed","tier":"condensed","item":"sculk_catalyst"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
