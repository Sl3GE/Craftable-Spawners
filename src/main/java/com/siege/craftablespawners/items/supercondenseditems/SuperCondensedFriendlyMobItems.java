package com.siege.craftablespawners.items.supercondenseditems;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.condenseditems.CondensedFriendlyMobItems;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

public class SuperCondensedFriendlyMobItems {
    public static ItemStack superCondensedLeather;
    public static ItemStack superCondensedBeef;
    public static ItemStack superCondensedCarvedPumpkin;
    public static ItemStack superCondensedSnowBlock;
    public static ItemStack superCondensedWhiteWool;
    public static ItemStack superCondensedMutton;
    public static ItemStack superCondensedPorkChop;
    public static ItemStack superCondensedInkSac;
    public static ItemStack superCondensedChicken;
    public static ItemStack superCondensedFeather;

    public static void init() {
        createSuperCondensedCowDrops();
        createSuperCondensedSnowmanDrops();
        superCreateCondensedSheepDrops();
        createSuperCondensedPorkChop();
        createSuperCondensedInkSac();
        superCreateCondensedChickenDrops();
    }

    private static void createSuperCondensedCowDrops() {
        superCondensedLeather = AbstractedCreationMethods.createItem(Material.LEATHER,1,"§1Super Condensed Leather");
        superCondensedBeef = AbstractedCreationMethods.createItem(Material.BEEF,1,"§1Super Condensed Beef");

        AbstractedCreationMethods.condenseItems(superCondensedLeather,"super_condensed_leather", CondensedFriendlyMobItems.condensedLeather);
        AbstractedCreationMethods.condenseItems(superCondensedBeef,"super_condensed_beef", CondensedFriendlyMobItems.condensedBeef);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.LEATHER, 9, "§2Condensed Leather"),"revert_super_condensed_leather", superCondensedLeather);
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.BEEF, 9, "§2Condensed Beef"),"revert_super_condensed_beef", superCondensedBeef);
    }

    private static void createSuperCondensedSnowmanDrops() {
        superCondensedCarvedPumpkin = AbstractedCreationMethods.createItem(Material.CARVED_PUMPKIN,1,"§1Super Condensed Carved Pumpkin");
        superCondensedSnowBlock = AbstractedCreationMethods.createItem(Material.SNOW_BLOCK,1,"§1Super Condensed Snow Block");

        AbstractedCreationMethods.condenseItems(superCondensedCarvedPumpkin,"super_condensed_carved_pumpkin", CondensedFriendlyMobItems.condensedCarvedPumpkin);
        AbstractedCreationMethods.condenseItems(superCondensedSnowBlock,"super_condensed_snow_block", CondensedFriendlyMobItems.condensedSnowBlock);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.CARVED_PUMPKIN, 9, "§2Condensed Carved Pumpkin"),"revert_super_condensed_carved_pumpkin", superCondensedCarvedPumpkin);
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.SNOW_BLOCK, 9, "§2Condensed Snow Block"),"revert_super_condensed_snow_block", superCondensedSnowBlock);
    }

    private static void superCreateCondensedSheepDrops() {
        superCondensedWhiteWool = AbstractedCreationMethods.createItem(Material.WHITE_WOOL,1,"§1Super Condensed White Wool");
        superCondensedMutton = AbstractedCreationMethods.createItem(Material.MUTTON,1,"§1Super Condensed Mutton");

        AbstractedCreationMethods.condenseItems(superCondensedWhiteWool,"super_condensed_white_wool", CondensedFriendlyMobItems.condensedWhiteWool);
        AbstractedCreationMethods.condenseItems(superCondensedMutton,"super_condensed_mutton", CondensedFriendlyMobItems.condensedMutton);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.WHITE_WOOL, 9, "§2Condensed White Wool"),"revert_super_condensed_white_wool", superCondensedWhiteWool);
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.MUTTON, 9, "§2Condensed Mutton"),"revert_super_condensed_mutton", superCondensedMutton);
    }

    private static void createSuperCondensedPorkChop() {
        superCondensedPorkChop = AbstractedCreationMethods.createItem(Material.PORKCHOP,1,"§1Super Condensed Porkchop");

        AbstractedCreationMethods.condenseItems(superCondensedPorkChop,"super_condensed_porkchop", CondensedFriendlyMobItems.condensedPorkChop);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.PORKCHOP, 9, "§2Condensed Porkchop"),"revert_super_condensed_porkchop", superCondensedPorkChop);
    }

    private static void createSuperCondensedInkSac() {
        superCondensedInkSac = AbstractedCreationMethods.createItem(Material.INK_SAC,1,"§1Super Condensed Ink Sac");

        AbstractedCreationMethods.condenseItems(superCondensedInkSac,"super_condensed_ink_sac", CondensedFriendlyMobItems.condensedInkSac);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.INK_SAC, 9, "§2Condensed Ink Sac"),"revert_super_condensed_ink_sac", superCondensedInkSac);
    }

    private static void superCreateCondensedChickenDrops() {
        superCondensedChicken = AbstractedCreationMethods.createItem(Material.CHICKEN,1,"§1Super Condensed Chicken");
        superCondensedFeather = AbstractedCreationMethods.createItem(Material.FEATHER,1,"§1Super Condensed Feather");

        AbstractedCreationMethods.condenseItems(superCondensedChicken,"super_condensed_chicken", CondensedFriendlyMobItems.condensedChicken);
        AbstractedCreationMethods.condenseItems(superCondensedFeather,"super_condensed_feather", CondensedFriendlyMobItems.condensedFeather);

        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.CHICKEN, 9, "§2Condensed Chicken"),"revert_super_condensed_chicken", superCondensedChicken);
        AbstractedCreationMethods.separateCondensedItem(AbstractedCreationMethods.createItem(Material.FEATHER, 9, "§2Condensed Feather"),"revert_super_condensed_feather", superCondensedFeather);
    }
}
