package com.siege.craftablespawners.commands;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import com.siege.craftablespawners.items.spawners.FriendlyMobSpawners;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

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

    public String getSpawnerNameFromEntityType(String entity) {
        String spawnerType = "";
        switch(entity) {
            case "IRON_GOLEM":
                spawnerType = "Iron Golem";
                break;
            case "COW":
                spawnerType = "Cow";
                break;
            case "SNOWMAN":
                spawnerType = "Snowman";
                break;
            case "SHEEP":
                spawnerType = "Sheep";
                break;
            case "PIG":
                spawnerType = "Pig";
                break;
            case "HORSE":
                spawnerType = "Horse";
                break;
            case "SQUID":
                spawnerType = "Squid";
                break;
            case "CHICKEN":
                spawnerType = "Chicken";
                break;
            case "WITCH":
                spawnerType = "Witch";
                break;
            case "WITHER_SKELETON":
                spawnerType = "Wither Skeleton";
                break;
            case "WITHER":
                spawnerType = "Wither";
                break;
            case "ZOMBIFIED_PIGLIN":
                spawnerType = "Zombified Piglin";
                break;
            case "GHAST":
                spawnerType = "Ghast";
                break;
            case "MAGMA_CUBE":
                spawnerType = "Magma Cube";
                break;
            case "SLIME":
                spawnerType = "Slime";
                break;
            case "BLAZE":
                spawnerType = "Blaze";
                break;
            case "CREEPER":
                spawnerType = "Creeper";
                break;
            case "SPIDER":
                spawnerType = "Spider";
                break;
            case "ENDERMAN":
                spawnerType = "Enderman";
                break;
            case "ZOMBIE":
                spawnerType = "Zombie";
                break;
            case "SKELETON":
                spawnerType = "Skeleton";
                break;
        }
        return "§6" + spawnerType+ " Spawner";
    }
}
