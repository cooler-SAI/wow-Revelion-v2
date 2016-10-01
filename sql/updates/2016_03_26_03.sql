UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=1815;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1815 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1815,0,0,0,6,0,100,0,0,0,0,0,11,83105,2,0,0,0,0,1,0,0,0,0,0,0,0,'Diseased Black Bear - On Death - Cast Latent Disease: Summon Plague Tangle');

 UPDATE `gameobject_template` SET `flags`=0 WHERE `entry`=205060;
 
UPDATE `creature_template` SET `flags_extra`=2 WHERE `entry`=42334;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=42334;
DELETE FROM `smart_scripts` WHERE `entryorguid`=42334 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42334,0,0,0,11,0,100,0,0,4,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marl Wormthorn - On Spawn - set react passive'),
(42334,0,1,0,8,0,100,0,78985,0,0,0,28,78986,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marl Wormthorn - On SpellHit - Remove aura Marl''s Shield'),
(42334,0,2,0,8,0,100,0,78985,0,0,0,8,2,0,0,0,0,0,7,0,0,0,0,0,0,0,'Marl Wormthorn - On SpellHit - set react aggresive'),
(42334,0,3,0,4,0,100,1,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marl Wormthorn - On Aggro - yell'),
(42334,0,4,0,6,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Marl Wormthorn - On Death - yell');

DELETE FROM `creature_text` WHERE `entry`=42334;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(42334,0,0,'I only wanted to... do something... good...',1,0,100,0,0,0,'Marl Wormthorn'),
(42334,1,0,'What are you doing? You threaten my work! The Tainted Scar''s revival is all thanks to me!',1,0,100,0,0,0,'Marl Wormthorn');

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id`=42334;

DELETE FROM conditions WHERE SourceEntry=78985 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(13,0,78985,0,18,1,42334,0,0,0,'Break Marl''s Trance can hit only Marl Wormthorn.');

UPDATE `creature` SET `MovementType`=1,`spawndist`=10 WHERE `id`=38202;

-- Warlock
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (26273, 26274, 26275, 26276, 26277);
-- Warrior
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24639, 24640, 24641, 24642, 24643);
-- Mage
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24751, 24752, 24753, 24754, 24755);
-- Shaman
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24761, 24763, 24762, 24760, 24759);
-- Rogue
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24772, 24773, 24774, 24775, 24771);
-- Hunter
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24777, 24778, 24779, 24780, 24781);
-- Priest
UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24783, 24784, 24785, 24786, 24787);


UPDATE quest_template SET StartScript=24607 WHERE Id IN (24607, 24750, 24758, 24764, 24770, 26272, 24776, 24782);

DELETE FROM `quest_start_scripts` WHERE id = 24607;
INSERT INTO `quest_start_scripts` (id, delay, command, datalong, dataint) VALUES
(24607, 0, 0, 12, 2000000050);

DELETE FROM `db_script_string` WHERE `entry` = 2000000050;
INSERT INTO `db_script_string` (entry, content_default) VALUES
(2000000050, "Bektroz. Zuni. Ya'll find ya trainer in the trainin' grounds to the east. Bring pride to the Darkspear.");

-- Tiki Target
UPDATE creature_template SET minlevel = 1, maxlevel = 1, Health_mod = 42, unit_flags = unit_flags | 4, AIName = '', ScriptName = 'npc_tiki_target' WHERE entry = 38038;
UPDATE creature SET spawnMask = 15, spawntimesecs = 6, spawndist = 0, MovementType = 0 WHERE id = 38038;

UPDATE creature_template SET ScriptName = 'npc_jailor' where entry = 39062;
UPDATE gameobject_template SET flags = 4 where entry = 201968;

SET @ENTRY :=38560;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,60000,120000,80000,140000,28,72072,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Spitescale Flag Bunny - OOC - Remove Territorial Fetish');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=72070;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(17,0,72070,0,35,72072,38560,5,0,'','Place Territorial Fetish can cast only  when Spitescale Flag Bunny don''t have Territorial Fetish');

DELETE FROM spell_script_names WHERE spell_id=72070;
INSERT INTO spell_script_names (spell_id,ScriptName) VALUES
(72070,'spell_q24813_place_territorial_fetish');

SET @ENTRY :=47057;
UPDATE `creature_template` SET `AIName`='SmartAI',`RegenHealth`=0 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,99,10,50,0,0,0,0,1,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On respawn - Change hp'),
(@ENTRY,0,1,0,8,0,100,0,774,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On spell hit - Quest credit'),
(@ENTRY,0,2,0,8,0,100,0,2061,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wounded Darkspear Watcher - On spell hit - Quest credit');

UPDATE quest_template SET RequiredRaces=128 WHERE Id IN (24765, 24768, 24766, 24769, 24767);


DELETE FROM `script_waypoint` WHERE `entry`=2768;
INSERT INTO `script_waypoint` VALUES
   (2768,0,-2077.73,-2091.17,9.49,0, ''),
   (2768,1,-2077.99,-2105.33,13.24,0, ''),
   (2768,2,-2074.60,-2109.67,14.24,0, ''),
   (2768,3,-2076.60,-2117.46,16.67,0, ''),
   (2768,4,-2073.51,-2123.46,18.42,2000, ''),
   (2768,5,-2073.51,-2123.46,18.42,4000, ''),
   (2768,6,-2066.60,-2131.85,21.56,0, ''),
   (2768,7,-2053.85,-2143.19,20.31,0, ''),
   (2768,8,-2043.49,-2153.73,20.20,10000, ''),
   (2768,9,-2043.49,-2153.73,20.20,20000, ''),
   (2768,10,-2043.49,-2153.73,20.20,10000, ''),
   (2768,11,-2043.49,-2153.73,20.20,2000, ''),
   (2768,12,-2053.85,-2143.19,20.31,0, ''),
   (2768,13,-2066.60,-2131.85,21.56,0, ''),
   (2768,14,-2073.51,-2123.46,18.42,0, ''),
   (2768,15,-2076.60,-2117.46,16.67,0, ''),
   (2768,16,-2074.60,-2109.67,14.24,0, ''),
   (2768,17,-2077.99,-2105.33,13.24,0, ''),
   (2768,18,-2077.73,-2091.17,9.49,0, ''),
   (2768,19,-2066.41,-2086.21,8.97,6000, ''),
   (2768,20,-2066.41,-2086.21,8.97,2000, '');

DELETE FROM `script_texts` WHERE entry BETWEEN -1000273 AND -1000264;
INSERT INTO `script_texts` (`npc_entry`, `entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2768,-1000264,'Ok, $N. Follow me to the cave where I''ll attempt to harness the power of the rune stone into these goggles.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_1'),
(2768,-1000265,'I discovered this cave on our first day here. I believe the energy in the stone can be used to our advantage.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_2'),
(2768,-1000266,'I''ll begin drawing energy from the stone. Your job, $N, is to defend me. This place is cursed... trust me.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_3'),
(2768,-1000267,'%s begins tinkering with the goggles before the stone.',0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_4'),
(2768,-1000268,'Help!!! Get these things off me so I can get my work done!',0,0,0,0,'phizzlethorpe SAY_AGGRO'),
(2768,-1000269,'Almost done! Just a little longer!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_5'),
(2768,-1000270,'I\'ve done it! I have harnessed the power of the stone into the goggles! Let\'s get out of here!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_6'),
(2768,-1000271,'Phew! Glad to be back from that creepy cave.',0,0,0,1,'phizzlethorpe SAY_PROGRESS_7'),
(2768,-1000272,'%s hands one glowing goggles over to Doctor Draxlegauge.',0,2,0,0,'phizzlethorpe EMOTE_PROGRESS_8'),
(2768,-1000273,'Doctor Draxlegauge will give you further instructions, $N. Many thanks for your help!',0,0,0,1,'phizzlethorpe SAY_PROGRESS_9');


DELETE FROM creature WHERE guid IN(11819,11807,11808);

DELETE FROM gameobject_questrelation WHERE id=2713;
INSERT INTO gameobject_questrelation VALUES
('2713', '26079'),
('2713', '26024');


UPDATE creature_template SET MovementType=2,ScriptName='npc_kinelory' WHERE entry=2713;
UPDATE creature SET MovementType=2,spawntimesecs=10 WHERE id=2713;

DELETE FROM `script_texts` WHERE entry BETWEEN -1002720 AND -1002713;
INSERT INTO `script_texts` (`npc_entry`, `entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2713,-1002713,'Well then. Let\'s get this started. The longer we\'re here, the more damage the undead could be doing back in Hillsbrad.',0,0,0,1,'npc_kinelory SAY_START'),
(2713,-1002714,'Alright, this is where we really have to be on our paws. Be ready!',0,0,0,1,'npc_kinelory SAY_POINT_1'),
(2713,-1002715,'Attack me if you will, but you won\'t stop me from getting back to Quae.',0,0,0,1,'npc_kinelory SAY_ON_AGGRO'),
(2713,-1002716,'You will never stop the Forsaken, Kinelory. The Dark Lady shall make you suffer.',0,2,0,0,'npc_kinelory SAY_PROFESOR'),
(2713,-1002717,'Watch my rear! I\'ll see what I can find in all this junk...',0,0,0,0,'npc_kinelory SAY_HOUSE_1'),
(2713,-1002718,'I bet Quae\'ll think this is important. She\s pretty knowledgeable about those things -- no expert, but knowledgeable.',0,0,0,1,'npc_kinelory SAY_HOUSE_2'),
(2713,-1002719,'Okay, let\'s get out of here quick quiet! Try and keep up. I\'m going to make a break for it.',0,0,0,1,'npc_kinelory SAY_HOUSE_3'),
(2713,-1002720,'We made it! Quae, we made it!',0,0,0,1,'npc_kinelory SAY_END');



DELETE FROM `script_waypoint` WHERE `entry`=2713;
INSERT INTO `script_waypoint` VALUES
(2713,0,-1418.45,-3047.29,35.91,0, ''),
(2713,1,-1400.87,-3052.83,37.89,0, ''),
(2713,2,-1398.52,-3064.23,33.09,0, ''),
(2713,3,-1399.69,-3078.95,28.05,0, ''),
(2713,4,-1406.25,-3096.08,26.26,0, ''),
(2713,5,-1401.83,-3105.16,26.92,0, ''),
(2713,6,-1409.56,-3109.22,22.83,0, ''),
(2713,7,-1418.32,-3105.83,16.18,0, ''),
(2713,8,-1435.76,-3104.19,12.23,0, ''),
(2713,9,-1451.56,-3062.59,12.53,5000, ''),
(2713,10,-1458.64,-3039.46,12.17,0, ''),
(2713,11,-1463.45,-3034.66,12.18,0, ''),
(2713,12,-1515.07,-3034.91,12.77,0, ''),
(2713,13,-1549.40,-3038.11,12.94,0, ''),
(2713,14,-1556.48,-3028.63,13.64,6000, ''),
(2713,15,-1556.48,-3028.63,13.64,8000, ''),
(2713,16,-1556.48,-3028.63,13.64,6500, ''),
(2713,17,-1551.69,-3030.08,13.64,0, ''),
(2713,18,-1552.60,-3054.24,13.09,0, ''),
(2713,19,-1562.70,-3061.51,13.67,0, ''),
(2713,20,-1585.49,-3059.19,12.83,0, ''),
(2713,21,-1612.97,-3032.38,15.71,0, ''),
(2713,22,-1603.14,-3003.96,25.75,0, ''),
(2713,23,-1553.97,-2979.03,34.15,0, ''),
(2713,24,-1511.84,-2961.70,29.00,0, ''),
(2713,25,-1442.12,-2966.26,43.39,0, ''),
(2713,26,-1419.11,-3003.73,35.14,0, ''),
(2713,27,-1426.64,-3031.60,32.65,0, '');

UPDATE quest_template SET SpecialFlags=2 WHERE Id=26050;
UPDATE creature_template SET MovementType=2 WHERE entry=2768;
UPDATE creature SET MovementType=2 WHERE id=2768;
UPDATE creature_template SET scriptname='npc_shakes' WHERE entry=2610;
UPDATE creature_template SET scriptname='npc_daggerspine' WHERE entry=2775;

DELETE FROM gameobject_loot_template WHERE entry=2712;
INSERT INTO gameobject_loot_template VALUES 
(2712,4492,-100,1,0,1,1);

UPDATE quest_template SET SpecialFlags=2 WHERE Id=26628;

DELETE FROM creature_involvedrelation WHERE id=2610;
INSERT INTO creature_involvedrelation VALUES
('2610', '26628');

DELETE FROM gameobject WHERE id = 2712;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
 ('2712','0','1','1','-2166.99','-1741.5','-52.5955','5.17368','0','0','0.526732','-0.850031','30','0','1'),
 ('2712','0','1','1','-2206.14','-1749.56','-64.7415','2.44442','0','0','0.939857','0.341569','30','0','1'),
 ('2712','0','1','1','-2264.75','-1747.6','-64.7416','3.55183','0','0','0.979036','-0.203685','30','0','1'),
 ('2712','0','1','1','-2313.83','-1678.22','-64.8052','1.78076','0','0','0.777311','0.629117','30','0','1'),
 ('2712','0','1','1','-2287.11','-1610.36','-65.1706','2.31483','0','0','0.915767','0.40171','30','0','1'),
 ('2712','0','1','1','-2317.16','-1755.25','-33.8407','4.726','0','0','0.70228','-0.711901','30','0','1'),
 ('2712','0','1','1','-2350.04','-1745.93','-32.9894','3.31227','0','0','0.996361','-0.0852357','30','0','1'),
 ('2712','0','1','1','-2410.22','-1651.09','-31.4935','1.96924','0','0','0.833062','0.55318','30','0','1'),
 ('2712','0','1','1','-2360.55','-1560.31','-43.6581','1.6001','0','0','0.717392','0.69667','30','0','1'),
 ('2712','0','1','1','-2291.32','-1563.13','-39.5943','0.24136','0','0','0.120387','0.992727','30','0','1'),
 ('2712','0','1','1','-2273.3','-1508.49','-40.9756','0.82648','0','0','0.401579','0.915824','30','0','1'),
 ('2712','0','1','1','-2346.71','-1530.69','-42.7902','3.26121','0','0','0.998212','-0.059775','30','0','1'),
 ('2712','0','1','1','-2214.57','-1568.86','-52.1169','5.03229','0','0','0.585461','-0.810701','30','0','1'),
 ('2712','0','1','1','-2175.16','-1589.11','-47.7985','5.83339','0','0','0.223009','-0.974816','30','0','1'),
 ('2712','0','1','1','-2158.04','-1544.72','-45.8982','2.02027','0','0','0.846905','0.531745','30','0','1'),
 ('2712','0','1','1','-2153.11','-1594.29','-47.5894','4.79665','0','0','0.676696','-0.736263','30','0','1'),
 ('2712','0','1','1','-2165.27','-1663.17','-40.9397','3.2023','0','0','0.999539','-0.0303473','30','0','1'),
 ('2712','0','1','1','-2189.76','-1799.45','-56.7382','4.82021','0','0','0.667976','-0.744183','30','0','1'),
 ('2712','0','1','1','-2308.71','-1779.88','-37.2438','2.30694','0','0','0.914176','0.405318','30','0','1'),
 ('2712','0','1','1','-2361.08','-1712.74','-32.2344','2.42082','0','0','0.935761','0.352635','30','0','1'),
 ('2712','0','1','1','-2332.75','-1642.81','-31.0577','4.16833','0','0','0.871094','-0.491116','30','0','1'),
 ('2712','0','1','1','-2212.99','-1491.53','-38.8207','1.57966','0','0','0.710233','0.703966','30','0','1'),
 ('2712','0','1','1','-2121.15','-1583.8','-43.885','5.75013','0','0','0.263385','-0.964691','30','0','1'),
 ('2712','0','1','1','-2130.66','-1699.68','-37.0701','5.06683','0','0','0.571373','-0.820691','30','0','1');
 

DELETE FROM creature_questrelation WHERE id = 2610;
INSERT INTO creature_questrelation VALUES
('2610', '26628');

DELETE FROM creature_loot_template WHERE item=4506;
INSERT INTO creature_loot_template VALUES
(2588,4506,-12,1,0,1,2),
(2590,4506,-15,1,0,1,2),
(2591,4506,-11,1,0,1,2);

DELETE FROM gameobject_template WHERE entry=3000005;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`,  `flags`, `size`, `data0`, `data1`, `data2`, `data3`, `data4`, `WDBVerified`)VALUES
('3000005', '8', '0', 'Shards Myzrael', '0', '1', '5', '10', '0', '0', '26049', '13329');

DELETE FROM gameobject WHERE id=3000005;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('3000005','0','1','1','-944.365','-3117.15','49.90','0.3','0','0','0.992546','0.121869','180','100','1');

UPDATE creature_template SET scriptname='npc_myzrael' WHERE entry=2755;


-- Edit Corrupted Bloodtalon's template --
UPDATE `creature_template` SET `npcflag` = '0', `AIName` = 'SmartAI' WHERE `entry` =37961;

-- SmartAI for sucking raptor --
DELETE FROM `smart_scripts` WHERE `entryorguid` = 37961;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(37961, 0, 0, 0, 1, 0, 100, 0, 1, 1, 3600000, 3600000, 11, 79773, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Corruption');


DELETE FROM creature WHERE id = 3206; -- Remove wrong spawns

-- Raptor Rope Bunny
SET @ENTRY := 37995;
UPDATE creature_template SET flags_extra = 125 WHERE entry = @ENTRY;

-- Swiftclaw (Vehicle)
SET @ENTRY := 38002;
UPDATE creature_template SET VehicleId = 1378, `npcflag` = 16777216, `unit_flags` = 512 | 256 | 128, AIName="", ScriptName = 'npc_swiftclaw' WHERE entry = @ENTRY;
UPDATE creature_template SET AIName='',`ScriptName`='npc_swiftclaw2' WHERE entry=37989;

DELETE FROM `npc_spellclick_spells` WHERE npc_entry = @ENTRY;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`,`user_type`) VALUES 
(@ENTRY, 46598, 1, 0);

-- Swiftclaw
SET @ENTRY := 37989;

DELETE FROM `creature` WHERE `id` = @ENTRY;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values
(null,@ENTRY,1,1,1,0,@ENTRY,-1497.848022, -5339.493652, 2.669409,1.17435,300,0,0,71,0,2,0,0,0);
UPDATE creature_template SET MovementType = 2, speed_run = 1.3, `npcflag` = 0, `unit_flags` = 0, VehicleId = 0 WHERE entry = @ENTRY;

UPDATE creature_template_addon SET path_id = @ENTRY*100 WHERE entry = @ENTRY;
DELETE FROM `waypoint_data` WHERE id = @ENTRY*100;
INSERT INTO `waypoint_data` (id, `point`, position_x, position_y, position_z, move_flag) VALUES
(@ENTRY*100, 0, -1497.848022, -5339.493652, 2.669409, 1),
(@ENTRY*100, 1, -1499.083984, -5333.828613, 3.468620, 1),
(@ENTRY*100, 2, -1501.371704, -5328.788086, 4.237427, 1),
(@ENTRY*100, 3, -1504.775146, -5323.401367, 4.879410, 1),
(@ENTRY*100, 4, -1507.225098, -5316.513672, 5.355038, 1),
(@ENTRY*100, 5, -1507.694458, -5313.045410, 5.730857, 1),
(@ENTRY*100, 6, -1509.003906, -5304.277344, 5.198350, 1),
(@ENTRY*100, 7, -1511.507813, -5299.960449, 5.621017, 1),
(@ENTRY*100, 8, -1515.370361, -5297.688477, 6.648549, 1),
(@ENTRY*100, 9, -1522.125610, -5292.281250, 7.169289, 1),
(@ENTRY*100, 10, -1521.125732, -5288.475586, 7.081245, 1),
(@ENTRY*100, 11, -1521.025513, -5281.272461, 6.641644, 1),
(@ENTRY*100, 12, -1524.395752, -5275.046387, 6.593786, 1),
(@ENTRY*100, 13, -1529.103394, -5271.881836, 6.807569, 1),
(@ENTRY*100, 14, -1537.943970, -5269.724609, 6.886525, 1),
(@ENTRY*100, 15, -1542.571045, -5267.253418, 6.952108, 1),
(@ENTRY*100, 16, -1545.865723, -5263.590820, 6.889743, 1),
(@ENTRY*100, 17, -1548.619385, -5257.984375, 6.645930, 1),
(@ENTRY*100, 18, -1549.203979, -5251.297363, 6.198852, 1),
(@ENTRY*100, 19, -1546.822876, -5242.207520, 5.732527, 1),
(@ENTRY*100, 20, -1545.569458, -5234.657715, 3.793823, 1),
(@ENTRY*100, 21, -1545.388550, -5232.095215, 3.037743, 1),
(@ENTRY*100, 22, -1551.731812, -5227.227051, 1.363956, 1),
(@ENTRY*100, 23, -1556.546997, -5227.952148, 2.091341, 1),
(@ENTRY*100, 24, -1566.379150, -5226.508301, 2.664655, 1),
(@ENTRY*100, 25, -1571.735596, -5227.031250, 2.865098, 1),
(@ENTRY*100, 26, -1580.872803, -5225.726074, 2.694173, 1),
(@ENTRY*100, 27, -1587.782715, -5226.518066, 2.647991, 1),
(@ENTRY*100, 28, -1591.654053, -5229.993652, 3.167221, 1),
(@ENTRY*100, 29, -1593.401978, -5234.955566, 4.033996, 1),
(@ENTRY*100, 30, -1594.000854, -5242.096680, 5.076915, 1),
(@ENTRY*100, 31, -1595.308960, -5247.345703, 5.563274, 1),
(@ENTRY*100, 32, -1598.380615, -5254.811035, 6.714219, 1),
(@ENTRY*100, 33, -1601.713257, -5259.650391, 6.733075, 1),
(@ENTRY*100, 34, -1605.242920, -5263.318848, 6.702632, 1),
(@ENTRY*100, 35, -1607.087646, -5269.878906, 6.695584, 1),
(@ENTRY*100, 36, -1604.924561, -5273.715332, 6.555345, 1),
(@ENTRY*100, 37, -1599.923584, -5278.613281, 6.856218, 1),
(@ENTRY*100, 38, -1593.300171, -5285.100586, 7.748333, 1),
(@ENTRY*100, 39, -1595.430786, -5288.105469, 7.873821, 1),
(@ENTRY*100, 40, -1605.087524, -5286.166504, 6.589048, 1),
(@ENTRY*100, 41, -1611.601563, -5292.368164, 6.084998, 1),
(@ENTRY*100, 42, -1615.300537, -5298.717285, 6.133800, 1),
(@ENTRY*100, 43, -1612.922241, -5301.285156, 6.428215, 1),
(@ENTRY*100, 44, -1607.560303, -5307.135254, 6.507025, 1),
(@ENTRY*100, 45, -1603.336548, -5314.291992, 6.738463, 1),
(@ENTRY*100, 46, -1601.367310, -5321.149902, 6.493231, 1),
(@ENTRY*100, 47, -1601.458374, -5327.680176, 6.391361, 1),
(@ENTRY*100, 48, -1601.545654, -5333.940430, 6.709924, 1),
(@ENTRY*100, 49, -1601.231689, -5340.331543, 6.795422, 1),
(@ENTRY*100, 50, -1597.901855, -5346.360840, 6.262676, 1),
(@ENTRY*100, 51, -1593.780029, -5350.041992, 6.675224, 1),
(@ENTRY*100, 52, -1587.314331, -5351.496582, 6.417171, 1),
(@ENTRY*100, 53, -1580.393799, -5349.335938, 7.086429, 1),
(@ENTRY*100, 54, -1573.803223, -5348.276367, 6.270413, 1),
(@ENTRY*100, 55, -1566.411255, -5351.057617, 5.799611, 1),
(@ENTRY*100, 56, -1560.170898, -5351.685547, 5.703037, 1),
(@ENTRY*100, 57, -1554.369873, -5352.269531, 5.635159, 1),
(@ENTRY*100, 58, -1546.296021, -5352.708008, 5.646011, 1),
(@ENTRY*100, 59, -1538.251099, -5350.803223, 5.956331, 1),
(@ENTRY*100, 60, -1534.471802, -5352.824219, 6.005291, 1),
(@ENTRY*100, 61, -1529.463623, -5356.871582, 6.161052, 1),
(@ENTRY*100, 62, -1522.153687, -5358.441406, 6.605341, 1),
(@ENTRY*100, 63, -1518.306519, -5355.718750, 6.612698, 1),
(@ENTRY*100, 64, -1514.179199, -5350.842285, 5.761660, 1),
(@ENTRY*100, 65, -1507.802002, -5345.751465, 4.102745, 1),
(@ENTRY*100, 66, -1500.018066, -5340.511719, 3.056491, 1);

-- Modify scale for bats in Trisfal Glades --
UPDATE `creature_template` SET `scale` = '0.4' WHERE `entry` IN (1553,1513,1512);
UPDATE `creature_template` SET `scale` = '0.7' WHERE `entry` IN (1554,10357);

-- Edit Vampiric Duskbat's template --
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 1554;

-- SmartAI for Vampiric Duskbat --
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1554;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1554, 0, 0, 0, 1, 0, 100, 0, 1, 1, 3600000, 3600000, 11, 29363, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Draining Touch');

-- Edit Ressan the Needler's template --
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10357;

-- SmartAI for Ressan the Needler --
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10357;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(10357, 0, 0, 0, 0, 0, 100, 0, 4000, 4000, 8000, 8000, 11, 8281, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Draining Touch');

-- DELETE --
DELETE FROM `creature_text` WHERE `entry` IN (1535,1536,1537,1538,1539,1540,1934);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1535,1536,1537,1538,1539,1540,1934,39086,39087);

-- Texts for Scarlet Members in Trisfal Glades --
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
('1535', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1536', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1537', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1538', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1539', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1540', '0', '0', 'The light condemns all who harbor evil. Now you will die!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 1'),
('1535', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1536', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1537', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1538', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1539', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1540', '0', '1', 'The Scarlet Crusade shall smite the wicked and drive evil from these lands!', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 2'),
('1535', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1536', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1537', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1538', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1539', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1540', '0', '2', 'There is no escape for you. The Crusade shall destroy all who carry the scourge''s taint.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 3'),
('1535', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1536', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1537', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1538', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1539', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1540', '0', '3', 'You carry the taint of the scourge. Prepare to enter the twisting nether.', '0', '0', '0', '0', '0', '0', 'Scarlet Member (Trisfal Glades) Say 4'),
('1934', '0', '0', 'Get back, $R!', '0', '0', '0', '0', '0', '0', 'Trisfal Farmer Say 1'),
('1934', '0', '1', 'Get out of my kitchen!', '0', '0', '0', '0', '0', '0', 'Trisfal Farmer Say 2'),
('1934', '0', '2', 'No, no, no... you took my family, but you won''t take my land!', '0', '0', '0', '0', '0', '0', 'Trisfal Farmer Say 3'),
('1934', '0', '3', 'Why won''t you leave us alone?', '0', '0', '0', '0', '0', '0', 'Trisfal Farmer Say 4');

-- Update template of Scarlet Members in Trisfal Glades --
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (1535,1536,1537,1538,1539,1540,1934);

-- SAI for Scarlet Members in Trisfal Glades --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1535, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Warrior - Text'),
(1535, 0, 1, 0, 0, 0, 100, 0, 3000, 3000, 3500, 3500, 11, 57846, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Warrior - Heroic Strike'),
(1536, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Missionary - Text'),
(1536, 0, 1, 0, 0, 0, 100, 0, 3000, 3000, 3500, 3500, 11, 9053, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Missionary - Fireball'),
(1537, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Zealot - Text'),
(1537, 0, 1, 0, 2, 0, 100, 0, 48, 52, 10000, 10000, 11, 84535, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Zealot - Zealotry'),
(1538, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Friar - Text'),
(1538, 0, 1, 0, 0, 0, 100, 0, 3000, 3000, 20000, 20000, 11, 75967, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Friar - Whirlwind'),
(1539, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Neophyte - Text'),
(1539, 0, 1, 0, 16, 0, 100, 0, 12544, 1, 2000, 2000, 11, 12544, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Neophyte - Frost Armor'),
(1539, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 3500, 3500, 11, 13322, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Neophyte - Frostbolt'),
(1540, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Vanguard - Text'),
(1540, 0, 1, 0, 1, 0, 100, 0, 0, 0, 299900, 299900, 11, 7164, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Vanguard - Defensive Stance'),
(1540, 0, 2, 0, 0, 0, 100, 0, 3000, 3000, 8000, 8000, 11, 11972, 2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Vanguard - Shield Bash'),
(1934, 0, 0, 0, 4, 0, 15, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Trisfal Farmer - Text');

-- Slain Scarlet Zealot and Friar - update creature --
UPDATE `creature` SET `MovementType` = '0' WHERE `id` IN (39086,39087);

-- Slain Scarlet Zealot and Friar - update template --
UPDATE `creature_template` SET `unit_flags` = '131718', `dynamicflags` = '32', `questItem1` = '0', `questItem2` = '0', `AIName`='SmartAI', `flags_extra` = '2' WHERE `entry` IN (39086,39087);

-- Slain Scarlet Zealot and Friar - SAI and more SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(39086, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Zealot - stop autoatack :P'),
(39086, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 81238, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Zealot - dead state'),
(39086, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 73304, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Zealot - shadow aura (Lilian Voss killed him/her)'),
(39087, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Friar - stop autoatack :P'),
(39087, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 81238, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Friar - dead state'),
(39087, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 73304, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Slain Scarlet Friar - shadow aura (Lilian Voss killed him/her)');


-- DELETE --
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 38933;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 38933 AND `source_type` = 0;

-- Update Briny Sea Cucumber's template --
UPDATE `creature_template` SET `IconName` = 'GatherHerbs', `npcflag` = '16777216', `AIName` = 'SmartAI' WHERE `entry` =38933;

-- Add spell_click for Briny Sea Cucumber --
REPLACE INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES 
('38933', '73123',  '1', '0'),
('38933', '73123',  '1', '3');

-- SAI for Briny Sea Cucumber --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38933, 0, 0, 0, 8, 0, 100, 0, 73123, 0, 1, 1, 41, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Despawn when player get quest item');

-- DELETE --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1547,1548,1549) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (154700,154800) AND `source_type` = 9;

-- Update templates --
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (1547,1548,1549);

-- SAIs --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1547, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 5000, 8000, 11, 82797, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Decrepit Darkhound - Leaping Bite'),
(1547, 0, 1, 0, 4, 0, 5, 1, 0, 0, 0, 0, 80, 154700, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Decrepit Darkhound - Call timed actionlist'),
(1548, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 5000, 8000, 11, 82797, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cursed Darkhound - Leaping Bite'),
(1548, 0, 1, 0, 4, 0, 15, 1, 0, 0, 0, 0, 80, 154800, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Cursed Darkhound - Call timed actionlist'),
(1549, 0, 0, 0, 0, 0, 100, 0, 3000, 3000, 5000, 8000, 11, 82797, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Ravenous Darkhound - Leaping Bite');

-- Timed actionlists --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(154700, 9, 0, 1, 0, 0, 100, 1, 15000, 15000, 0, 0, 11, 82797, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Decrepit Darkhound - Leaping Bite'),
(154700, 9, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 73150, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Decrepit Darkhound - Summon Worgen '),
(154800, 9, 0, 1, 0, 0, 100, 1, 15000, 15000, 0, 0, 11, 82797, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cursed Darkhound - Leaping Bite'),
(154800, 9, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, 73150, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Cursed Darkhound - Summon Worgen ');


-- DELETE --
DELETE FROM `gameobject_loot_template` WHERE item = 16976;
DELETE FROM `creature_ai_scripts` WHERE creature_id = 12918;
DELETE FROM `event_scripts` WHERE `id` = 6721;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (12918,178205);
DELETE FROM `creature_text` WHERE `entry` = 12918;

-- Update templates --
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE entry = 12918;
UPDATE `gameobject_template` SET `data1` = '15160', `flags` = '0' WHERE entry = 178227;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE entry = 178205;

-- Loot for totem --
INSERT INTO `gameobject_loot_template` VALUES (15160, 16976, -100, 1, 0, 1, 1);

-- SAI for Chief Murgut --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(12918, 0, 0, 0, 4, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Murgut - Say on aggro'),
(12918, 0, 1, 0, 6, 0, 100, 0, 0, 0, 0, 0, 11, 20818, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Murgut -  Cast on death'),
(12918, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Chief Murgul - Say on death');

-- Texts for Chief Murgut --
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES 
(12918, 0, 0, 'You are a little gnat to the Foulweald! Die!', 0, 0, 0, 0, 0, 0, 'Chief Murgut - on agrro'), 
(12918, 1, 0, 'No! You cannot be stronger than the Foulweald! No!!', 0, 0, 0, 0, 0, 0, 'Chief Murgut - on death');

-- SAI for Karang's Banner --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(178205, 1, 0, 0, 1, 0, 100, 1, 5000, 5000, 0, 0, 12, 3749, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2237.48, -1524.45, 89.7827, 0, 'Karang''s Banner - Summon 1'),
(178205, 1, 1, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2202.16, -1544.48, 87.796, 0, 'Karang''s Banner - Summon 2'),
(178205, 1, 2, 0, 1, 0, 100, 1, 20000, 20000, 0, 0, 12, 3749, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2235.44, -1578.43, 86.4944, 0, 'Karang''s Banner - Summon 3'),
(178205, 1, 3, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2260.9, -1547.91, 89.1733, 0, 'Karang''s Banner - Summon 4'),
(178205, 1, 4, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3750, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2208.93, -1567.59, 87.2283, 0, 'Karang''s Banner - Summon 5'),
(178205, 1, 5, 0, 1, 0, 100, 1, 30000, 30000, 0, 0, 12, 3750, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2237.48, -1524.45, 89.7827, 0, 'Karang''s Banner - Summon 6'),
(178205, 1, 6, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3749, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2202.16, -1544.48, 87.796, 0, 'Karang''s Banner - Summon 7'),
(178205, 1, 7, 0, 1, 0, 100, 1, 20000, 20000, 0, 0, 12, 3749, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2260.9, -1547.91, 89.1733, 0, 'Karang''s Banner - Summon 8'),
(178205, 1, 8, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2208.93, -1567.59, 87.2283, 0, 'Karang''s Banner - Summon 9'),
(178205, 1, 9, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3750, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2235.44, -1578.43, 86.4944, 0, 'Karang''s Banner - Summon 10'),
(178205, 1, 10, 0, 1, 0, 100, 1, 30000, 30000, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2237.48, -1524.45, 89.7827, 0, 'Karang''s Banner - Summon 11'),
(178205, 1, 11, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3750, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2202.16, -1544.48, 87.796, 0, 'Karang''s Banner - Summon 12'),
(178205, 1, 12, 0, 1, 0, 100, 1, 20000, 20000, 0, 0, 12, 3749, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2208.93, -1567.59, 87.2283, 0, 'Karang''s Banner - Summon 13'),
(178205, 1, 13, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2235.44, -1578.43, 86.4944, 0, 'Karang''s Banner - Summon 14'),
(178205, 1, 14, 0, 1, 0, 100, 1, 0, 0, 0, 0, 12, 3750, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2260.9, -1547.91, 89.1733, 0, 'Karang''s Banner - Summon 15'),
(178205, 1, 15, 0, 1, 0, 100, 1, 30000, 30000, 0, 0, 12, 3743, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2202.16, -1544.48, 87.796, 0, 'Karang''s Banner - Summon 16'),
(178205, 1, 16, 0, 1, 0, 100, 1, 25000, 25000, 0, 0, 12, 12918, 2, 180000, 0, 0, 0, 8, 0, 0, 0, 2208.93, -1567.59, 87.2283, 0, 'Karang''s Banner - Summon 17');

DELETE FROM `gameobject` WHERE id = 301607;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values('301607','1','1','1','3308.98','1035.33','4.05773','5.91195','0','0','0.184555','-0.982822','300','0','1');
DELETE FROM `gameobject_template` WHERE entry = 301607;
INSERT INTO `gameobject_template` (`entry`, `type`, `name`, `data0`, `data1`, `data6`) VALUES ('301607', '8', 'TEMP Zoram\'gar Forge', '1607', '15', '0');

UPDATE `creature_template` SET `KillCredit1`='4006' WHERE entry IN(4005, 4007);

-- DELETE --
DELETE FROM `creature_text` WHERE `entry` IN (38999,39002);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (38999,39002) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (3899900,3900200) AND `source_type` = 9;
DELETE FROM `gossip_menu` WHERE `entry` IN (11134,11135,11136);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (11134,11135,11136);
DELETE FROM `waypoints` WHERE `entry` = 39002;
DELETE FROM `creature_equip_template` WHERE `entry` IN (38999,39002);
DELETE FROM `creature_template_addon` WHERE `entry` IN (38999,39002);
DELETE FROM `npc_text` WHERE `ID` IN (15487,15488,15489);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND (`SourceGroup` = 11135 OR `ConditionValue1` = 24979);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 39002;

-- Gebler template - update --
UPDATE `creature_template` SET `minlevel` = '15', `maxlevel` = '15', `faction_A` = '19', `faction_H` = '19', `npcflag` = '16777216', `unit_flags` = '131974', `VehicleId` = '618', `AIName` = 'SmartAI', `MovementType` = '2', `equipment_id` = '39002', `flags_extra` = '2' WHERE `entry` = 39002;

-- Gebler - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(39002, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 53, 0, 39002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - Start walk'),
(39002, 0, 1, 0, 40, 0, 100, 0, 6, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 38999, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - Look at Lilian'),
(39002, 0, 2, 0, 6, 0, 100, 0, 0, 0, 0, 0, 41, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - despawn after dead!'),
(39002, 0, 3, 0, 27, 0, 100, 1, 0, 0, 0, 0, 80, 3900200, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - call timed actionlist when has passanger'),
(39002, 0, 4, 0, 1, 0, 100, 0, 15000, 15000, 0, 0, 86, 73453, 2, 21, 38999, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - mount Lilian on self');

-- Gebler - Timed actionlist --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3900200, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 73304, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - Shadow Aura'),
(3900200, 9, 1, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Scarlet Lieutenant Gebler - DIE !!');

-- Gebler - Texts --
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(39002, 0, 0, 'The time has come, my little captive... word has come back from your father.', 0, 0, 100, 0, 0, 0, 'Scarlet Lieutenant Gebler'),
(39002, 1, 0, 'High Priest Voss denounces you as a daughter.  He''s ordered that you be executed immediately.', 0, 0, 100, 0, 0, 0, 'Scarlet Lieutenant Gebler'),
(39002, 2, 0, 'The High Priest sends his regrets.  He had hoped that one day you would be a powerful weapon against our enemies.', 0, 0, 100, 0, 0, 0, 'Scarlet Lieutenant Gebler'),
(39002, 3, 0, 'Unfortunately, you were too dangerous in life, and you''re far too dangerous in undeath.  I will enjoy killing you, you Scourged witch...', 0, 0, 100, 0, 0, 0, 'Scarlet Lieutenant Gebler');

-- Gebler - Waypoints --
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(39002, 0, 2443.9, 1600.13, 66.5732, 'Scarlet Lieutenant Gebler'),
(39002, 1, 2447.8, 1595.45, 68.976, 'Scarlet Lieutenant Gebler'),
(39002, 2, 2452.34, 1590.12, 72.1558, 'Scarlet Lieutenant Gebler'),
(39002, 3, 2449.55, 1588.38, 72.1558, 'Scarlet Lieutenant Gebler'),
(39002, 4, 2444.64, 1589.6, 72.1558, 'Scarlet Lieutenant Gebler'),
(39002, 5, 2440.91, 1594.31, 72.1558, 'Scarlet Lieutenant Gebler'),
(39002, 6, 2441.78, 1597.64, 72.1558, 'Scarlet Lieutenant Gebler');

-- Gebler - Equip_template --
INSERT INTO `creature_equip_template` (`entry`, `ItemEntry1`, `ItemEntry2`, `ItemEntry3`) VALUES
(39002, 59550, 0, 0);

-- Gebler - spellclick for Lilian (can't be used by player) --
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(39002, 73308, 0, 0);

-- Lilian template - update --
UPDATE `creature_template` SET `gossip_menu_id` = '11135', `faction_A` = '68', `faction_H` = '68', `npcflag` = '1', `unit_flags` = '0', `dynamicflags` = '2048', `AIName` = 'SmartAI', `equipment_id` = '38999' WHERE `entry` = 38999;

-- Lilian Voss - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38999, 0, 0, 0, 62, 0, 100, 0, 11136, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - close gossip'),
(38999, 0, 1, 0, 62, 0, 100, 0, 11136, 0, 0, 0, 80, 3899900, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - call timed actionlist'),
(38999, 0, 2, 0, 62, 0, 100, 0, 11136, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Talk 1');

-- Lilian Voss - Timed actionlist --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3899900, 9, 0, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 12, 39002, 8, 0, 0, 0, 0, 8, 0, 0, 0, 2443.9, 1600.13, 66.5732, 5.5653, 'Lilian Voss - spawn Scarlet Lieutenant Gebler'),
(3899900, 9, 1, 0, 0, 0, 100, 0, 14000, 14000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Gebler - Text 1'),
(3899900, 9, 2, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Look at Gebler'),
(3899900, 9, 3, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Text 1'),
(3899900, 9, 4, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Gebler - Text 2'),
(3899900, 9, 5, 0, 0, 0, 100, 0, 9000, 9000, 0, 0, 5, 431, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Cower'),
(3899900, 9, 6, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Text 3'),
(3899900, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Gebler - Text 3'),
(3899900, 9, 8, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 5, 333, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Gebler - ready to fight'),
(3899900, 9, 9, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 19, 39002, 0, 0, 0, 0, 0, 0, 'Gebler - Text 4'),
(3899900, 9, 10, 0, 0, 0, 100, 0, 4000, 4000, 0, 0, 11, 73304, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - cast Shadow Aura on self'),
(3899900, 9, 11, 0, 0, 0, 100, 0, 3000, 3000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Text 4'),
(3899900, 9, 12, 0, 0, 0, 100, 0, 0, 0, 0, 0, 28, 73304, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - unaura Shadow Aura'),
(3899900, 9, 13, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 38999, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - Credit for player'),
(3899900, 9, 14, 0, 0, 0, 100, 0, 1000, 1000, 0, 0, 81, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - gossip flag return'),
(3899900, 9, 15, 0, 0, 0, 100, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - remove cower emote'),
(3899900, 9, 16, 0, 0, 0, 100, 0, 0, 0, 0, 0, 66, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Lilian Voss - return to home orientation');

-- Lilian Voss - Texts -- 
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(38999, 0, 0, 'Yes, my... wait, be quiet!  I hear the lieutenant approaching.', 0, 0, 100, 0, 0, 0, 'Lilian Voss'),
(38999, 1, 0, 'Gebler, you came!  What did he say?', 0, 0, 100, 0, 0, 0, 'Lilian Voss'),
(38999, 2, 0, 'What?  NO!  This can''t be!  Gebler, you know me... we were friends once!', 0, 0, 100, 0, 0, 0, 'Lilian Voss'),
(38999, 3, 0, 'Gebler, father, why would you...', 0, 0, 100, 0, 0, 0, 'Lilian Voss'),
(38999, 4, 0, 'The world of the living may have turned its back on me, but I''m no damned Scourge.  Just go.', 0, 0, 100, 0, 0, 0, 'Lilian Voss');

-- Lilian Voss - Gossip_menu --
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES
(11134, 15488),
(11135, 15487),
(11136, 15489);

-- Lilian Voss - Gossip_menu_option --
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(11134, 0, 0, 'Lilian, you''re one of the Forsaken, like me.  Which brings the question: why did the Scarlet Crusade put you in a cage?  They usually kill the undead on sight.', 1, 1, 11136, 0, 0, 0, NULL),
(11135, 0, 0, 'I''m here to rescue you.', 1, 1, 11134, 0, 0, 0, NULL),
(11136, 0, 0, 'Your father?', 1, 1, 0, 0, 0, 0, NULL);

-- Lilian Voss - Npc_text --
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `WDBVerified`) VALUES
(15487, 'What are you doing here?  Get out of here!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(15488, 'First of all, I don''t need to be rescued.  Second of all, I''d never allow myself to be rescued by an abomination like you!', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(15489, 'I''m NOT undead!  Not for long, anyway.  My father will rescue me, I know it...', NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- Lilian Voss - Template_addon --
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES
(38999, 0, 0, 0, 1, 0, '');

-- Lilian Voss - Equip_template --
INSERT INTO `creature_equip_template` (`entry`, `ItemEntry1`, `ItemEntry2`, `ItemEntry3`) VALUES
(38999, 0, 0, 0);

-- Conditions --
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, 11135, 0, 0, 9, 24979, 0, 0, 0, '', 'Show gossip 121135 if player has Quest 24979');

-- DELETE --
DELETE FROM `creature_text` WHERE `entry` = 38949;
DELETE FROM `creature` WHERE `id` IN (38967,38976); 
DELETE FROM `creature_equip_template` WHERE `entry` IN (38949,38967,38976);
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3894900 AND `source_type` = 9;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1515,38949,38967,38976) AND `source_type` = 0;
 
-- Worgen Dust Bunny - update template --
UPDATE `creature_template` SET `modelid1` = '11686', `modelid2` = '0', `unit_flags` = '33554432', `dynamicflags` = '8', `type_flags` = '0', `AIName` = 'SmartAI', `equipment_id` = '38976', `flags_extra` = '2' WHERE `entry` = 38976; 
 
-- Worgen Dust Bunny - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38976, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 29, 1, 245, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Worgen Dust Bunny - follow Worgen Infiltrator'),
(38976, 0, 1, 0, 1, 0, 100, 0, 0, 0, 1500, 1500, 11, 73167, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Dust Bunny - Stealth Trail'),
(38976, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 81464, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Dust Bunny - Invisibility (7)');

-- Worgen Dust Bunny - equip --
INSERT INTO `creature_equip_template` (`entry`, `ItemEntry1`, `ItemEntry2`, `ItemEntry3`) VALUES
(38976, 0, 0, 0);

-- Worgen Infiltrators - update templates --
UPDATE `creature_template` SET `minlevel` = '7', `maxlevel` = '8', `faction_A` = '16', `faction_H` = '16', `unit_flags` = '131590', `AIName` = 'SmartAI', `equipment_id` = '38949', `flags_extra` = '2' WHERE `entry` = 38949;
UPDATE `creature_template` SET `minlevel` = '7', `maxlevel` = '8', `faction_A` = '7', `faction_H` = '7', `mindmg` = '4', `maxdmg` = '9', `attackpower` = '44', `baseattacktime` = '2000', `AIName` = 'SmartAI', `MovementType` = '1', `equipment_id` = '38967' WHERE `entry` = 38967;

-- Worgen Infiltrators - equip --
INSERT INTO `creature_equip_template` (`entry`, `ItemEntry1`, `ItemEntry2`, `ItemEntry3`) VALUES
(38949, 14151, 0, 0),
(38967, 14151, 0, 0);

-- Add spawns for Worgen Infiltrators in Brill --
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(NULL, 38967, 0, 1, 1, 0, 38967, 2301.42, 248.899, 33.5938, 1.10042, 300, 15, 0, 156, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2279.5, 240.864, 33.4398, 5.20648, 300, 15, 0, 156, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2291.32, 315.945, 34.9361, 4.87426, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2269.17, 379.05, 36.1168, 4.38966, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2296.4, 373.448, 34.5165, 1.18524, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2277.64, 351.898, 33.7152, 1.1122, 300, 15, 0, 156, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2272.1, 329.561, 33.541, 1.81434, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2262.06, 279.813, 33.6901, 4.90263, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2266.57, 301.095, 33.6569, 1.91262, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2242.64, 289.321, 33.5737, 3.58552, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2249.14, 278.589, 33.3829, 1.23639, 300, 15, 0, 156, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2218.59, 268.109, 33.5861, 3.88947, 300, 15, 0, 137, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2265.2, 260.83, 33.6902, 1.55762, 300, 15, 0, 156, 0, 1, 0, 0, 0),
(NULL, 38967, 0, 1, 1, 0, 38967, 2245.33, 261.081, 33.4721, 0.440785, 300, 15, 0, 156, 0, 1, 0, 0, 0);

-- Worgen Infiltrators in Brill - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38967, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 32615, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - cast Stealth on reset'),
(38967, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 73179, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - summon Dust Bunny'),
(38967, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 81464, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - Invisibility (7) - player can see mob when have Vigilance (ID: 73162)');

-- Worgen Infiltrator from Q: Escaped from Gilneas - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38949, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 11, 34189, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - cast Stealth'),
(38949, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - react state'),
(38949, 0, 2, 0, 25, 0, 100, 0, 0, 0, 0, 0, 80, 3894900, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - call timed actionlist on reset (summon)');

-- Worgen Infiltrator from Q: Escaped from Gilneas - Timed actionlist --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(3894900, 9, 0, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 28, 34189, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - remove stealth'),
(3894900, 9, 1, 0, 1, 0, 100, 0, 1500, 1500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - say'),
(3894900, 9, 2, 0, 1, 0, 100, 0, 1000, 1000, 0, 0, 7, 24992, 0, 0, 0, 0, 0, 23, 0, 0, 0, 0, 0, 0, 0, 'Worgen Infiltrator - add Q');

-- Worgen Infiltrator from Q: Escaped from Gilneas - creature_text --
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(38949, 0, 0, 'You deserve to lose this land, for what your people did to us!  Now back off, or face the wrath of the worgen!', 0, 0, 100, 0, 0, 0, 'Worgen Infiltrator');

-- Executor Zygand - update template --
UPDATE `creature_template` SET `npcflag` = '2', `AIName` = 'SmartAI' WHERE `entry` = 1515;

-- Executor Zygand - SAI --
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1515, 0, 0, 0, 19, 0, 100, 0, 24993, 0, 0, 0, 75, 73162, 2, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Executor Zygand - Annihilate the Worgen - cast Viligance on player after take quest'),
(1515, 0, 1, 0, 20, 0, 100, 0, 24993, 0, 0, 0, 28, 73162, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Executor Zygand - Annihilate the Worgen - remove Viligance from player after reward quest');

UPDATE `creature_template` SET `minlevel`=31, `maxlevel`=31 WHERE entry = 34512;
delete from `creature` WHERE id = 34512;
insert into `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values('34512','1','1','1','0','0','2492.99','-1300.67','134.88','4.58506','300','0','0','1006','0','0','0','0','0');

DELETE FROM gossip_menu_option WHERE menu_id=60040;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('60040', '0', '0', 'Can you tell me your fable, Shin?', '1', '3', '0', '0', '0', '0', NULL);

UPDATE `creature_template` SET `npcflag`=3, `gossip_menu_id`=60040 WHERE `entry`=39380; 

DELETE FROM conditions WHERE SourceTypeOrReferenceId=15 AND SourceGroup IN (60040);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,60040,0,0,9,25205,0,0,0,'','Show gossip 60040 if player has Quest 25205');

UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=39380;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=39380;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(39380,0,0,0,62,0,100,0,60040,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Shin Stonepillar - On gossip option select - Close gossip menu'),
(39380,0,1,0,62,0,100,0,60040,0,0,0,85,73840,1,0,0,0,0,7,0,0,0,0,0,0,0, 'Shin Stonepillar - On gossip option select - Cast Spell Summon The Wolf');

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000,`VehicleId`=300,`Spell1`=73851,`ScriptName`='npc_the_wolf' WHERE `entry`=39364;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=39364;
INSERT INTO `npc_spellclick_spells` VALUES
(39364,86319,1,0);

UPDATE `creature_template` SET `KillCredit1`='34344' WHERE entry IN(2207, 34339);

--  Webbed Crusader - Fix Move --
UPDATE `creature_template` SET `unit_flags` = 131076 WHERE `entry` IN (30273,30268);

--  Primordial Drake Egg - Fix Move --
UPDATE `creature_template` SET `unit_flags` = 131076 WHERE `entry` = 28408;

DELETE FROM creature WHERE id IN(33266,33295,33294);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('266898','33266','1','1','1','4264','33266','1304.6','-2337.53','97.4691','4.15388','300','0','0','457','0','0','0','0','0'),
('265404','33266','1','1','1','4262','33266','1343.9','-2305.12','96.7345','4.93928','300','0','0','457','0','0','0','0','0'),
('6390860','33266','1','1','1','0','33266','1438.96','-2149.74','92.9147','4.50491','300','0','0','457','0','0','0','0','0'),
('288354','33266','1','1','1','4262','33266','1206.7','-2242.13','92.9735','0.034907','300','0','0','457','0','0','0','0','0'),
('6390859','33266','1','1','1','0','33266','1418.91','-2178.6','94.4519','2.10316','300','0','0','457','0','0','0','0','0'),
('290158','33266','1','1','1','4262','33266','1315.08','-2196.16','92.6446','4.15388','300','0','0','457','0','0','0','0','0'),
('290398','33266','1','1','1','4262','33266','1210.95','-2234.8','92.5723','4.95674','300','0','0','457','0','0','0','0','0'),
('290623','33266','1','1','1','4262','33266','1304.6','-2337.53','97.4691','4.15388','300','0','0','457','0','0','0','0','0'),
('290652','33266','1','1','1','4262','33266','1206.45','-2238.49','92.8922','0.034907','300','0','0','457','0','0','0','0','0'),
('6390861','33266','1','1','1','0','33266','1450.97','-2182.79','92.5565','1.31383','300','0','0','457','0','0','0','0','0'),
('6390862','33266','1','1','1','0','33266','1481.46','-2198.01','94.3634','4.23944','300','0','0','457','0','0','0','0','0'),
('6390865','33266','1','1','1','12166','33266','1466.97','-2265.23','91.9936','5.40576','300','0','0','457','0','0','0','0','0'),
('6390866','33266','1','1','1','0','33266','1316.01','-2269.35','91.6673','2.92782','300','0','0','457','0','0','0','0','0'),
('6390867','33266','1','1','1','12166','33266','1360.48','-2167.21','93.649','2.74326','300','0','0','457','0','0','0','0','0'),
('6390868','33266','1','1','1','12165','33266','1324.96','-2139.98','94.6022','0.614832','300','0','0','457','0','0','0','0','0'),
('6390869','33266','1','1','1','12166','33266','1408','-2123.87','93.6931','4.7853','300','0','0','457','0','0','0','0','0'),
('6390870','33266','1','1','1','0','33266','1394.82','-2060.81','94.4512','4.99342','300','0','0','457','0','0','0','0','0'),
('6390871','33294','1','1','1','0','0','1425.85','-1994.65','96.5976','1.79136','300','0','0','968','0','0','0','0','0'),
('6390872','33295','1','1','1','0','0','1411.18','-1991.22','96.6071','4.35568','300','0','0','1398','0','0','0','0','0'),
('6390873','33295','1','1','1','0','0','1409.08','-2004.56','95.6047','4.43422','300','0','0','1398','0','0','0','0','0'),
('6390874','33295','1','1','1','0','0','1415.7','-1973.52','97.0902','4.446','300','0','0','1398','0','0','0','0','0'),
('6390875','33295','1','1','1','0','0','1433.49','-1970.64','95.1858','4.30857','300','0','0','1398','0','0','0','0','0'),
('6390876','33295','1','1','1','0','0','1438.63','-2004.33','94.1335','5.29424','300','0','0','1398','0','0','0','0','0');

DELETE FROM script_texts WHERE npc_entry=33266;
INSERT INTO script_texts (npc_entry, entry, content_default, TYPE, COMMENT)VALUES
('33266', '-1934655', 'Death to the Alliance!', '0', 'SAY_SALVE_1'),
('33266', '-1934656', 'For the Horde!', '0', 'SAY_SALVE_2'),
('33266', '-1934657', 'Many thanks, $C!', '0', 'SAY_SALVE_3');

DELETE FROM script_texts WHERE npc_entry=33304;
INSERT INTO script_texts (npc_entry, entry, content_default, TYPE, COMMENT)VALUES
('33304', '-1934658', 'Thank you, friend. I could not rest knowing that my mission had not been completed.', '0', 'SAY_GORAT_1'),
('33304', '-1934659', '...and that my mens''s sacriface had not been avenged.', '0', 'SAY_GORAT_2'),
('33304', '-1934660', 'We must hurry, now. I sense that my time is short.', '0', 'SAY_GORAT_3'),
('33304', '-1934661', 'Follow me closely, and prepare for battle!', '0', 'SAY_GORAT_4'),
('33304', '-1934662', 'Captain Elendilad conceals himself on the island ahead, cowardly issuing orders to his underlings.', '0', 'SAY_GORAT_5'),
('33304', '-1934663', 'He must fall!', '0', 'SAY_GORAT_6'),
('33304', '-1934664', 'Show yourself, elf-coward! Face your death with honor!', '1', 'SAY_GORAT_7'),
('33304', '-1934665', 'How many times must I have you killed, $R?!', '1', 'SAY_ELENDILAD_1'),
('33304', '-1934666', 'Curse you, $R vermin! This forest belongs to the Kaldorei', '0', 'SAY_ELENDILAD_2');

UPDATE creature_template SET dynamicflags=32,minlevel=25,maxlevel=25 WHERE entry=33295;
UPDATE creature_template SET minlevel=20,maxlevel=20 WHERE entry=33294;
UPDATE creature_addon SET emote=65 WHERE guid IN(6390871,6390872,6390873,6390874,6390875,6390876);
UPDATE creature_template SET ScriptName='npc_wounded_morshan',AIName='',unit_flags=768 WHERE entry=33266;

DELETE FROM creature_template_addon WHERE entry=33295;
INSERT INTO creature_template_addon (entry, path_id, mount, bytes1, bytes2, emote, auras)VALUES
('33295', '0', '0', '7', '1', '65', '');

DELETE FROM creature_template_addon WHERE entry=33294;
INSERT INTO creature_template_addon (entry, path_id, mount, bytes1, bytes2, emote, auras)VALUES
('33294', '0', '0', '7', '1', '65', '');
UPDATE creature_template SET minlevel=20,maxlevel=21,faction_A=14,faction_H=35,ScriptName='npc_spirit_gorat',MovementType=0 WHERE entry=33304;
UPDATE creature_template SET minlevel=20,maxlevel=21,faction_A=14,faction_H=14 WHERE entry=33302;
UPDATE creature SET curhealth=464,curmana=510 WHERE id =33302;
UPDATE creature SET curhealth=464 WHERE id =33304;

DELETE FROM gameobject_template WHERE entry=3001598;
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `data24`, `data25`, `data26`, `data27`, `data28`, `data29`, `data30`, `data31`, `AIName`, `ScriptName`, `WDBVerified`) VALUES
('3001598','8','0','Gorat\'s Corpse','','','','0','0','3','0','0','0','0','0','0','1598','25','0','0','0','0','-1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',0,0,0,0,0,0,0,0,'','','14545');

DELETE FROM gameobject WHERE id=194263;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('194263','1','1','1','1341.81','-2168.05','94.2795','3.95353','0','0','0.91872','-0.394909','180','100','1'),
('194263','1','1','1','1343.44','-2124.39','92.7568','2.2877','0','0','0.910234','0.414094','180','100','1'),
('194263','1','1','1','1303.03','-2109.29','102.32','3.59539','0','0','0.974369','-0.224955','180','100','1'),
('194263','1','1','1','1397.25','-2184.82','92.9354','5.5903','0','0','0.339556','-0.940586','180','100','1'),
('194263','1','1','1','1406.1','-2123.91','93.8749','2.05208','0','0','0.855253','0.518211','180','100','1'),
('194263','1','1','1','1360.2','-2079.03','96.9094','2.04815','0','0','0.854234','0.519889','180','100','1'),
('194263','1','1','1','1407.18','-2071.66','95.9666','0.265296','0','0','0.132259','0.991215','180','100','1'),
('194263','1','1','1','1447.88','-2055.2','93.1004','5.20153','0','0','0.514847','-0.857282','180','100','1'),
('194263','1','1','1','1460.77','-2013.78','95.8423','1.09389','0','0','0.520082','0.854116','180','100','1'),
('194263','1','1','1','1375.7','-2037.4','99.2722','3.99202','0','0','0.910952','-0.412513','180','100','1'),
('194263','1','1','1','1309.3','-2066.08','110.772','1.81254','0','0','0.787208','0.616688','180','100','1'),
('194263','1','1','1','1276.57','-2105.35','94.9719','3.09274','0','0','0.999702','0.0244261','180','100','1'),
('194263','1','1','1','1276.69','-2115.43','95.1224','5.94766','0','0','0.166979','-0.98596','180','100','1'),
('194263','1','1','1','1304.27','-2170.75','95.77','1.79683','0','0','0.782341','0.62285','180','100','1'),
('194263','1','1','1','1337.83','-2184.62','94.7768','2.67255','0','0','0.972626','0.232376','180','100','1'),
('194263','1','1','1','1350.61','-2209.06','94.7893','3.89777','0','0','0.929371','-0.369146','180','100','1'),
('194263','1','1','1','1350.22','-2228.96','95.2194','3.88599','0','0','0.93153','-0.363665','180','100','1'),
('194263','1','1','1','1377.65','-2237.63','94.2046','1.23527','0','0','0.579109','0.81525','180','100','1'),
('194263','1','1','1','1399.34','-2240.69','93.9044','1.18029','0','0','0.556483','0.830859','180','100','1'),
('194263','1','1','1','1376.88','-2218.51','92.8415','5.5903','0','0','0.339554','-0.940587','180','100','1'),
('194263','1','1','1','1444.53','-2153.49','91.6216','0.0846574','0','0','0.0423161','0.999104','180','100','1'),
('194263','1','1','1','1444.53','-2153.49','91.6216','4.79312','0','0','0.677996','-0.735066','180','100','1'),
('194263','1','1','1','1441.84','-2188.55','94.9361','4.71851','0','0','0.704941','-0.709266','180','100','1'),
('194263','1','1','1','1465.53','-2204.3','93.033','4.58892','0','0','0.749386','-0.662134','180','100','1'),
('194263','1','1','1','1452.35','-2227.19','93.3133','1.73792','0','0','0.763659','0.64562','180','100','1'),
('194263','1','1','1','1462.07','-2268.29','92.5699','4.88737','0','0','0.642616','-0.766189','180','100','1'),
('194263','1','1','1','1432.98','-2320.6','93.8448','4.51038','0','0','0.774802','-0.632203','180','100','1'),
('194263','1','1','1','1365.47','-2291.77','94.1825','0','0','0','0','1','180','100','1'),
('194263','1','1','1','1375.85','-2341.85','103.83','0','0','0','0','1','180','100','1'),
('194263','1','1','1','1411.16','-2344.72','95.3539','0','0','0','0','1','180','100','1'),
('194263','1','1','1','1389.7','-2316.11','93.9085','0','0','0','0','1','180','100','1'),
('194263','1','1','1','1357.4','-2328.37','100.276','0','0','0','0','1','180','100','1'),
('194263','1','1','1','1341.56','-2320.16','99.6318','0','0','0','0','1','180','100','1');


UPDATE `creature_template` SET `npcflag`='16777216', `InhabitType`='4', `ScriptName`='npc_sanitron500' WHERE (`entry`='46185');
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`='46185';
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`,`user_type`) VALUES ('46185', '86106', '1', '1');
 
UPDATE `creature` SET `spawntimesecs`='30' WHERE id = 46185;

UPDATE `quest_template` SET `SpecialFlags`=2 WHERE `Id`='14129';


UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry` IN (35111,35129);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (35111,35129);
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(35111,66778,0,2),
(35129,66787,1,2);

DELETE FROM `spell_scripts` WHERE `id`=66778;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(66778,1,0,18,0,0,0,0,0,0,0),
(66778,1,0,8,35111,0,0,0,0,0,0);

UPDATE `creature_template` SET `ScriptName` = 'npc_runaway_shredder' WHERE `entry` = 35111;
UPDATE `creature_template` SET `VehicleId`=49, `spell1`=66811,`spell2`=66868,`spell3`=66893,`spell4`=66937,`minlevel`=11,`maxlevel`=11 WHERE `entry`=35129;

DELETE FROM creature_addon WHERE guid IN (SELECT `guid` FROM `creature` WHERE `id`=41989);

DELETE FROM `creature_template_addon` WHERE `entry`=41989;
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(41989,0,0,8,0,430, NULL);

UPDATE `creature_template` SET `npcflag`=0x1000000 WHERE `entry`=41989;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=41989;
INSERT INTO `npc_spellclick_spells` VALUES
(41989,78269,1,2);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=41989;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41989 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41989*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41989,0,1,0,31,0,100,0,78269,0,0,0,80,41989*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frightened Peon - On SpellHitTarget - run script'),
(41989*100,9,0,0,0,0,100,0,0,0,0,0,5,26,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Frightened Peon - Script - Stand'),	
(41989*100,9,1,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Frightened Peon - Script - Say'),	
(41989*100,9,2,0,0,0,100,0,1000,1000,0,0,46,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Frightened Peon - Script - Move Forward'),	
(41989*100,9,3,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Frightened Peon - Script - Despawn');


DELETE FROM `creature_text` WHERE `entry`=41989;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(41989,0,0,'Oof! You touch naughty spot!',0,0,100,0,0,0,'Frightened Peon'),
(41989,0,1,'Tanks!',0,0,100,0,0,0,'Frightened Peon'),
(41989,0,2,'Which way to go???',0,0,100,0,0,0,'Frightened Peon'),
(41989,0,3,'Why dis happen???',0,0,100,0,0,0,'Frightened Peon'),
(41989,0,4,'You is friend. Tanks!',0,0,100,0,0,0,'Frightened Peon');

UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE (`entry`='194100') AND (`item`='44850');

UPDATE `creature_template` SET`InhabitType`=5 WHERE `entry` in (42704);

-- DELETE --
DELETE FROM creature_ai_scripts WHERE creature_id IN (28086,28096,28109,28110);
DELETE FROM smart_scripts WHERE entryorguid IN (28086, 28096, 28109, 28110);

-- Update creature_template --
UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (28086,28096,28109,28110);

-- SAI --
INSERT INTO smart_scripts (entryorguid, source_type, id, event_type, event_chance, event_param1, event_param3, event_param4, action_type, action_param1, target_type, comment) VALUES
(28086, 0, 1, 8, 100, 52992, 60000, 60000, 33, 28040, 7, 'Blade blooded on Sapphire Hive Wasp  c28086 - KC 28040 - q12734'),
(28096, 0, 1, 8, 100, 52992, 60000, 60000, 33, 36189, 7, 'Blade blooded on Hardknuckle Charger c28096 - KC 28046 - q12734'),
(28109, 0, 1, 8, 100, 52992, 60000, 60000, 33, 29043, 7, 'Blade blooded on Mistwhisper members c28109 - KC 29043 - q12734'),
(28110, 0, 1, 8, 100, 52992, 60000, 60000, 33, 29043, 7, 'Blade blooded on Mistwhisper members c28110 - KC 29043 - q12734');


DELETE FROM creature WHERE id = 3121; -- Remove wrong spawns (durotar tiger)

DELETE FROM creature WHERE id IN (38423, 38302); -- Zuni and Manifestation of the Sea Witch is summoned by script...

UPDATE creature_template SET Health_mod = 491000, Mana_mod = 255, rank = 3, minlevel = 16, maxlevel = 16 WHERE entry = 38306;

SET @ENTRY = 38437;
UPDATE creature_Template SET Health_mod = 10.01 WHERE entry = @ENTRY;
UPDATE creature SET position_x=-740.3889, position_y=-5617.327, position_z=25.01457 WHERE id = @ENTRY;


-- Vol'jin
SET @ENTRY := 38225;
SET @SOURCETYPE := 0;
SET @GOSSIP := 11020;
SET @VANIRA := 38437;
SET @ZARJIRA := 38306;
SET @ZUNI := 38423;

DELETE FROM creature WHERE id IN (@ZARJIRA);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(null, @ZARJIRA, 1, 1, 65534, 0, 38306, -710.565, -5579.21, 25.5008, 4.02621, 300, 0, 0, 491000, 91035, 0, 0, 0, 0);
UPDATE creature SET phasemask = 1 WHERE id IN (@ENTRY, @VANIRA, @ZARJIRA, @ZUNI);

UPDATE creature_template SET gossip_menu_id = @GOSSIP, AIName="SmartAI", ScriptName = '', IconName = 'Interact' WHERE entry=@ENTRY;
UPDATE creature SET position_x = -741.5434, position_y = -5615.521, position_z = 25.11356 WHERE id = @ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,62,0,100,0,11020,0,0,0,80,38225,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Start Timed Action List");

DELETE FROM gossip_menu WHERE entry = @GOSSIP AND text_id = 15318;
INSERT INTO gossip_menu (entry, text_id) VALUES
(@GOSSIP, 15318);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=15 AND `SourceEntry`=@GOSSIP AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES 
(15,0,@GOSSIP,9,0,24814,0,0,0,'Show gossip when quest is incomplete'),
(15,0,@GOSSIP,31,0,0,0,0,0,'Show gossip when quest is incomplete');

DELETE FROM gossip_menu_option WHERE menu_id = @GOSSIP;
INSERT INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) values
(@GOSSIP,0,0,"I am ready, Vol'jin.",1,3,0,0,0,0,NULL);

DELETE FROM `creature_text` WHERE `entry` IN (@ENTRY, @VANIRA, @ZARJIRA, @ZUNI);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES 
(@ENTRY,0,1,"Ya were foolish to come 'ere, Sea Witch. Ya escaped our vengeance once, but the Darkspear Tribe will not abide ya trespassin' again.",14,0,100,1,0,20119,'say 1'), -- DONE

(@ZARJIRA,0,1,"You are weak Vol'jin, like your father was weak. Today I will finish what I started long ago - the Darkspear shall be wiped from existence!",14,0,100,1,0, 21810,'say 1'),

(@ENTRY,1,1,"ZUNI! NOOOO!",14,0,100,1,0,20119,'say 1'),
(@ENTRY,2,1,"It be done. Our ancient enemy is defeated.",14,0,100,1,0,20121,'say 1'), -- DONE
(@ENTRY,3,1,"I been waitin' a long time for a chance to avenge my father. A greater weight has been lifted from my shoulders.",14,0,100,1,0,20122,'say 1'), -- DONE
(@ENTRY,4,1,"I must be returnin' ta Darkspear Hold. Please meet me there once Vanira is done with her healin' of the boy.",14,0,100,1,0,20123,'say 1'), -- DONE


(@ZARJIRA,1,1,"You were a fool to touch my fires! When Vol'jin falls, you know who dies next!",14,0,100,1,0,21814,'say 1'),
(@ZARJIRA,2,1,"Not so fast, little troll!",14,0,100,1,0,21815,'say 1'),

(@ZUNI,0,1,"I'll get the fires dis time!",14,0,100,1,0,21388,'say 1'),

(@VANIRA,0,1,"Take care of her spirits! We be handlin' Zar'jira.",14,0,100,1,0,20119,'say 1'),
(@VANIRA,0,2,"I'm afraid there's nothin' I can do for our brother... he power tore away at his soul.",14,0,100,1,0,20119,'say 1'),
(@VANIRA,0,3,"I'll send some watchers ta get his body so we can offer a proper farewell... I wish I could do more.",14,0,100,1,0,20119,'say 1'),
(@VANIRA,0,4,"Vol'jin rushed off in his eagerness, but I can take us back to safety. Just give me the word when ya ready, mon.",14,0,100,1,0,20119,'say 1');

SET @SOURCETYPE := 9;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@ENTRY,@SOURCETYPE,0,0,0,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Close Gossip"),
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,4000,4000,0,0,86,73589,2,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Invoker cast kill credit"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,-720.984,-5595.98,25.6244,0.0,"Move To Pos"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,0,0,0,0,69,0,38437,20,0,0,0,8,0,0,0,-719.816,-5600.21,25.5129,0.0,"Move To Pos"),
(@ENTRY,@SOURCETYPE,4,0,0,0,100,0,4000,4000,0,0,1,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Say 1");

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=186332;
DELETE FROM `smart_scripts` WHERE `entryorguid`=186332 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(186332,1,0,0,64,0,100,1,0,0,0,0,85,42421,2,0,0,0,0,7,0,0,0,0,0,0,0,'Ogre Remains - On GossipHello - Summon Stonemaul Spirit');

-- Add quest 13648 to GO
DELETE FROM gameobject_questrelation WHERE id = 256;
INSERT INTO gameobject_questrelation VALUES
(256, 13648);

UPDATE `creature_template` SET `KillCredit1`=1890 WHERE `entry` IN (1502);
DELETE FROM conditions WHERE SourceTypeOrReferenceId=13 AND ConditionValue2 IN(4329,4328,4331);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
('13', '0', '42411', '0', '18', '2', '4329', '0', '0', '0', 'Target only Firemane Scout'),
('13', '0', '42411', '0', '18', '2', '4328', '0', '0', '0', 'Target only Firemane Scalebane'),
('13', '0', '42411', '0', '18', '2', '4331', '0', '0', '0', 'Target only Firemane Ashtail');

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND ConditionValue2 IN(4329,4328,4331);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
('18', '0', '33088', '0', '24', '2', '4329', '0', '0', '0', 'Item Target only dead Firemane Scout'),
('18', '0', '33088', '0', '24', '2', '4328', '0', '0', '0', 'Item Target only dead Firemane Scalebane'),
('18', '0', '33088', '0', '24', '2', '4331', '0', '0', '0', 'Item Target only dead Firemane Ashtail');

UPDATE `creature_template` SET `KillCredit1`=42621 WHERE `entry` IN (4460,4458,4461,4457,4459);

DELETE FROM creature WHERE id IN (42816,42817,42815);
insert into `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) values
(null,42815,0,1,1,0,0,-463.806,-3971.57,203.134,3.73742,300,0,0,0,0,0,0,0,0),
(null,42816,0,1,1,0,0,-450.119,-3979.21,207.215,2.87505,300,0,0,0,0,0,0,0,0),
(null,42817,0,1,1,0,0,-478.251,-3959.63,206.653,5.56098,300,0,0,0,0,0,0,0,0);


UPDATE `creature_template` SET `minlevel`=33,`maxlevel`=33,`exp`=0,`faction_A`=14,`faction_H`=14,`unit_flags`=4,`ScriptName`='npc_ongolongo' WHERE `entry`=42815;
UPDATE `creature_template` SET `flags_extra`=130,`InhabitType`=5 WHERE `entry` in (42816,42817);

SET @ENTRY := 42816;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,79806,2,0,0,0,0,19,42815,0,0,0,0,0,0, 'Ongolongo''s Right Shackle - On reset - Cast Ongolongo - Chain Visua');

