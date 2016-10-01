UPDATE `creature_template` SET `unit_flags` = 130 WHERE `entry` = 16804;

DELETE FROM `creature_loot_template` WHERE (`entry`=11520) AND (`item`=14540);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (11520, 14540, 60, 1, 0, 1, 1);
