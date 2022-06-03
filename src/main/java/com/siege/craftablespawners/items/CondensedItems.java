package com.siege.craftablespawners.items;

import org.bukkit.Material;
import org.bukkit.inventory.*;
import com.siege.craftablespawners.items.AbstractedCreationMethods;

import java.util.HashMap;

public class CondensedItems {

    public static HashMap<Material, ItemStack> condensedItems;

    public static void init() {
        condensedItems = new HashMap<>();
        // Hostile Mob items
        createCondensedItem(Material.BONE,"Bone", "condensed_bone");
        createCondensedItem(Material.ROTTEN_FLESH,"Rotten Flesh","condensed_rotten_flesh");
        createCondensedItem(Material.BLAZE_ROD,"Blaze Rod","condensed_blaze_rod");
        createCondensedItem(Material.GUNPOWDER,"Gunpowder", "condensed_gunpowder");
        createCondensedItem(Material.STRING,"String", "condensed_string");
        createCondensedItem(Material.ENDER_PEARL,"Ender Pearl", "condensed_ender_pearl");
        createCondensedItem(Material.SLIME_BLOCK,"Slime Block", "condensed_slime_block");
        createCondensedItem(Material.MAGMA_CREAM,"Magma Cream", "condensed_magma_cream");
        createCondensedItem(Material.GHAST_TEAR,"Ghast Tear", "condensed_ghast_tear");
        createCondensedItem(Material.GOLD_BLOCK,"Gold Block", "condensed_gold_block");
        createCondensedItem(Material.NETHER_STAR,"Nether Star", "condensed_nether_star");
        createCondensedItem(Material.WITHER_SKELETON_SKULL,"Wither Skeleton Skull", "condensed_wither_skeleton_skull");
        createCondensedItem(Material.REDSTONE_BLOCK,"Redstone Block", "condensed_redstone_block");
        // Friendly Mob Items
        createCondensedItem(Material.IRON_BLOCK,"Iron Block", "condensed_iron_block");
        createCondensedItem(Material.PORKCHOP,"Porkchop", "condensed_porkchop");
        createCondensedItem(Material.INK_SAC,"Ink Sac", "condensed_ink_sac");
        createCondensedItem(Material.EMERALD_BLOCK,"Emerald Block", "condensed_emerald_block");
        createCondensedItem(Material.CHICKEN,"Chicken", "condensed_chicken");
        createCondensedItem(Material.FEATHER,"Feather", "condensed_feather");
        createCondensedItem(Material.WHITE_WOOL,"White Wool", "condensed_white_wool");
        createCondensedItem(Material.MUTTON,"Mutton", "condensed_mutton");
        createCondensedItem(Material.CARVED_PUMPKIN,"Carved Pumpkin", "condensed_carved_pumpkin");
        createCondensedItem(Material.SNOW_BLOCK,"Snow Block", "condensed_snow_block");
        createCondensedItem(Material.LEATHER,"Leather", "condensed_leather");
        createCondensedItem(Material.BEEF,"Beef", "condensed_beef");

    }

    private static void createCondensedItem(Material material, String name, String recipeKey) {
        ItemStack item = AbstractedCreationMethods.createItem(material, 1, "§2Condensed "+name);
        AbstractedCreationMethods.condenseItems(item,recipeKey, new ItemStack(material,1));
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(material,9),"revert_"+recipeKey, item);
        condensedItems.put(material,item);
    }

}