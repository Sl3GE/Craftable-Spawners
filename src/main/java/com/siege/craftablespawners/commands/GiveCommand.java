package com.siege.craftablespawners.commands;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import org.apache.commons.text.WordUtils;
import java.util.Locale;

public class GiveCommand implements CommandExecutor {
    @Override
    public boolean onCommand(CommandSender sender, Command cmd, String label, String[] args) {
        Player player = (Player) sender;

        if (cmd.getName().equalsIgnoreCase("giveSpawner")) {
            if (args.length == 2) {
                try {
                    EntityType entity = EntityType.valueOf(args[0].toUpperCase(Locale.ROOT));
                    int amount = Integer.parseInt(args[1]);
                    ItemStack item = AbstractedCreationMethods.itemSpawnerCreator(Material.SPAWNER,1,entity,getSpawnerNameFromEntityType(entity.name()));
                    for (int i = 0; i < amount; i++) {
                        player.getInventory().addItem(item);
                    }
                } catch (IllegalArgumentException e) {
                    player.sendMessage("§c§(!) §cThat is not a valid entity type for a spawner!");
                }
            } else {
                player.sendMessage("§c§(!) §c/giveSpawner <entityType> <amount>");
            }
        }

        return true;
    }

    private String getSpawnerNameFromEntityType(String entityType) {
        String spawnerType = WordUtils.capitalizeFully(entityType.replace('_',' '));
        return "§6" + spawnerType+ " Spawner";
    }
}
