$item replace entity @s player.cursor with minecraft:ink_sac[minecraft:item_name={text:"Condensed Ink Sac",color:"dark_green"},minecraft:lore=[{text:"Worth 9 Ink Sac",color:"gray",italic:false}],minecraft:enchantment_glint_override=true,minecraft:custom_data={craftable_spawners:{group:"condensed",tier:"condensed",item:"ink_sac"}}] $(count)
scoreboard players set #cursor cs.tmp 0
scoreboard players set #r cs.tmp 0
