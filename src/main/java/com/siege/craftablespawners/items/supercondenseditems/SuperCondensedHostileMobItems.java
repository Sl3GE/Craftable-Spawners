package com.siege.craftablespawners.items.supercondenseditems;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.condenseditems.CondensedHostileMobItems;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

public class SuperCondensedHostileMobItems {

    public static ItemStack superCondensedBone;
    public static ItemStack superCondensedRottenFlesh;
    public static ItemStack superCondensedBlazeRod;
    public static ItemStack superCondensedGunpowder;
    public static ItemStack superCondensedString;
    public static ItemStack superCondensedEnderPearl;
    public static ItemStack superCondensedMagmaCream;
    public static ItemStack superCondensedBlockOfRedstone;

    public static void init() {
        createSuperCondensedBone();
        createSuperCondensedRottenFlesh();
        createSuperCondensedBlazeRod();
        createSuperCondensedGunpowder();
        createSuperCondensedString();
        createSuperCondensedEnderPearl();
        createSuperCondensedMagmaCream();
        createSuperCondensedBlockOfRedstone();
    }

    private static void createSuperCondensedBone() {
        superCondensedBone = AbstractedCreationMethods.createItem(Material.BONE,1,"§1Super Condensed Bone");

        AbstractedCreationMethods.condenseItems(superCondensedBone,"super_condensed_bone", CondensedHostileMobItems.condensedBone);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.BONE, 9, "§2Condensed Bone"),"revert_super_condensed_bone", superCondensedBone);
    }

    private static void createSuperCondensedRottenFlesh() {
        superCondensedRottenFlesh = AbstractedCreationMethods.createItem(Material.ROTTEN_FLESH,1,"§1Super Condensed Rotten Flesh");

        AbstractedCreationMethods.condenseItems(superCondensedRottenFlesh,"super_condensed_rotten_flesh", CondensedHostileMobItems.condensedRottenFlesh);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.ROTTEN_FLESH, 9, "§2Condensed Rotten Flesh"),"revert_super_condensed_rotten_flesh", superCondensedRottenFlesh);
    }

    private static void createSuperCondensedBlazeRod() {
        superCondensedBlazeRod = AbstractedCreationMethods.createItem(Material.BLAZE_ROD,1,"§1Super Condensed Blaze Rod");

        AbstractedCreationMethods.condenseItems(superCondensedBlazeRod,"super_condensed_blaze_rod", CondensedHostileMobItems.condensedBlazeRod);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.BLAZE_ROD, 9, "§2Condensed Bone"),"revert_super_condensed_blaze_rod", superCondensedBlazeRod);
    }

    private static void createSuperCondensedGunpowder() {
        superCondensedGunpowder = AbstractedCreationMethods.createItem(Material.GUNPOWDER, 1, "§1Super Condensed Gunpowder");

        AbstractedCreationMethods.condenseItems(superCondensedGunpowder,"super_condensed_gunpowder", CondensedHostileMobItems.condensedGunpowder);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.GUNPOWDER, 9, "§2Condensed Gunpowder"),"revert_super_condensed_gunpowder", superCondensedGunpowder);
    }

    private static void createSuperCondensedString() {
        superCondensedString = AbstractedCreationMethods.createItem(Material.STRING, 1, "§1Super Condensed String");

        AbstractedCreationMethods.condenseItems(superCondensedString,"super_condensed_string", CondensedHostileMobItems.condensedString);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.STRING, 9, "§2Condensed String"),"revert_super_condensed_string", superCondensedString);
    }

    private static void createSuperCondensedEnderPearl() {
        superCondensedEnderPearl = AbstractedCreationMethods.createItem(Material.ENDER_PEARL, 1, "§1Super Condensed Ender Pearl");

        AbstractedCreationMethods.condenseItems(superCondensedEnderPearl,"super_condensed_ender_pearl", CondensedHostileMobItems.condensedEnderPearl);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.ENDER_PEARL, 9, "§2Condensed Ender Pearl"),"revert_super_condensed_ender_pearl", superCondensedEnderPearl);
    }

    private static void createSuperCondensedMagmaCream() {
        superCondensedMagmaCream = AbstractedCreationMethods.createItem(Material.MAGMA_CREAM, 1, "§1Super Condensed Magma Cream");

        AbstractedCreationMethods.condenseItems(superCondensedMagmaCream,"super_condensed_magma_cream", CondensedHostileMobItems.condensedMagmaCream);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.MAGMA_CREAM, 9, "§2Condensed Magma Cream"),"revert_super_condensed_magma_cream", superCondensedMagmaCream);
    }

    private static void createSuperCondensedBlockOfRedstone() {
        superCondensedBlockOfRedstone = AbstractedCreationMethods.createItem(Material.REDSTONE_BLOCK, 1, "§1Super Condensed Block Of Redstone");

        AbstractedCreationMethods.condenseItems(superCondensedBlockOfRedstone,"super_condensed_block_of_redstone", CondensedHostileMobItems.condensedBlockOfRedstone);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.REDSTONE_BLOCK, 9, "§2Condensed Block Of Redstone"),"revert_super_condensed_block_of_redstone", superCondensedBlockOfRedstone);
    }
}
