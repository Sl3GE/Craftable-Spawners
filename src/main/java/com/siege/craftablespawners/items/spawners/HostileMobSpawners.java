package com.siege.craftablespawners.items.spawners;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.condenseditems.CondensedHostileMobItems;
import com.siege.craftablespawners.items.supercondenseditems.SuperCondensedHostileMobItems;
import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.entity.EntityType;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.RecipeChoice;
import org.bukkit.inventory.ShapedRecipe;

import java.util.HashMap;

public class HostileMobSpawners {
    private static ItemStack skeletonSpawner;
    private static ItemStack zombieSpawner;
    private static ItemStack blazeSpawner;
    private static ItemStack creeperSpawner;
    private static ItemStack spiderSpawner;
    private static ItemStack endermanSpawner;
    private static ItemStack slimeSpawner;
    private static ItemStack magmaCubeSpawner;
    private static ItemStack ghastSpawner;
    private static ItemStack zombifiedPiglinSpawner;
    private static ItemStack witherSpawner;
    private static ItemStack witherSkeletonSpawner;
    private static ItemStack witchSpawner;
    private static HashMap<EntityType, ItemStack> hostileEntityTypesMap;

    public static void init() {
        skeletonSpawnerRecipe();
        zombieSpawnerRecipe();
        blazeSpawnerRecipe();
        creeperSpawnerRecipe();
        spiderSpawnerRecipe();
        endermanSpawnerRecipe();
        slimeSpawnerRecipe();
        magmaCubeSpawnerRecipe();
        ghastSpawnerRecipe();
        zombifiedPiglinSpawnerRecipe();
        netherStarSpawnerRecipe();
        witherSkeletonSpawnerRecipe();
        witchSpawnerRecipe();
        generateFriendlyEntityTypesMap();
    }

    public static void generateFriendlyEntityTypesMap() {
        hostileEntityTypesMap = new HashMap<>();
        hostileEntityTypesMap.put(EntityType.SKELETON, skeletonSpawner);
        hostileEntityTypesMap.put(EntityType.ZOMBIE, zombieSpawner);
        hostileEntityTypesMap.put(EntityType.BLAZE, blazeSpawner);
        hostileEntityTypesMap.put(EntityType.CREEPER, creeperSpawner);
        hostileEntityTypesMap.put(EntityType.SPIDER, spiderSpawner);
        hostileEntityTypesMap.put(EntityType.ENDERMAN, endermanSpawner);
        hostileEntityTypesMap.put(EntityType.SLIME, slimeSpawner);
        hostileEntityTypesMap.put(EntityType.MAGMA_CUBE, magmaCubeSpawner);
        hostileEntityTypesMap.put(EntityType.GHAST, ghastSpawner);
        hostileEntityTypesMap.put(EntityType.ZOMBIFIED_PIGLIN, zombifiedPiglinSpawner);
        hostileEntityTypesMap.put(EntityType.WITHER, witherSpawner);
        hostileEntityTypesMap.put(EntityType.WITHER_SKELETON, witherSkeletonSpawner);
        hostileEntityTypesMap.put(EntityType.WITCH, witchSpawner);
    }

    public static HashMap<EntityType, ItemStack> gethostileEntityTypesMap() {
        return hostileEntityTypesMap;
    }

    private static void skeletonSpawnerRecipe() {
        skeletonSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.SKELETON, "§6Skeleton Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("skeleton_spawner"), skeletonSpawner);
        recipe.shape("BBB", "BIB", "BBB");
        recipe.setIngredient('B', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedBone));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void zombieSpawnerRecipe() {
        zombieSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.ZOMBIE, "§6Zombie Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("zombie_spawner"), zombieSpawner);
        recipe.shape("FFF", "FIF", "FFF");
        recipe.setIngredient('F', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedRottenFlesh));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void blazeSpawnerRecipe() {
        blazeSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.BLAZE, "§6Blaze Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("blaze_spawner"), blazeSpawner);
        recipe.shape("RRR", "RIR", "RRR");
        recipe.setIngredient('R', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedBlazeRod));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void creeperSpawnerRecipe() {
        creeperSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.CREEPER, "§6Creeper Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("creeper_spawner"), creeperSpawner);
        recipe.shape("GGG", "GIG", "GGG");
        recipe.setIngredient('G', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedGunpowder));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void spiderSpawnerRecipe() {
        spiderSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.SPIDER, "§6Spider Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("spider_spawner"), spiderSpawner);
        recipe.shape("SSS", "SIS", "SSS");
        recipe.setIngredient('S', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedString));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void endermanSpawnerRecipe() {
        endermanSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.ENDERMAN, "§6Enderman Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("enderman_spawner"), endermanSpawner);
        recipe.shape("EEE", "EIE", "EEE");
        recipe.setIngredient('E', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedEnderPearl));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void slimeSpawnerRecipe() {
        slimeSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.SLIME, "§6Slime Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("slime_spawner"), slimeSpawner);
        recipe.shape("SSS", "SIS", "SSS");
        recipe.setIngredient('S', new RecipeChoice.ExactChoice(CondensedHostileMobItems.condensedSlimeBlock));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void magmaCubeSpawnerRecipe() {
        magmaCubeSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.MAGMA_CUBE, "§6Magma Cube Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("magma_cube_spawner"), magmaCubeSpawner);
        recipe.shape("MMM", "MIM", "MMM");
        recipe.setIngredient('M', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedMagmaCream));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void ghastSpawnerRecipe() {
        ghastSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.GHAST, "§6Ghast Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("ghast_spawner"), ghastSpawner);
        recipe.shape("GGG", "GIG", "GGG");
        recipe.setIngredient('G', new RecipeChoice.ExactChoice(CondensedHostileMobItems.condensedGhastTear));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void zombifiedPiglinSpawnerRecipe() {
        zombifiedPiglinSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.ZOMBIFIED_PIGLIN, "§6Zombified Piglin Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("zombie_piglin_spawner"), zombifiedPiglinSpawner);
        recipe.shape("GGG", "GIG", "GGG");
        recipe.setIngredient('G', new RecipeChoice.ExactChoice(CondensedHostileMobItems.condensedGoldBlock));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void netherStarSpawnerRecipe() {
        witherSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.WITHER, "§6Wither Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("wither_spawner"), witherSpawner);
        recipe.shape("NNN", "NIN", "NNN");
        recipe.setIngredient('N', new RecipeChoice.ExactChoice(CondensedHostileMobItems.condensedNetherStar));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void witherSkeletonSpawnerRecipe() {
        witherSkeletonSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.WITHER_SKELETON, "§6Wither Skeleton Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("wither_skeleton_spawner"), witherSkeletonSpawner);
        recipe.shape("WWW", "WIW", "WWW");
        recipe.setIngredient('W', new RecipeChoice.ExactChoice(CondensedHostileMobItems.condensedWitherSkeletonSkull));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }

    private static void witchSpawnerRecipe() {
        witchSpawner = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER, 1, EntityType.WITCH, "§6Witch Spawner");

        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft("witch_spawner"), witchSpawner);
        recipe.shape("GRG", "RIR", "GRG");
        recipe.setIngredient('G', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedGunpowder));
        recipe.setIngredient('R', new RecipeChoice.ExactChoice(SuperCondensedHostileMobItems.superCondensedBlockOfRedstone));
        recipe.setIngredient('I', Material.IRON_BARS);
        Bukkit.addRecipe(recipe);
    }
}
