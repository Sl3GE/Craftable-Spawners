$item replace entity @s player.cursor with minecraft:redstone_block[minecraft:item_name={text:"Super Condensed Redstone Block",color:"dark_blue"},minecraft:lore=[{text:"Worth 81 Redstone Block",color:"gray",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={craftable_spawners:{group:"condensed",tier:"super_condensed",item:"redstone_block"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
