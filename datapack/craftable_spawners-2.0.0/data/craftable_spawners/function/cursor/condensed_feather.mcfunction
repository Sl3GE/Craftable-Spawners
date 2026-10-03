$item replace entity @s player.cursor with minecraft:feather[minecraft:item_name={"text":"Condensed Feather","color":"dark_green"},minecraft:lore=[{"text":"Worth 9 Feather","color":"gray","italic":false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={"craftable_spawners":{"group":"condensed","tier":"condensed","item":"feather"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
