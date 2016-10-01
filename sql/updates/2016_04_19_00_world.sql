UPDATE `creature_template` SET `spell1` = 0, `spell2` = 0, `spell3` = 0 WHERE `entry` = 47790;

SET @ENTRY := 47790;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,0,0,3400,4700,11,20811,64,0,0,0,0,2,0,0,0,0,0,0,0,'Cast bolt'),
(@ENTRY,0,1,0,9,0,100,0,0,10,20000,22000,11,11969,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Nova on Close'),
(@ENTRY,0,2,0,0,0,100,0,8000,9000,17000,25000,11,7739,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Inferno Shell');
UPDATE `creature_template` SET `unit_flags2` = 0 WHERE `entry` = 48080;
DELETE FROM `creature_template_addon` WHERE (`entry`=47790);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (47790, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 47790;
SET @ENTRY := 47859;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,8500,19000,27000,11,6713,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Disarm');
UPDATE `creature_template` SET `unit_flags` = 32768, `dynamicflags` = 1 WHERE `entry` = 48080;
DELETE FROM `creature` WHERE `id`=47790;
INSERT INTO `creature` (`guid`,`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(15482461, 47790, 0, 267, 286, 1, 1, 0, 1, -398.886, 71.9571, 54.7813, 3.9191, 300, 0, 0, 556, 2550, 0, 0, 0, 0);
UPDATE `creature_template` SET `dynamicflags` = 2048 WHERE `entry` = 48080;
DELETE FROM `creature` WHERE `id`=48080;
INSERT INTO `creature` (`guid`,`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(15482463, 48080, 0, 267, 286, 1, 1, 0, 1, -447.339, 33.9711, 54.1043, 0.238731, 300, 0, 0, 25, 0, 0, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 562188, `dynamicflags` = 1, `type` = 6 WHERE `entry` = 48080;
