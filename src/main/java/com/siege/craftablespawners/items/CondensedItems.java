package com.siege.craftablespawners.items;

import org.bukkit.Material;
import org.bukkit.inventory.*;

public class CondensedItems {

    // Hostile Mob items
    public static ItemStack condensedBone;
    public static ItemStack condensedRottenFlesh;
    public static ItemStack condensedBlazeRod;
    public static ItemStack condensedGunpowder;
    public static ItemStack condensedString;
    public static ItemStack condensedEnderPearl;
    public static ItemStack condensedSlimeBlock;
    public static ItemStack condensedMagmaCream;
    public static ItemStack condensedGhastTear;
    public static ItemStack condensedGoldBlock;
    public static ItemStack condensedNetherStar;
    public static ItemStack condensedWitherSkeletonSkull;
    public static ItemStack condensedRedstoneBlock;
    // Friendly Mob Items
    public static ItemStack condensedIronBlock;
    public static ItemStack condensedLeather;
    public static ItemStack condensedBeef;
    public static ItemStack condensedCarvedPumpkin;
    public static ItemStack condensedSnowBlock;
    public static ItemStack condensedWhiteWool;
    public static ItemStack condensedMutton;
    public static ItemStack condensedPorkchop;
    public static ItemStack condensedInkSac;
    public static ItemStack condensedChicken;
    public static ItemStack condensedFeather;
    public static ItemStack condensedEmeraldBlock;

    public static void init() {
        // Hostile Mob items
        condensedBone = createCondensedItem(Material.BONE,"Bone", "condensed_bone");
        condensedRottenFlesh = createCondensedItem(Material.ROTTEN_FLESH,"Rotten Flesh","condensed_rotten_flesh");
        condensedBlazeRod = createCondensedItem(Material.BLAZE_ROD,"Blaze Rod","condensed_blaze_rod");
        condensedGunpowder = createCondensedItem(Material.GUNPOWDER,"Gunpowder", "condensed_gunpowder");
        condensedString = createCondensedItem(Material.STRING,"String", "condensed_string");
        condensedEnderPearl = createCondensedItem(Material.ENDER_PEARL,"Ender Pearl", "condensed_ender_pearl");
        condensedSlimeBlock = createCondensedItem(Material.SLIME_BLOCK,"Slime Block", "condensed_slime_block");
        condensedMagmaCream = createCondensedItem(Material.MAGMA_CREAM,"Magma Cream", "condensed_magma_cream");
        condensedGhastTear = createCondensedItem(Material.GHAST_TEAR,"Ghast Tear", "condensed_ghast_tear");
        condensedGoldBlock = createCondensedItem(Material.GOLD_BLOCK,"Gold Block", "condensed_gold_block");
        condensedNetherStar = createCondensedItem(Material.NETHER_STAR,"Nether Star", "condensed_nether_star");
        condensedWitherSkeletonSkull = createCondensedItem(Material.WITHER_SKELETON_SKULL,"Wither Skeleton Skull", "condensed_wither_skeleton_skull");
        condensedRedstoneBlock = createCondensedItem(Material.REDSTONE_BLOCK,"Redstone Block", "condensed_redstone_block");
        // Friendly Mob Items
        condensedIronBlock = createCondensedItem(Material.IRON_BLOCK,"Iron Block", "condensed_iron_block");
        condensedLeather = createCondensedItem(Material.LEATHER,"Leather", "condensed_leather");
        condensedBeef = createCondensedItem(Material.BEEF,"Beef", "condensed_beef");
        condensedCarvedPumpkin = createCondensedItem(Material.CARVED_PUMPKIN,"Carved Pumpkin", "condensed_carved_pumpkin");
        condensedSnowBlock = createCondensedItem(Material.SNOW_BLOCK,"Snow Block", "condensed_snow_block");
        condensedWhiteWool = createCondensedItem(Material.WHITE_WOOL,"White Wool", "condensed_white_wool");
        condensedMutton = createCondensedItem(Material.MUTTON,"Mutton", "condensed_mutton");
        condensedPorkchop = createCondensedItem(Material.PORKCHOP,"Porkchop", "condensed_porkchop");
        condensedInkSac = createCondensedItem(Material.INK_SAC,"Ink Sac", "condensed_ink_sac");
        condensedChicken = createCondensedItem(Material.CHICKEN,"Chicken", "condensed_chicken");
        condensedFeather = createCondensedItem(Material.FEATHER,"Feather", "condensed_feather");
        condensedEmeraldBlock= createCondensedItem(Material.EMERALD_BLOCK,"Emerald Block", "condensed_emerald_block");

    }

    private static ItemStack createCondensedItem(Material material, String name, String recipeKey) {
        ItemStack item = AbstractedCreationMethods.createShinyItem(material, 1, "§2Condensed "+name);
        AbstractedCreationMethods.condenseItems(item,recipeKey, new ItemStack(material,1));
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(material,9),"revert_"+recipeKey, item);
        return item;
    }

}