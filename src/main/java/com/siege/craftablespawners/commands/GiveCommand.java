package com.siege.craftablespawners.commands;

import com.siege.craftablespawners.items.AbstractedCreationMethods;
import org.apache.commons.lang.StringUtils;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandExecutor;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Player;
import org.bukkit.inventory.ItemStack;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

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
        String spawnerType = capitalizeFully(entityType.replace('_',' '));
        return "§6" + spawnerType+ " Spawner";
    }

    // refactor below

    private static String capitalizeFully(String str) {
        return capitalizeFully(str, (char[])null);
    }

    private static String capitalizeFully(String str, char... delimiters) {
        if (StringUtils.isEmpty(str)) {
            return str;
        } else {
            str = str.toLowerCase();
            return capitalize(str, delimiters);
        }
    }
    private static String capitalize(String str, char... delimiters) {
        if (StringUtils.isEmpty(str)) {
            return str;
        } else {
            Set<Integer> delimiterSet = generateDelimiterSet(delimiters);
            int strLen = str.length();
            int[] newCodePoints = new int[strLen];
            int outOffset = 0;
            boolean capitalizeNext = true;
            int index = 0;

            while(index < strLen) {
                int codePoint = str.codePointAt(index);
                if (delimiterSet.contains(codePoint)) {
                    capitalizeNext = true;
                    newCodePoints[outOffset++] = codePoint;
                    index += Character.charCount(codePoint);
                } else if (capitalizeNext) {
                    int titleCaseCodePoint = Character.toTitleCase(codePoint);
                    newCodePoints[outOffset++] = titleCaseCodePoint;
                    index += Character.charCount(titleCaseCodePoint);
                    capitalizeNext = false;
                } else {
                    newCodePoints[outOffset++] = codePoint;
                    index += Character.charCount(codePoint);
                }
            }

            return new String(newCodePoints, 0, outOffset);
        }
    }

    private static Set<Integer> generateDelimiterSet(char[] delimiters) {
        Set<Integer> delimiterHashSet = new HashSet();
        if (delimiters != null && delimiters.length != 0) {
            for(int index = 0; index < delimiters.length; ++index) {
                delimiterHashSet.add(Character.codePointAt(delimiters, index));
            }

            return delimiterHashSet;
        } else {
            if (delimiters == null) {
                delimiterHashSet.add(Character.codePointAt(new char[]{' '}, 0));
            }

            return delimiterHashSet;
        }
    }


}
