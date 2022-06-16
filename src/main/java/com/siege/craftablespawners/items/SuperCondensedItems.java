package com.siege.craftablespawners.items;

import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

public class SuperCondensedItems {

    // Hostile Mob items
    public static ItemStack superCondensedBone;
    public static ItemStack superCondensedRottenFlesh;
    public static ItemStack superCondensedBlazeRod;
    public static ItemStack superCondensedGunpowder;
    public static ItemStack superCondensedString;
    public static ItemStack superCondensedEnderPearl;
    public static ItemStack superCondensedMagmaCream;
    public static ItemStack superCondensedRedstoneBlock;
    // Friendly Mob Items
    public static ItemStack superCondensedLeather;
    public static ItemStack superCondensedBeef;
    public static ItemStack superCondensedCarvedPumpkin;
    public static ItemStack superCondensedSnowBlock;
    public static ItemStack superCondensedWhiteWool;
    public static ItemStack superCondensedMutton;
    public static ItemStack superCondensedPorkchop;
    public static ItemStack superCondensedInkSac;
    public static ItemStack superCondensedChicken;
    public static ItemStack superCondensedFeather;

    public static void init() {
        // Hostile Mob Items
        superCondensedBone = createSuperCondensedItem(Material.BONE,"Bone","super_condensed_bone", CondensedItems.condensedBone);
        superCondensedRottenFlesh = createSuperCondensedItem(Material.ROTTEN_FLESH,"Rotten Flesh","super_condensed_rotten_flesh", CondensedItems.condensedRottenFlesh);
        superCondensedBlazeRod = createSuperCondensedItem(Material.BLAZE_ROD,"Blaze Rod","super_condensed_blaze_rod", CondensedItems.condensedBlazeRod);
        superCondensedGunpowder = createSuperCondensedItem(Material.GUNPOWDER,"Gunpowder","super_condensed_gunpowder", CondensedItems.condensedGunpowder);
        superCondensedString = createSuperCondensedItem(Material.STRING,"String","super_condensed_string", CondensedItems.condensedString);
        superCondensedEnderPearl = createSuperCondensedItem(Material.ENDER_PEARL,"Ender Pearl","super_condensed_ender_pearl", CondensedItems.condensedEnderPearl);
        superCondensedMagmaCream = createSuperCondensedItem(Material.MAGMA_CREAM,"Magma Cream","super_condensed_magma_cream", CondensedItems.condensedMagmaCream);
        superCondensedRedstoneBlock = createSuperCondensedItem(Material.REDSTONE_BLOCK,"Redstone Block","super_condensed_redstone_block", CondensedItems.condensedRedstoneBlock);
        // Friendly Mob Items
        superCondensedLeather = createSuperCondensedItem(Material.LEATHER,"Leather","super_condensed_leather", CondensedItems.condensedLeather);
        superCondensedBeef = createSuperCondensedItem(Material.BEEF,"Beef","super_condensed_beef", CondensedItems.condensedBeef);
        superCondensedCarvedPumpkin = createSuperCondensedItem(Material.CARVED_PUMPKIN,"Carved Pumpkin","super_condensed_carved_pumpkin", CondensedItems.condensedCarvedPumpkin);
        superCondensedSnowBlock = createSuperCondensedItem(Material.SNOW_BLOCK,"Snow Block","super_condensed_snow_block", CondensedItems.condensedSnowBlock);
        superCondensedWhiteWool = createSuperCondensedItem(Material.WHITE_WOOL,"White Wool","super_condensed_white_wool", CondensedItems.condensedWhiteWool);
        superCondensedMutton = createSuperCondensedItem(Material.MUTTON,"Mutton","super_condensed_mutton", CondensedItems.condensedMutton);
        superCondensedPorkchop = createSuperCondensedItem(Material.PORKCHOP,"Porkchop","super_condensed_porkchop", CondensedItems.condensedPorkchop);
        superCondensedInkSac = createSuperCondensedItem(Material.INK_SAC,"Ink Sac","super_condensed_ink_sac", CondensedItems.condensedInkSac);
        superCondensedChicken = createSuperCondensedItem(Material.CHICKEN,"Chicken","super_condensed_chicken", CondensedItems.condensedChicken);
        superCondensedFeather = createSuperCondensedItem(Material.FEATHER,"Feather","super_condensed_feather", CondensedItems.condensedFeather);

    }

    private static ItemStack createSuperCondensedItem(Material material, String name, String recipeKey, ItemStack condensedItem) {
        ItemStack item = AbstractedCreationMethods.createShinyItem(material,1,"§1Super Condensed "+name);
        AbstractedCreationMethods.condenseItems(item,recipeKey, condensedItem);
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createShinyItem(material, 9, "§2Condensed "+name),"revert_"+recipeKey, item);
        return item;
    }
}