SET @ENTRY := 42817;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,11,79806,2,0,0,0,0,19,42815,0,0,0,0,0,0, 'Ongolongo''s Left Shackle - On reset - Cast Ongolongo - Chain Visua');

DELETE FROM waypoint_data WHERE id = 42815;
INSERT INTO waypoint_data (id, point,position_x, position_y, position_z)  VALUES
(42815,0,-467.073151,-3974.223145,203.504395),
(42815,1,-472.930939,-3978.330078,205.348038),
(42815,2,-478.439087,-3982.191895,207.815353),
(42815,3,-481.591522,-3984.402100,209.478027),
(42815,4,-484.503235,-3986.443359,211.055923),
(42815,5,-486.595306,-3987.910156,212.274490),
(42815,6,-490.882599,-3990.916016,214.038788),
(42815,7,-492.368683,-3993.111572,214.576736),
(42815,8,-500.234772,-4002.447510,216.186340),
(42815,9,-505.137543,-4008.266357,215.922867),
(42815,10,-509.923035,-4013.946045,215.824036),
(42815,11,-518.993408,-4024.711182,215.860260);
UPDATE `waypoint_data` SET `move_flag`=1 WHERE `id`=42815;
UPDATE `waypoint_data` SET `action`=42815 WHERE `id`=42815 AND `point`=11;

