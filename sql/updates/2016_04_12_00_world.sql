UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 15271;
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 15294;
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 15273;

DELETE FROM `creature` WHERE `id`=27946;
INSERT INTO `creature` (`guid`,`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(28844, 27946, 0, 0, 0, 1, 1, 29363, 0, -12360.9, -3062.63, 90.8148, 1.16937, 300, 0, 0, 232470, 0, 0, 0, 0, 0),
(48589, 27946, 0, 0, 0, 1, 1, 0, 0, -12360.9, -3062.63, 90.8148, 1.16937, 120, 0, 0, 1, 0, 0, 0, 0, 0),
(92506, 27946, 1, 0, 0, 1, 1, 29363, 0, -431.809, 2246.06, 93.0752, 3.97935, 300, 0, 0, 232470, 0, 0, 0, 0, 0),
(172103, 27946, 530, 0, 0, 1, 1, 0, 0, 7592.39, -6776.33, 86.834, 4.83017, 300, 0, 0, 17742, 0, 0, 0, 0, 0),
(172104, 27946, 530, 0, 0, 1, 1, 0, 0, 7599.98, -6778.44, 86.4116, 4.19394, 300, 0, 0, 17742, 0, 0, 0, 0, 0),
(172105, 27946, 530, 0, 0, 1, 1, 0, 0, 9378.85, -7162.24, 8.88681, 3.16111, 300, 0, 0, 17742, 0, 0, 0, 0, 0),
(172106, 27946, 530, 0, 0, 1, 1, 0, 0, 9379.6, -7169.83, 9.07374, 3.03163, 300, 0, 0, 17742, 0, 0, 0, 0, 0),
(179816, 27946, 530, 0, 0, 1, 1, 0, 0, 8744.79, -6646.1, 70.6713, 5.32758, 300, 0, 0, 232470, 0, 0, 0, 0, 0),
(179817, 27946, 530, 0, 0, 1, 1, 0, 0, 8737.1, -6651.36, 70.4088, 5.38648, 300, 0, 0, 232470, 0, 0, 0, 0, 0),
(15478591, 27946, 530, 3430, 3533, 1, 1, 0, 1, 9500.91, -6758.38, 17.1075, 5.01823, 300, 0, 0, 35196, 0, 0, 0, 0, 0),
(15478590, 27946, 530, 3430, 3533, 1, 1, 0, 1, 9507.91, -6761.5, 16.7662, 3.94616, 300, 0, 0, 35196, 0, 0, 0, 0, 0);

DELETE FROM `creature` WHERE `id`=16916;
INSERT INTO `creature` (`guid`,`id`,`map`,`zone`,`area`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(15478592, 16916, 530, 3430, 3665, 1, 1, 0, 1, 9513.82, -6838.07, 16.4932, 4.09538, 300, 0, 0, 83, 104, 0, 0, 0, 0);

