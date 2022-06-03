package com.siege.craftablespawners.items;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.CondensedItems;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

import java.util.HashMap;

public class SuperCondensedItems {

    public static HashMap<Material, ItemStack> superCondensedItems;

    public static void init() {
        superCondensedItems = new HashMap<>();
        // Friendly Mob Items
        createSuperCondensedItem(Material.LEATHER,"Leather","super_condensed_leather");
        createSuperCondensedItem(Material.BEEF,"Beef","super_condensed_beef");
        createSuperCondensedItem(Material.CARVED_PUMPKIN,"Carved Pumpkin","super_condensed_carved_pumpkin");
        createSuperCondensedItem(Material.SNOW_BLOCK,"Snow Block","super_condensed_snow_block");
        createSuperCondensedItem(Material.WHITE_WOOL,"White Wool","super_condensed_white_wool");
        createSuperCondensedItem(Material.MUTTON,"Mutton","super_condensed_mutton");
        createSuperCondensedItem(Material.PORKCHOP,"Porkchop","super_condensed_porkchop");
        createSuperCondensedItem(Material.INK_SAC,"Ink Sac","super_condensed_ink_sac");
        createSuperCondensedItem(Material.CHICKEN,"Chicken","super_condensed_chicken");
        createSuperCondensedItem(Material.FEATHER,"Feather","super_condensed_feather");
        // Hostile Mob Items
        createSuperCondensedItem(Material.BONE,"Bone","super_condensed_bone");
        createSuperCondensedItem(Material.ROTTEN_FLESH,"Rotten Flesh","super_condensed_rotten_flesh");
        createSuperCondensedItem(Material.BLAZE_ROD,"Blaze Rod","super_condensed_blaze_rod");
        createSuperCondensedItem(Material.GUNPOWDER,"Gunpowder","super_condensed_gunpowder");
        createSuperCondensedItem(Material.STRING,"String","super_condensed_string");
        createSuperCondensedItem(Material.ENDER_PEARL,"Ender Pearl","super_condensed_ender_pearl");
        createSuperCondensedItem(Material.MAGMA_CREAM,"Magma Cream","super_condensed_magma_cream");
        createSuperCondensedItem(Material.REDSTONE_BLOCK,"Redstone Block","super_condensed_redstone_block");

    }

    private static void createSuperCondensedItem(Material material, String name, String recipeKey) {
        ItemStack item = AbstractedCreationMethods.createItem(material,1,"§1Super Condensed "+name);
        AbstractedCreationMethods.condenseItems(item,recipeKey, CondensedItems.condensedItems.get(name));
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(material, 9, "§2Condensed "+name),"revert_"+recipeKey, item);
        superCondensedItems.put(material,item);
    }
}
