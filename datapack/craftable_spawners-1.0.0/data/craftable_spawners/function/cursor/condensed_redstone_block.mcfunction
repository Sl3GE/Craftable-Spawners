$item replace entity @s player.cursor with minecraft:redstone_block[minecraft:item_name={"text":"Condensed Redstone Block","color":"dark_green"},minecraft:lore=[{"text":"Worth 9 Redstone Block","color":"gray","italic":false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={"craftable_spawners":{"group":"condensed","tier":"condensed","item":"redstone_block"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
