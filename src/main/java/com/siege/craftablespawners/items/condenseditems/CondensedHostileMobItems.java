package com.siege.craftablespawners.items.condenseditems;

import org.bukkit.Material;
import org.bukkit.inventory.*;
import com.siege.craftablespawners.items.AbstractedCreationMethods;

public class CondensedHostileMobItems {
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
    public static ItemStack condensedBlockOfRedstone;

    public static void init() {
        createCondensedItem(Material.BONE,"§2Condensed Bone", "condensed_bone");
        createCondensedItem(Material.ROTTEN_FLESH,"§2Condensed Rotten Flesh","condensed_rotten_flesh");
        createCondensedItem(Material.BLAZE_ROD,"§2Condensed Blaze Rod","condensed_blaze_rod");
        createCondensedItem(Material.GUNPOWDER,"§2Condensed Gunpowder", "condensed_gunpowder");
        createCondensedItem(Material.STRING,"§2Condensed String", "condensed_string");
        createCondensedItem(Material.ENDER_PEARL,"§2Condensed Ender Pearl", "condensed_ender_pearl");
        createCondensedItem(Material.SLIME_BLOCK,"§2Condensed Slime Block", "condensed_slime_block");
        createCondensedItem(Material.MAGMA_CREAM,"§2Condensed Magma Cream", "condensed_magma_cream");
        createCondensedItem(Material.GHAST_TEAR,"§2Condensed Ghast Tear", "condensed_ghast_tear");
        createCondensedItem(Material.GOLD_BLOCK,"§2Condensed Gold Block", "condensed_gold_block");
        createCondensedItem(Material.NETHER_STAR,"§2Condensed Nether Star", "condensed_nether_star");
        createCondensedItem(Material.WITHER_SKELETON_SKULL,"§2Condensed Wither Skeleton Skull", "condensed_wither_skeleton_skull");
        createCondensedItem(Material.REDSTONE_BLOCK,"§2Condensed Redstone Block", "condensed_redstone_block");
    }

    private static void createCondensedItem(Material material, String name, String recipeKey) {
        ItemStack item = AbstractedCreationMethods.createItem(material, 1, name);
        AbstractedCreationMethods.condenseItems(item,recipeKey, new ItemStack(material,1));
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(material,9),"revert_"+recipeKey, item);
    }

}