DELETE FROM `waypoint_scripts` WHERE `id`=42815;
INSERT INTO `waypoint_scripts`(`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`,`guid`) VALUES 
(42815,1,18,0,0,0,0,0,0,0,10175599);

SET @ENTRY := 42843;
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,8,0,100,0,79875,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'VILEBRANCH HANDLER - On SpellHit- Despawn');



DELETE FROM waypoint_data WHERE id = 38307;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(38307,0,-6804.87,-1687.18,-271.6,0,0,0,100,0),
(38307,1,-6792.246094,-1679.579102,-272.212769,0,0,0,100,0),
(38307,2,-6782.041992,-1670.228271,-272.222260,0,0,0,100,0),
(38307,3,-6771.108398,-1654.410889,-271.928253,0,0,0,100,0),
(38307,4,-6764.735352,-1647.750244,-272.115448,0,0,0,100,0),
(38307,5,-6753.392090,-1639.201660,-272.333435,0,0,0,100,0),
(38307,6,-6741.409180,-1631.961792,-272.640625,0,0,0,100,0),
(38307,7,-6726.334473,-1626.098633,-272.351318,0,0,0,100,0),
(38307,8,-6707.870605,-1629.732300,-272.395599,0,0,0,100,0),
(38307,9,-6694.798828,-1642.833008,-272.600922,0,0,0,100,0),
(38307,10,-6687.456055,-1659.287720,-271.766510,0,0,0,100,0),
(38307,11,-6690.560547,-1674.238892,-272.245331,0,0,0,100,0),
(38307,12,-6704.191895,-1684.467529,-272.631531,0,0,0,100,0),
(38307,13,-6712.168457,-1695.490723,-271.742920,0,0,0,100,0),
(38307,14,-6717.599609,-1714.075439,-271.241180,0,0,0,100,0),
(38307,15,-6722.609375,-1722.054321,-271.923737,0,0,0,100,0),
(38307,16,-6739.205566,-1729.992676,-274.224457,0,0,0,100,0),
(38307,17,-6748.956055,-1733.879517,-274.082245,0,0,0,100,0),
(38307,18,-6761.693359,-1736.228394,-272.757080,0,0,0,100,0),
(38307,19,-6775.649414,-1729.981201,-272.602203,0,0,0,100,0),
(38307,20,-6783.915527,-1723.506592,-272.416565,0,0,0,100,0),
(38307,21,-6794.887695,-1711.131104,-271.357544,0,0,0,100,0),
(38307,22,-6804.923340,-1697.249756,-272.467682,0,0,0,100,0);

