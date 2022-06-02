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
        createCondensedBone();
        createCondensedRottenFlesh();
        createCondensedBlazeRod();
        createCondensedGunpowder();
        createCondensedString();
        createCondensedEnderPearl();
        createCondensedSlimeBlock();
        createCondensedMagmaCream();
        createCondensedGhastTear();
        createCondensedGoldBlock();
        createCondensedNetherStar();
        createCondensedWitherSkeletonSkull();
        createCondensedBlockOfRedstone();
    }

    private static void createCondensedBone() {
        condensedBone = AbstractedCreationMethods.createItem(Material.BONE, 1, "§2Condensed Bone");

        AbstractedCreationMethods.condenseItems(condensedBone,"condensed_bone", new ItemStack(Material.BONE,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.BONE,9),"revert_condensed_bone", condensedBone);
    }

    private static void createCondensedRottenFlesh() {
        condensedRottenFlesh = AbstractedCreationMethods.createItem(Material.ROTTEN_FLESH, 1, "§2Condensed Rotten Flesh");

        AbstractedCreationMethods.condenseItems(condensedRottenFlesh,"condensed_rotten_flesh", new ItemStack(Material.ROTTEN_FLESH,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.ROTTEN_FLESH,9),"revert_condensed_rotten_flesh", condensedRottenFlesh);
    }

    private static void createCondensedBlazeRod() {
        condensedBlazeRod = AbstractedCreationMethods.createItem(Material.BLAZE_ROD, 1, "§2Condensed Blaze Rod");

        AbstractedCreationMethods.condenseItems(condensedBlazeRod,"condensed_blaze_rod", new ItemStack(Material.BLAZE_ROD,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.BLAZE_ROD,9),"revert_condensed_blaze_rod", condensedBlazeRod);
    }

    private static void createCondensedGunpowder() {
        condensedGunpowder = AbstractedCreationMethods.createItem(Material.GUNPOWDER, 1, "§2Condensed Gunpowder");

        AbstractedCreationMethods.condenseItems(condensedGunpowder,"condensed_gunpowder", new ItemStack(Material.GUNPOWDER,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.GUNPOWDER,9),"revert_condensed_gunpowder", condensedGunpowder);
    }

    private static void createCondensedString() {
        condensedString = AbstractedCreationMethods.createItem(Material.STRING, 1, "§2Condensed String");

        AbstractedCreationMethods.condenseItems(condensedString,"condensed_string", new ItemStack(Material.STRING,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.STRING,9),"revert_condensed_string", condensedString);
    }

    private static void createCondensedEnderPearl() {
        condensedEnderPearl = AbstractedCreationMethods.createItem(Material.ENDER_PEARL, 1, "§2Condensed Ender Pearl");

        AbstractedCreationMethods.condenseItems(condensedEnderPearl,"condensed_ender_pearl", new ItemStack(Material.ENDER_PEARL,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.ENDER_PEARL,9),"revert_condensed_ender_pearl", condensedEnderPearl);
    }

    private static void createCondensedSlimeBlock() {
        condensedSlimeBlock = AbstractedCreationMethods.createItem(Material.SLIME_BLOCK, 1, "§2Condensed Slime Block");

        AbstractedCreationMethods.condenseItems(condensedSlimeBlock,"condensed_slime_block", new ItemStack(Material.SLIME_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.SLIME_BLOCK,9),"revert_condensed_slime_block", condensedSlimeBlock);
    }

    private static void createCondensedMagmaCream() {
        condensedMagmaCream = AbstractedCreationMethods.createItem(Material.MAGMA_CREAM, 1, "§2Condensed Magma Cream");

        AbstractedCreationMethods.condenseItems(condensedMagmaCream,"condensed_magma_cream", new ItemStack(Material.MAGMA_CREAM,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.MAGMA_CREAM,9),"revert_condensed_magma_cream", condensedMagmaCream);
    }

    private static void createCondensedGhastTear() {
        condensedGhastTear = AbstractedCreationMethods.createItem(Material.GHAST_TEAR, 1, "§2Condensed Ghast Tear");

        AbstractedCreationMethods.condenseItems(condensedGhastTear,"condensed_ghast_tear", new ItemStack(Material.GHAST_TEAR,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.GHAST_TEAR,9),"revert_condensed_ghast_tear", condensedGhastTear);
    }

    private static void createCondensedGoldBlock() {
        condensedGoldBlock = AbstractedCreationMethods.createItem(Material.GOLD_BLOCK, 1, "§2Condensed Gold Block");

        AbstractedCreationMethods.condenseItems(condensedGoldBlock,"condensed_gold_block", new ItemStack(Material.GOLD_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.GOLD_BLOCK,9),"revert_condensed_gold_block", condensedGoldBlock);
    }

    private static void createCondensedNetherStar() {
        condensedNetherStar = AbstractedCreationMethods.createItem(Material.NETHER_STAR, 1, "§2Condensed Nether Star");

        AbstractedCreationMethods.condenseItems(condensedNetherStar,"condensed_nether_star", new ItemStack(Material.NETHER_STAR,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.NETHER_STAR,9),"revert_condensed_nether_star", condensedNetherStar);
    }

    private static void createCondensedWitherSkeletonSkull() {
        condensedWitherSkeletonSkull = AbstractedCreationMethods.createItem(Material.WITHER_SKELETON_SKULL, 1, "§2Condensed Wither Skeleton Skull");

        AbstractedCreationMethods.condenseItems(condensedWitherSkeletonSkull,"condensed_wither_skeleton_skull", new ItemStack(Material.WITHER_SKELETON_SKULL,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.WITHER_SKELETON_SKULL,9),"revert_condensed_wither_skeleton_skull", condensedWitherSkeletonSkull);
    }

    private static void createCondensedBlockOfRedstone() {
        condensedBlockOfRedstone = AbstractedCreationMethods.createItem(Material.REDSTONE_BLOCK, 1, "§2Condensed Block Of Redstone");

        AbstractedCreationMethods.condenseItems(condensedBlockOfRedstone,"condensed_block_of_redstone", new ItemStack(Material.REDSTONE_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.REDSTONE_BLOCK,9),"revert_condensed_block_of_redstone", condensedBlockOfRedstone);
    }
}
