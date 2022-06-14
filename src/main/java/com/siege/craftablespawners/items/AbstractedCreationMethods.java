package com.siege.craftablespawners.items;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.NamespacedKey;
import org.bukkit.block.BlockState;
import org.bukkit.block.CreatureSpawner;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.entity.EntityType;
import org.bukkit.inventory.ItemFlag;
import org.bukkit.inventory.ItemStack;
import org.bukkit.inventory.RecipeChoice;
import org.bukkit.inventory.ShapedRecipe;
import org.bukkit.inventory.meta.BlockStateMeta;
import org.bukkit.inventory.meta.ItemMeta;

public class AbstractedCreationMethods {
    public static ItemStack createShinyItem(Material material, int amount, String displayName) {
        ItemStack item = new ItemStack(material, amount);
        ItemMeta meta = item.getItemMeta();
        meta.setDisplayName(displayName);
        meta.addEnchant(Enchantment.LUCK, 1, true);
        meta.addItemFlags(ItemFlag.HIDE_ENCHANTS);
        item.setItemMeta(meta);
        return item;
    }

    public static ItemStack itemSpawnerCreator(Material material, int amount, EntityType entityType, String displayName) {
        /*
        Get item meta from item
        Cast item meta to blockstatemeta
        Get blockstate from blockstatemeta
        Cast blockstate to creaturespawner
        Set entitytype of creaturespawner
        Cast modified creaturespawner to blockstate
        Blockstatemeta set modified blockstate
        Cast blockstatemeta to item meta
        Itemstack set modified item meta
         */
        ItemStack item = new ItemStack(material, amount);
        ItemMeta meta = item.getItemMeta();
        BlockStateMeta blockStateMeta = (BlockStateMeta) meta;
        BlockState blockState = blockStateMeta.getBlockState();
        CreatureSpawner creatureSpawner = (CreatureSpawner) blockState;
        creatureSpawner.setSpawnedType(entityType);
        blockState = (BlockState) creatureSpawner;
        blockStateMeta.setBlockState(blockState);
        meta = (ItemMeta) blockStateMeta;
        meta.setDisplayName(displayName);
        item.setItemMeta(meta);
        return item;
    }


    private static void separateCondensedItemRecipe(ItemStack itemStackName, String recipeKey, ItemStack ingredient, String[] shapeList) {
        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft(recipeKey), itemStackName);
        recipe.shape(shapeList);
        recipe.setIngredient('X', new RecipeChoice.ExactChoice(ingredient));
        Bukkit.getServer().addRecipe(recipe);
    }

    // recipe for separating condensed items
    public static void separateCondensedItem(ItemStack itemStackName, String recipeKey, ItemStack ingredient) {
        String[] shapeList = {"X  ", " X ", "   "};
        String[] specifiedShapeList;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                if (j == 0) {
                    specifiedShapeList = new String[]{shapeList[i], "   ", "   "};
                } else if (j == 1) {
                    specifiedShapeList = new String[]{"   ", shapeList[i], "   "};
                } else {
                    specifiedShapeList = new String[]{"   ", "   ", shapeList[i]};
                }
                separateCondensedItemRecipe(itemStackName, recipeKey + i + j, ingredient, specifiedShapeList);
            }
        }
        specifiedShapeList = new String[]{"X ", "  "};
        separateCondensedItemRecipe(itemStackName, recipeKey + 1, ingredient, specifiedShapeList);
        specifiedShapeList = new String[]{"  ", "X "};
        separateCondensedItemRecipe(itemStackName, recipeKey + 2, ingredient, specifiedShapeList);
    }

    public static void condenseItems(ItemStack resultItem, String recipeKey, ItemStack ingredient) {
        ShapedRecipe recipe = new ShapedRecipe(NamespacedKey.minecraft(recipeKey), resultItem);
        recipe.shape("XXX", "XXX", "XXX");
        recipe.setIngredient('X', new RecipeChoice.ExactChoice(ingredient));
        Bukkit.getServer().addRecipe(recipe);
    }
}