DELETE FROM `creature` WHERE `id`=38307;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(15468994,38307,1,1,1,0,0,-6804.87,-1687.18,-271.6,0.318869,300,0,0,55,0,2,0,0,0);

UPDATE `creature_template` SET `minlevel`=54,`maxlevel`=54,`faction_A`=14,`faction_H`=14,`mindmg`=100,`maxdmg`=120,`attackpower`=50,`dmg_multiplier`=1,`MovementType`=2 WHERE `entry`=38307;

SET @GUID := (SELECT `guid` FROM `creature` WHERE `id`=38307);
DELETE FROM `creature_addon` WHERE `guid`=@GUID;
INSERT INTO `creature_addon`(`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(@GUID,38307,0,0,1,0, '');

DELETE FROM conditions WHERE SourceEntry=50746 AND SourceTypeOrReferenceId=18;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(18,0,50746,0,24,2,38307,0,0,0,'You can use Scrape Sticky Tar only on dead Gormashh');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=71978 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,71978,18,0,2,38307,0,0,'Dummy effect from Scrape Sticky Tar hit dead Gormashh');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=38307;
DELETE FROM `smart_scripts` WHERE `entryorguid`=38307 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(38307,0,1,0,8,0,100,0,71978,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gormashh - On SpellHit - Despawn');

DELETE FROM creature_questrelation WHERE quest=12779  AND id=25462;
DELETE FROM creature_involvedrelation WHERE quest=12779 AND id =25462;

DELETE FROM creature_questrelation WHERE quest=12779 AND id=29110;
INSERT INTO creature_questrelation VALUES
('29110', '12779');

DELETE FROM creature_involvedrelation WHERE quest=12779 AND id=29110;
INSERT INTO creature_involvedrelation VALUES
('29110', '12779');

UPDATE creature_template SET npcflag=3 WHERE entry IN(29110,31082);

DELETE FROM creature_questrelation WHERE quest=12800 AND id=29110;
INSERT INTO creature_questrelation VALUES
('29110' , '12800');

UPDATE creature_loot_template SET ChanceOrQuestChance='100' WHERE item=39328;

UPDATE quest_template SET SpecialFlags=2 WHERE Id = 12801;







