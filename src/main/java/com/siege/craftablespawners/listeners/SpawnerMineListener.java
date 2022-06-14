package com.siege.craftablespawners.listeners;

import com.siege.craftablespawners.CraftableSpawners;
import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.spawners.FriendlyMobSpawners;
import com.siege.craftablespawners.items.spawners.HostileMobSpawners;
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

        Player player = e.getPlayer();
        ItemStack itemInHand = player.getInventory().getItemInHand(); // update to account for deprecation

        if (itemInHand.containsEnchantment(Enchantment.SILK_TOUCH)) {
            // get spawner location & type
            CreatureSpawner spawner = (CreatureSpawner) block.getState();
            EntityType entityType = spawner.getSpawnedType();
            ItemStack itemStack = getSpawnerFromEntityType(entityType);

            e.setExpToDrop(0);
            Location loc = block.getLocation();
            loc.getWorld().dropItemNaturally(loc, itemStack);
            player.sendMessage("§6Spawner Dropped!");
        } else {
            player.sendMessage("§6Spawner Broke!");
        }
    }

    private static ItemStack getSpawnerFromEntityType(EntityType entityType) {
        ItemStack itemStack = FriendlyMobSpawners.getFriendlyEntityTypesMap().get(entityType);
        if (itemStack == null) {
            itemStack = HostileMobSpawners.getHostileEntityTypesMap().get(entityType);
            if (itemStack == null) {
                itemStack = new ItemStack(Material.SPAWNER, 1);
            }
        }
        return itemStack;
    }
}
