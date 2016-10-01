UPDATE `quest_template` SET `RequiredNpcOrGo1` = 0, `RequiredNpcOrGo2` = 0, `RequiredNpcOrGo3` = 0, `RequiredNpcOrGoCount1` = 0, `RequiredNpcOrGoCount2` = 0, `RequiredNpcOrGoCount3` = 0 WHERE `Id` = 28096;
UPDATE `creature_template` SET `InhabitType` = 4, `HoverHeight` = 1 WHERE `entry` = 51371;

-- Creeper Egg SAI
SET @ENTRY := 47203;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,73,0,100,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,"q28114 - despawn on loot");

DELETE FROM `creature_loot_template` WHERE (`entry`=47203);
INSERT INTO `creature_loot_template` VALUES 
(47203, 63029, -100, 1, 0, 1, 5);
UPDATE `creature_template` SET `npcflag` = 16777216, `unit_flags` = 0, `dynamicflags` = 0, `type` = 7, `type_flags` = 0, `HoverHeight` = 1 WHERE `entry` = 47203;
DELETE FROM `creature_equip_template` WHERE (`entry`=2349);

-- Human Infestation
DELETE FROM `spell_scripts` WHERE (`datalong`=47697);
INSERT INTO `spell_scripts` (`id`, `command`, `datalong`) VALUES (88797, 8, 47697);
UPDATE `quest_template` SET `SourceItemId`=630790 WHERE (`Id`=28138);
UPDATE `item_template` SET `entry`='630790' WHERE (`entry`=63079);
UPDATE `quest_template` SET `SourceItemId`=630790, `RequiredSourceItemId4`=630790 WHERE (`Id`=28138); 
UPDATE `quest_template` SET `RequiredNpcOrGo1` = 2374 WHERE `Id` = 28146;

UPDATE `quest_template` SET `SpecialFlags` = 0 WHERE `Id` = 28192;

-- No One Here Gets Out Alive auto.
UPDATE `quest_template` SET `Method`=0 WHERE (`Id`=28192); 
UPDATE `quest_template` SET `MinLevel`=20, `RequiredRaces`=0  WHERE (`Id`=28169);

DELETE FROM `spell_scripts` WHERE (`datalong`=48752); 

DELETE FROM `spell_linked_spell` WHERE (`spell_trigger`=90976);
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `comment`) VALUES (90976, 85933, 'prova');

INSERT INTO `spell_scripts` (`id`, `command`, `datalong`) VALUES (85933, 8, 48752);
UPDATE `quest_template` SET `SourceItemId`=644450 WHERE (`Id`=28538);
UPDATE `quest_template` SET `SourceItemId`=644450, `RequiredSourceItemId4`=644450 WHERE (`Id`=28538);
-- The Heart of the Matter
DELETE FROM `creature_loot_template` WHERE `entry`=48628 AND item=64380;
DELETE FROM `creature_loot_template` WHERE `entry`=2248 AND item=64380;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (2248, 64380, -100);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES (48628, 64380, -100);
UPDATE `creature_template` SET `lootid`=2248 WHERE (`entry`=2248);
UPDATE `creature_template` SET `lootid`=48628 WHERE (`entry`=48628);


