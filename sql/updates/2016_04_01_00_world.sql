DELETE FROM `creature_template_addon` WHERE (`entry`=46268);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (46268, 0, 0, 0, 1, 431, '');

UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 46268;

DELETE FROM `creature` WHERE `id`=42185;
INSERT INTO `creature` (`guid`,`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(20758, 42185, 0, 0, 0, 1, 1, 13749, 0, -5271.37, 558.735, 386.616, 6.2617, 90, 10, 0, 55, 0, 1, 0, 0, 2048),
(20759, 42185, 0, 0, 0, 1, 1, 13749, 0, -5416.89, 556.154, 388.825, 1.68232, 90, 9, 0, 55, 0, 1, 0, 0, 2048),
(20760, 42185, 0, 0, 0, 1, 1, 13749, 0, -5356.52, 431.513, 384.263, 4.76108, 90, 12, 0, 55, 0, 1, 0, 0, 2048),
(20761, 42185, 0, 0, 0, 1, 1, 13749, 0, -5271.02, 529.314, 386.904, 5.22178, 90, 11, 0, 55, 0, 1, 0, 0, 2048),
(20762, 42185, 0, 0, 0, 1, 1, 13749, 0, -5377.07, 508.128, 385.228, 3.61664, 90, 11, 0, 55, 0, 1, 0, 0, 2048),
(20763, 42185, 0, 0, 0, 1, 1, 13749, 0, -5485.97, 442.856, 384.3, 0.864107, 90, 9, 0, 55, 0, 1, 0, 0, 2048),
(20764, 42185, 0, 0, 0, 1, 1, 13749, 0, -5376.33, 458.901, 384.763, 4.28608, 90, 10, 0, 55, 0, 1, 0, 0, 2048),
(41706, 42185, 0, 0, 0, 1, 1, 13749, 0, -5368.76, 569.304, 387.268, 1.10185, 90, 10, 0, 55, 0, 1, 0, 0, 2048),
(41914, 42185, 0, 0, 0, 1, 1, 13749, 0, -5336.06, 531.475, 385.218, 5.08898, 90, 11, 0, 55, 0, 1, 0, 0, 2048),
(42183, 42185, 0, 0, 0, 1, 1, 13749, 0, -5312.52, 485.175, 384.311, 3.35554, 90, 11, 0, 55, 0, 1, 0, 0, 2048),
(42378, 42185, 0, 0, 0, 1, 1, 13749, 0, -5334.3, 521.867, 384.925, 3.81874, 90, 8, 0, 55, 0, 1, 0, 0, 2048),
(42568, 42185, 0, 0, 0, 1, 1, 13749, 0, -5253.42, 485.988, 385.886, 3.69488, 90, 10, 0, 55, 0, 1, 0, 0, 2048),
(42959, 42185, 0, 0, 0, 1, 1, 13749, 0, -5428.85, 503.244, 384.121, 4.55489, 90, 10, 0, 55, 0, 1, 0, 0, 2048);

UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 42224;

DELETE FROM `creature_queststarter` WHERE `quest` = 28607;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 28607;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 28607;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (34874, 28607);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 34874;
DELETE FROM `creature_questender` WHERE `quest` = 28607;
DELETE FROM `gameobject_questender` WHERE `quest` = 28607;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (34874, 28607);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=34874;
UPDATE `quest_template` SET `Method` = 2, `SpecialFlags` = 4 WHERE `Id` = 28607;

UPDATE `gameobject` SET `phaseMask` = 1 WHERE `id` = 201603;
UPDATE `quest_template` SET `SpecialFlags` = 4 WHERE `Id` = 24520;

DELETE FROM `creature_queststarter` WHERE `quest` = 14071;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 14071;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 14071;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (34874, 14071);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 34874;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (34957, 14071);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 34957;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (34958, 14071);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 34958;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (34959, 14071);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 34959;
DELETE FROM `creature_questender` WHERE `quest` = 14071;
DELETE FROM `gameobject_questender` WHERE `quest` = 14071;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (34874, 14071);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=34874;
UPDATE `quest_template` SET `Method` = 2, `SpecialFlags` = 4 WHERE `Id` = 14071;

-- Fizz Lighter SAI
SET @ENTRY := 34689;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,5000,5000,15000,15000,11,69608,0,0,0,0,0,10,242393,34696,0,0,0,0,0,"Cast Fireball OOC"),
(@ENTRY,0,1,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,"Play Emote on Gossip"),
(@ENTRY,0,2,0,19,0,100,0,14008,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Say Text on Quest Add");

-- Evol Fingers SAI
SET @ENTRY := 34696;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,1,3000,5000,0,0,11,11939,0,0,0,0,0,1,0,0,0,0,0,0,0,"Summon Imp OOC"),
(@ENTRY,0,1,0,1,0,100,0,10000,10000,20000,20000,11,69607,0,0,0,0,0,10,242392,34689,0,0,0,0,0,"Cast Fireball OOC"),
(@ENTRY,0,2,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,"Play Emote on Gossip");

DELETE FROM `creature_queststarter` WHERE `quest` = 14153;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 14153;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 14153;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (35054, 14153);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 35054;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (35175, 14153);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 35175;
DELETE FROM `creature_questender` WHERE `quest` = 14153;
DELETE FROM `gameobject_questender` WHERE `quest` = 14153;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (34668, 14153);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=34668;
UPDATE `quest_template` SET `SpecialFlags` = 4 WHERE `Id` = 14153;

