package com.siege.craftablespawners.listeners;

import com.siege.craftablespawners.CraftableSpawners;
import com.siege.craftablespawners.items.AbstractedCreationMethods;
import org.bukkit.Location;
import org.bukkit.Material;
import org.bukkit.block.Block;
import org.bukkit.block.CreatureSpawner;
import org.bukkit.enchantments.Enchantment;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.block.BlockBreakEvent;
import org.bukkit.inventory.ItemStack;

public class SpawnerMineListener implements Listener {
    private final CraftableSpawners plugin;

    public SpawnerMineListener(CraftableSpawners plugin) {
        this.plugin = plugin;
    }

    @EventHandler  //(priority = EventPriority.MONITOR)
    public void onSpawnerMine(BlockBreakEvent e) {
        if (e.isCancelled()) {
            return;
        }

        // check if block is spawner
        Block block = e.getBlock();
        Material material = block.getType();
        if (!material.equals(Material.SPAWNER)) {
            return;
        }

        // get spawner location & type
        Location loc = block.getLocation();
        CreatureSpawner spawner = (CreatureSpawner) block.getState();
        EntityType entityType = spawner.getSpawnedType();

        Player player = e.getPlayer();


        ItemStack itemInHand = player.getInventory().getItemInHand();
        if (itemInHand.containsEnchantment(Enchantment.SILK_TOUCH)) {
            e.setExpToDrop(0);
            giveSpawner(e, entityType, loc, player, block);
            player.sendMessage("§6Spawner Dropped!");
        } else {
            player.sendMessage("§6Spawner Broke!");
        }
    }

    private void giveSpawner(BlockBreakEvent e, EntityType entityType, Location loc, Player player, Block block) {
        //ItemStack item = new ItemStack(Material.SPAWNER, 1);

        ItemStack itemStack = AbstractedCreationMethods.getSpawnerFromEntityType(entityType);

        loc.getWorld().dropItemNaturally(loc, itemStack);
    }
}
