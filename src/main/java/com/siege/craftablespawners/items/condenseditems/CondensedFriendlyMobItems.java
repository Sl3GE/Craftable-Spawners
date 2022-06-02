package com.siege.craftablespawners.items.condenseditems;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import org.bukkit.Material;
import org.bukkit.inventory.ItemStack;

public class CondensedFriendlyMobItems {
    public static ItemStack condensedIronBlock;
    public static ItemStack condensedLeather;
    public static ItemStack condensedBeef;
    public static ItemStack condensedCarvedPumpkin;
    public static ItemStack condensedSnowBlock;
    public static ItemStack condensedWhiteWool;
    public static ItemStack condensedMutton;
    public static ItemStack condensedPorkChop;
    public static ItemStack condensedInkSac;
    public static ItemStack condensedChicken;
    public static ItemStack condensedFeather;
    public static ItemStack condensedEmeraldBlock;

    public static void init() {
        createCondensedCowDrops();
        createCondensedIronBlock();
        createCondensedSnowmanDrops();
        createCondensedSheepDrops();
        createCondensedPorkChop();
        createCondensedInkSac();
        createCondensedChickenDrops();
        createCondensedEmeraldBlock();
    }

    private static void createCondensedIronBlock() {
        condensedIronBlock = AbstractedCreationMethods.createItem(Material.IRON_BLOCK,1,"§2Condensed Iron Block");

        AbstractedCreationMethods.condenseItems(condensedIronBlock,"condensed_iron_block", new ItemStack(Material.IRON_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.IRON_BLOCK,9),"revert_condensed_iron_block", condensedIronBlock);
    }

    private static void createCondensedCowDrops() {
        condensedLeather = AbstractedCreationMethods.createItem(Material.LEATHER,1,"§2Condensed Leather");
        condensedBeef = AbstractedCreationMethods.createItem(Material.BEEF,1,"§2Condensed Beef");

        AbstractedCreationMethods.condenseItems(condensedLeather,"condensed_leather",new ItemStack(Material.LEATHER,1));
        AbstractedCreationMethods.condenseItems(condensedBeef,"condensed_beef",new ItemStack(Material.BEEF,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.LEATHER,9),"revert_condensed_leather", condensedLeather);
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.BEEF,9),"revert_condensed_beef", condensedBeef);
    }

    private static void createCondensedSnowmanDrops() {
        condensedCarvedPumpkin = AbstractedCreationMethods.createItem(Material.CARVED_PUMPKIN,1,"§2Condensed Carved Pumpkin");
        condensedSnowBlock = AbstractedCreationMethods.createItem(Material.SNOW_BLOCK,1,"§2Condensed Snow Block");

        AbstractedCreationMethods.condenseItems(condensedCarvedPumpkin,"condensed_carved_pumpkin",new ItemStack(Material.CARVED_PUMPKIN,1));
        AbstractedCreationMethods.condenseItems(condensedSnowBlock,"condensed_snow_block",new ItemStack(Material.SNOW_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.CARVED_PUMPKIN,9),"revert_condensed_carved_pumpkin", condensedCarvedPumpkin);
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.SNOW_BLOCK,9),"revert_condensed_snow_block", condensedSnowBlock);
    }

    private static void createCondensedSheepDrops() {
        condensedWhiteWool = AbstractedCreationMethods.createItem(Material.WHITE_WOOL,1,"§2Condensed White Wool");
        condensedMutton = AbstractedCreationMethods.createItem(Material.MUTTON,1,"§2Condensed Mutton");

        AbstractedCreationMethods.condenseItems(condensedWhiteWool,"condensed_white_wool",new ItemStack(Material.WHITE_WOOL,1));
        AbstractedCreationMethods.condenseItems(condensedMutton,"condensed_mutton",new ItemStack(Material.MUTTON,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.WHITE_WOOL,9),"revert_condensed_white_wool", condensedWhiteWool);
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.MUTTON,9),"revert_condensed_mutton", condensedMutton);
    }

    private static void createCondensedPorkChop() {
        condensedPorkChop = AbstractedCreationMethods.createItem(Material.PORKCHOP,1,"§2Condensed Porkchop");

        AbstractedCreationMethods.condenseItems(condensedPorkChop,"condensed_porkchop",new ItemStack(Material.PORKCHOP,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.PORKCHOP,9),"revert_condensed_porkchop", condensedPorkChop);
    }

    private static void createCondensedInkSac() {
        condensedInkSac = AbstractedCreationMethods.createItem(Material.INK_SAC,1,"§2Condensed Ink Sac");

        AbstractedCreationMethods.condenseItems(condensedInkSac,"condensed_ink_sac",new ItemStack(Material.INK_SAC,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.INK_SAC,9),"revert_condensed_ink_sac", condensedInkSac);
    }

    private static void createCondensedChickenDrops() {
        condensedChicken = AbstractedCreationMethods.createItem(Material.CHICKEN,1,"§2Condensed Chicken");
        condensedFeather = AbstractedCreationMethods.createItem(Material.FEATHER,1,"§2Condensed Feather");

        AbstractedCreationMethods.condenseItems(condensedChicken,"condensed_chicken",new ItemStack(Material.CHICKEN,1));
        AbstractedCreationMethods.condenseItems(condensedFeather,"condensed_feather",new ItemStack(Material.FEATHER,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.CHICKEN,9),"revert_condensed_chicken", condensedChicken);
        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.FEATHER,9),"revert_condensed_feather", condensedFeather);
    }

    private static void createCondensedEmeraldBlock() {
        condensedEmeraldBlock = AbstractedCreationMethods.createItem(Material.EMERALD_BLOCK,1,"§2Condensed Emerald Block");

        AbstractedCreationMethods.condenseItems(condensedEmeraldBlock,"condensed_emerald_block",new ItemStack(Material.EMERALD_BLOCK,1));

        AbstractedCreationMethods.separateCondensedItem(new ItemStack(Material.EMERALD_BLOCK,9),"revert_condensed_emerald_block", condensedEmeraldBlock);
    }
}