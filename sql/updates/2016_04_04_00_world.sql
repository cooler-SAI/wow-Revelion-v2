UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry`=42689;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=42689;
REPLACE  into `npc_spellclick_spells`(`npc_entry`,`spell_id`,`cast_flags`,`user_type`) values
(42689,79591,1,3),
(42689,79588,1,1),
(42689,79591,1,3),
(42689,79588,1,1);
REPLACE INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(79588,0,0,18,0,0,0,0,0,0,0);

UPDATE `gameobject` SET `id`=204120 WHERE `id`=177951;

UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=42235;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=42235;
DELETE FROM `smart_scripts` WHERE `entryorguid`=42235 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42235,0,0,0,8,0,100,0,78838,0,0,0,33,42235,0,0,0,0,0,7,0,0,0,0,0,0,0,'Darktail Bonepicker - On SpellHit - kill credit'),
(42235,0,1,0,8,0,100,0,78838,0,0,0,11,78834,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darktail Bonepicker - On SpellHit - cast Flaming Arrow (Hit)'),
(42235,0,2,0,8,0,100,0,78838,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Darktail Bonepicker - On SpellHit - die');

DELETE FROM conditions WHERE SourceEntry=78838 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(13,0,78838,0,18,1,42235,0,0,0,'Enohar''s Explosive Arrow can hit only Darktail Bonepicker.');

DELETE FROM conditions WHERE SourceEntry=84964 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(13,0,84964,0,18,1,45486,0,0,0,'Rayne''s Seed can hit only Necropolis Flower Controller SE.'),
(13,0,84964,0,18,1,45487,0,0,0,'Rayne''s Seed can hit only Necropolis Flower Controller NE.'),
(13,0,84964,0,18,1,45488,0,0,0,'Rayne''s Seed can hit only Necropolis Flower Controller W.');

DELETE FROM spell_target_position WHERE id IN (78923,78924);
insert into `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) values
(78923,0,-11217.9,-3504.9,7.837,1.71435),
(78924,0,-11314.7,-3442.4,7.4682,6.06764);

-- DELETE --
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2958,2960,20748,21956) AND `source_type` = 0;

-- Update templates for wolves --
UPDATE creature_template SET AIName = 'SmartAI' WHERE entry IN (2958,2960,20748,21956);
UPDATE `creature_template_addon` SET `bytes2` = '0', `auras` = '18950 0' WHERE `entry` = 20748;
UPDATE `creature_template_addon` SET `bytes1` = '0',`bytes2` = '0' WHERE `entry` = 21956;

-- Thunderlord Dire Wolf (ID: 20748) --
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(20748,0,0,0,8,0,100,0,32578,0,0,0,33,21142,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thunderlord Dire Wolf - Protecting Our Own - Player gets credit when use Gor'drek's Ointment (ID: 30175)"),
(20748,0,1,0,0,0,100,0,1000,10000,50000,50000,11,5781,0,0,0,0,0,2,0,0,0,0,0,0,0,"Thunderlord Dire Wolf - Threatening Growl");

-- Prairie Wolf (ID: 2958) --
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(2958,0,0,0,0,0,100,0,1000,10000,50000,50000,11,5781,0,0,0,0,0,2,0,0,0,0,0,0,0,"Prairie Wolf - Threatening Growl");

-- Prairie Wolf Alpha (ID: 2960) --
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(2960,0,0,0,0,0,100,0,1000,10000,50000,50000,11,5781,0,0,0,0,0,2,0,0,0,0,0,0,0,"Prairie Wolf Alpha - Threatening Growl"),
(2960,0,1,0,9,0,100,1,5,45,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,"Prairie Wolf Alpha - Leaping Rush");

-- Rema <The Den Mother> (ID: 21956) --
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(21956,0,0,0,0,0,100,0,1000,10000,50000,50000,11,5781,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rema - Threatening Growl"),
(21956,0,1,0,0,0,100,0,6000,8000,25000,25000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,"Rema - Rend"),
(21956,0,2,0,2,0,100,1,25,25,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rema - Enrage"),
(21956,0,3,0,0,0,100,1,1,1,0,0,90,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rema - Remove Bytes1 on agrro"),
(21956,0,4,0,25,0,100,0,0,0,0,0,90,3,0,0,0,0,0,1,0,0,0,0,0,0,0,"Rema - Add Bytes1 on reset");


DELETE FROM npc_spellclick_spells WHERE npc_entry=33374;
replace  into `npc_spellclick_spells`(`npc_entry`,`spell_id`,`cast_flags`,`user_type`) values
('33374', '62885', '1', '3'),
('33374', '62890', '1', '3');

UPDATE creature_template SET ScriptName='npc_brutusk', VehicleId=209, minlevel=25, maxlevel=25 WHERE entry=33386;
UPDATE creature_template SET ScriptName='', VehicleId=0, npcflag=16777216 WHERE entry=33374;
UPDATE creature_template SET minlevel=23, maxlevel=24, faction_H=14, faction_A=14 WHERE entry=33394;
UPDATE creature SET curhealth=571,curmana=618 WHERE id=33394;
UPDATE creature SET curhealth=699 WHERE id=33386;
UPDATE creature_template SET unit_flags=8, mindmg=25,maxdmg=29 WHERE entry IN(33193,33195);
UPDATE creature_template SET mindmg=45,maxdmg=59 WHERE entry IN(33201,33281);


DELETE FROM spell_area WHERE spell=65051;
INSERT INTO spell_area (spell, AREA, quest_start, quest_start_active, quest_end, aura_spell, racemask, gender, autocast)VALUES
('65051', '1703', '13628', '1', '13628', '0', '690 ', '2', '1'),
('65051', '3177', '13628', '1', '13805', '0', '690 ', '2', '1');

DELETE FROM script_texts WHERE entry = '-1934667';
INSERT INTO script_texts (npc_entry, entry, content_default, TYPE, COMMENT)VALUES
('8582', '-1934667', 'Very well, $c. But be careful, Brutusk can be very... spirited.', '0', 'SAY_KADRAKK');

UPDATE creature_template SET ScriptName='npc_kadrakk' WHERE entry = 8582;
UPDATE creature_template SET ScriptName='npc_dem_peon' WHERE entry = 33440;

DELETE FROM script_texts WHERE npc_entry = '33440';
INSERT INTO script_texts (npc_entry, entry, content_default, TYPE, COMMENT)VALUES
('33440', '-1934668', 'You stay close, $c. And don\'t let elfs near me!', '0', 'SAY_CHOP_1'),
('33440', '-1934669', 'Here I go! Keep an eye out...', '0', 'SAY_CHOP_2'),
('33440', '-1934670', 'There you go, $c.', '0', 'SAY_CHOP_3');
#('33440', '-1934671', '', '0', 'SAY_CHOP_4'),

DELETE FROM gameobject_loot_template WHERE entry=194349;
INSERT INTO gameobject_loot_template VALUES
('194349', '45069', '-100', '1', '0', '1', '1');

DELETE FROM creature WHERE id = 33446;
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('33446','1','1','1','0','33446','1650.77','-2449.64','104.878','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1527.38','-2326.34','96.7904','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1431.32','-2330.15','97.5667','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1403.19','-2400.49','117.056','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1678.64','-2477.87','99.955','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1494.93','-2452.63','112.25','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1590.12','-2405.01','105.139','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1536.81','-2381.21','100.524','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1458.95','-2402.65','107.11','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1459.11','-2402.06','105.274','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1506.03','-2364.38','100.198','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1528.91','-2300.07','95.1459','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1531.72','-2446.33','106.879','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','21342','33446','1618.74','-2515.25','103.121','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1553.85','-2569.51','119.824','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1522.18','-2418.08','102.375','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1637.86','-2504.93','102.073','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1510.36','-2419.08','107.668','0','300','0','0','4979','0','0','0','0','0'),
('33446','1','1','1','0','33446','1403.28','-2395.73','115.151','4.08097','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1450.21','-2407.9','108.818','5.85362','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1459.21','-2359.36','95.514','5.27793','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1494.53','-2425.41','106.224','3.58147','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1497.94','-2455.57','112.739','3.12202','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1540.28','-2384','98.9464','2.29342','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1539.52','-2435.82','103.832','4.19408','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1592.26','-2398.67','108.175','0.413181','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1594','-2539.33','103.365','4.4462','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1622.8','-2524.34','96.9955','4.58364','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1641.06','-2505.27','98.5784','3.54691','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1500.23','-2455.28','112.518','2.64449','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1459.43','-2356.48','94.7135','1.98868','300','0','0','3052','0','0','0','0','0'),
('33446','1','1','1','0','33446','1529.32','-2325.71','98.3084','5.27558','300','0','0','3052','0','0','0','0','0');

DELETE FROM `creature_text` WHERE `entry` IN (11917);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(11917,0,0,'Me make you eat whip!',0,0,100,0,0,0,'Boulderslide Geomancer'),
(11917,0,1,'Me shove whip down face!',0,0,100,0,0,0,'Boulderslide Geomancer'),
(11917,0,2,'ME SO ANGRY!',0,0,100,0,0,0,'Boulderslide Geomancer'),
(11917,0,3,'NO! ME NO HELP HORDE!',0,0,100,0,0,0,'Boulderslide Geomancer'),
(11917,0,4,'Whip make me angry!',0,0,100,0,0,0,'Boulderslide Geomancer'),
(11917,0,5,'You is BAD $R',0,0,100,0,0,0,'Boulderslide Geomancer');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`=42024; 
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=42024; 
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42024,0,0,0,1,0,100,1,60000,90000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Subdued Kobold - After about 1 min - Despawn ');

UPDATE `creature_template` SET `name`='Boulderslide Rock Keeper',`minlevel`=27,`maxlevel`=28 WHERE `entry`=11915;
UPDATE `creature_template` SET `name`='Boulderslide Geomancer', `minlevel`=28,`maxlevel`=28 WHERE `entry`=11917;
UPDATE `creature_template` SET `name`='Boulderslide Stonepounder',`minlevel`=27,`maxlevel`=28 WHERE `entry`=11918;


UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=203289;
DELETE FROM `smart_scripts` WHERE `entryorguid`=203289 AND `source_type`=1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(203289,1,0,0,64,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Azsh''ir Idol - On GossipHello - despawn');

DELETE FROM npc_vendor WHERE item IN (59036,59037);
insert into `npc_vendor` (`entry`, `slot`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) values
(2664,0,59036,0,0,0),
(2491,0,59037,0,0,0);
UPDATE `creature` SET `MovementType`=1,`spawndist`=10 WHERE `id`=38202;

UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=759 AND `item`=58811;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`=-100 WHERE `entry`=759 AND `item`=60386;
DELETE FROM gameobject_loot_template WHERE item=5852;
insert into `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) values
(20691,5852,100,1,0,1,1);
UPDATE `creature_template` SET `KillCredit1`=43024 WHERE `entry` IN (1059,783,782,42858,781,672,784,669,670);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=5471;
DELETE FROM `smart_scripts` WHERE `entryorguid`=5471 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=5471*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(5471,0,0,0,8,0,100,0,73068,0,0,0,80,5471*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Dunemaul Ogre - On SpellHit - run script'),
(5471,0,1,0,2,0,100,1,29,30,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Dunemaul Ogre - On 30%hp - emote'),
(5471*100,9,0,0,0,0,100,0,0,0,0,0,18,384,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Make unattackable'),
(5471*100,9,1,0,0,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Stop combat'),
(5471*100,9,2,0,0,0,100,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Stop attack'),
(5471*100,9,3,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Change faction to friendly'),		
(5471*100,9,4,0,0,0,100,0,2000,2000,0,0,5,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Eat'),	
(5471*100,9,5,0,0,0,100,0,1000,1000,0,0,33,39073,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Kill credit'),
(5471*100,9,6,0,0,0,100,0,1000,1000,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Run on'),
(5471*100,9,7,0,0,0,100,0,2000,2000,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Evade'),
(5471*100,9,8,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Say'),
(5471*100,9,9,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Dunemaul Ogre - Script - Despawn');
DELETE FROM `gameobject_loot_template` WHERE entry = 201706;
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`) VALUES ('201706', '49754', '-100');

DELETE FROM `creature_text` WHERE `entry`=5471;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(5471,0,0,'Me sorry! No hurt!',0,0,100,0,0,0,'Dunemaul Ogre'),
(5471,1,0,'%s is ready to be lad.',2,0,100,0,0,0,'Dunemaul Ogre');

UPDATE `creature_template` SET `npcflag`=0x1000000 WHERE `entry`=40869;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=40869;
REPLACE INTO `npc_spellclick_spells` VALUES
(40869,60080,1,2),
(40869,60080,1,2);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=40869;
DELETE FROM `smart_scripts` WHERE `entryorguid`=40869 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(40869,0,0,0,31,0,100,0,60080,0,0,0,33,40869,0,0,0,0,0,7,0,0,0,0,0,0,0,'Holdfast Cannon - On SpellHitTarget - kill credit'),
(40869,0,1,0,31,0,100,0,60080,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Holdfast Cannon - On SpellHitTarget - die');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=5359;
DELETE FROM `smart_scripts` WHERE `entryorguid`=5359 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(5359,0,0,0,8,0,100,0,23359,0,0,0,3,14603,0,0,0,0,0,1,0,0,0,0,0,0,0,'Shore Strider- On SpellHit - Morph to Zapped Shore Strider');

UPDATE `creature_template` SET `unit_flags` = unit_flags | 33554432, `InhabitType` = '4', `MovementType`='1' WHERE entry = 46012;
UPDATE `creature` SET `spawndist` = '10' WHERE id = 46012;


 -- Felhunter Minion
SET @ENTRY := 17648;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,22000,23000,11,79616,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Drain Life');

 -- Reef Shark
SET @ENTRY := 12123;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,10000,15000,20000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Trash');

-- Wrathtail Sorceress 
SET @ENTRY := 3717;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast frostbolt on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,0,40,3200,6400,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast frostbolt'),
(@ENTRY,0,4,0,0,0,100,0,13800,14100,32000,32000,11,11831,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Nova'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in bolt Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in bolt Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%'),
(@ENTRY,0,11,0,1,0,100,0,500,1000,600000,600000,11,12544,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frost Armor on Spawn');

 -- Wrathtail Wave Rider
SET @ENTRY := 3713;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,9000,15000,28000,11,78732,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlpool');

 -- Tomarrek 
SET @ENTRY := 33381;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,20000,21000,11,32015,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown'),
(@ENTRY,0,1,0,0,0,100,0,1000,2000,12000,13000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

 -- Varas
SET @ENTRY := 33265;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,20000,21000,11,32015,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown'),
(@ENTRY,0,1,0,0,0,100,0,1000,2000,12000,13000,11,15572,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

 -- Ashenvale Bear
SET @ENTRY := 3809;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,2000,12000,12000,11,84867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sundering Swipe');

 -- Bleakheart Hellcaller 
SET @ENTRY := 3771;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,50,0,500,1000,600000,600000,11,11939,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Imp on Spawn'),
(@ENTRY,0,1,0,1,0,50,0,2000,3000,600000,600000,11,12746,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Voidwalker on Spawn');

 -- Bleakheart Satyr
SET @ENTRY := 3765;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,10000,11000,11,31279,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Swipe'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

 -- Bleakheart Shadowstalker 
SET @ENTRY := 3770;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,50000,50000,11,77471,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Shield'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,2,0,1,0,100,1,100,100,0,0,11,77806,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stealth on Spawn');

 -- Bleakheart Trickster
SET @ENTRY := 3767;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,1,0,100,0,500,1000,600000,600000,11,77457,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Dazzling Lights on Spawn'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');


 -- Clattering Crawler
SET @ENTRY := 3812;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,15000,15000,11,78744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bubblebeam');

 -- Mystlash Hydra
SET @ENTRY := 3721;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,15000,15000,11,6917,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Venom Spit');

 -- Warsong Grunt
SET @ENTRY := 11682;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,7000,8000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast clave'),
(@ENTRY,0,1,0,0,0,100,0,5000,5000,17000,17000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash');

 -- Warsong Logger
SET @ENTRY := 11681;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,12000,13000,11,11971,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunder Armor');

 -- Wild Buck
SET @ENTRY := 3816;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6268,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rushing Charge on Aggro');

 -- Wildthorn Stalker
SET @ENTRY := 3819;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,14000,14000,11,12023,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Web');

 -- Wrathtail Razortail
SET @ENTRY := 3712;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,3000,3000,48000,48000,11,6016,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pierce Armor');

-- Wrathtail Sea Witch
SET @ENTRY := 3715;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,11981,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mana Burn on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,0,40,3400,4700,11,8598,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Blast'),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in blats Range'),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in blats Range'),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Ashenvale Bowman(nie strzela)
SET @ENTRY := 33195;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,5,35,7000,28000,11,78841,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Aimed Shot'),
(@ENTRY,0,5,0,9,1,100,0,5,35,5000,15000,11,78754,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Shot'),
(@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

-- Ashenvale Outrunner
SET @ENTRY := 12856;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,5,30,7000,35000,11,18545,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Scorpid Sting'),
(@ENTRY,0,5,0,0,0,100,0,2000,2000,15000,15000,11,8646,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Snap Kick'),
(@ENTRY,0,6,0,1,0,100,1,100,100,0,0,11,20540,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ashenvale Outrunner Sneak on Spawn'),
(@ENTRY,0,7,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,8,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,9,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,10,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

-- Ashenvale Scout
SET @ENTRY := 34177;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,5,35,5000,15000,11,78754,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Shot'),
(@ENTRY,0,5,0,0,0,100,0,2000,2000,40000,40000,11,22910,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Immolation Trap'),
(@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

 -- Ashenvale Skirmisher
SET @ENTRY := 34101;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,1,100,1,0,0,0,0,11,96437,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Leaping Cleave on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,3000,3000,20000,20000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');


 -- Ashenvale Skirmisher
SET @ENTRY := 33193;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,1,100,1,0,0,0,0,11,96437,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Leaping Cleave on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,3000,3000,20000,20000,11,17207,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Whirlwind');

-- Astranaar Officer
SET @ENTRY := 34420;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,0,3,10000,32000,11,78828,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bladestorm'),
(@ENTRY,0,5,0,0,0,100,0,2000,2000,122000,122000,11,78823,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Commanding Shout'),
(@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

-- Astranaar Skirmisher
SET @ENTRY := 34419;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,0,0,100,0,2000,2000,20000,20000,11,22910,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Immolation Trap'),
(@ENTRY,0,5,0,0,0,100,0,2000,7000,25000,30000,11,78826,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Evasion'),
(@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

-- Captain Elendilad
SET @ENTRY := 33302;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,2000,12000,12000,11,78828,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bladestorm'),
(@ENTRY,0,1,0,0,0,100,0,2000,2000,122000,122000,11,78823,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Commanding Shout');

-- Forsaken Herbalist
SET @ENTRY := 3733;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,2000,20000,21000,11,78705,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison Bottle');

-- Goblin Deforester
SET @ENTRY := 11684;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,5000,30000,30000,11,18546,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Overdrive');

-- Mannoroc Lasher
SET @ENTRY := 11697;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,0,40,3600,6900,11,9613,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,4,0,0,0,100,0,13900,13900,34600,34600,11,18543,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Flame Lash'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in blolt Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in blolt Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Orc Overseer
SET @ENTRY := 3734;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,2000,35000,35000,11,78710,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Threatening Shout');

 -- Roaming Felguard
SET @ENTRY := 6115;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,3000,12000,15000,11,22859,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Cleave'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Severed Druid
SET @ENTRY := 3799;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wrath on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,0,40,2400,3700,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wrath'),
(@ENTRY,0,4,0,0,0,100,0,9000,9000,30000,30000,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Wrath Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Wrath Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Severed Keeper 
SET @ENTRY := 3803;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,78907,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wrath on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,4000,4000,7900,7900,11,78907,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast wrath'),
(@ENTRY,0,4,0,0,0,100,0,7800,7800,15900,15900,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast moonfire'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in starfire Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in starfire Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Spined Crawler
SET @ENTRY := 3814;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,10000,25000,27000,11,78744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bubblebeam'),
(@ENTRY,0,1,0,0,0,100,0,7000,15000,28000,35000,11,5424,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Claw Grasp');

-- Tendril from Below 
SET @ENTRY := 33419;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,62975,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,2500,2500,10700,10700,11,78751,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Flay'),
(@ENTRY,0,4,0,0,0,100,0,1400,1400,3700,3700,11,62975,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Bolt'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Wrath Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Wrath Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Thistlefur Warrior 
SET @ENTRY := 33390;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn'),
(@ENTRY,0,1,0,0,0,100,0,5000,6000,15000,16000,11,77558,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bloody Strike');


-- Thistlefur Wise One
SET @ENTRY := 33389;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wrath on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,3100,3200,7000,7000,11,9739,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wrath'),
(@ENTRY,0,4,0,0,0,100,0,5300,5300,23500,23500,11,33844,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Entangling Roots'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Wrath Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Wrath Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%'),
(@ENTRY,0,11,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn');

-- Twilight Firesworn <Twilight's Hammer>
SET @ENTRY := 25863;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Shield on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,4200,4400,7400,7600,11,20793,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fire Ball'),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Wrath Range'),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Wrath Range'),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Warsong Shaman
SET @ENTRY := 11683;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,20805,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,3200,3400,5600,5700,11,20805,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,4,0,0,0,100,0,11950,11950,68600,68600,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Wrath Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Wrath Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Wrathtail Myrmidon
SET @ENTRY := 3711;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,7000,25000,30000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,0,0,100,0,1000,8000,10000,16000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

-- Wrathtail Priestess
SET @ENTRY := 3711;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,500,1000,20000,20000,11,17140,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Fire'),
(@ENTRY,0,1,0,0,0,100,0,6000,8000,38000,40000,11,11835,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Power Word: Shield');

  -- Xavian Betrayer
SET @ENTRY := 3754;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,3,0,2,0,100,0,16,100,5000,12000,11,77522,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast swoop'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,11,6925,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Gift of the Xavian at 15% HP');

 -- Xavian Felsworn
SET @ENTRY := 3755;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,35913,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fel Fireball on Aggro'),
(@ENTRY,0,3,0,2,0,100,0,16,100,3600,6700,11,35913,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fel Fireball'),
(@ENTRY,0,4,0,2,0,100,0,0,14,5200,7400,11,35913,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fel Fireball after heal'),
(@ENTRY,0,5,0,2,0,100,1,0,15,0,0,11,6925,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Gift of the Xavian at 15% HP'),
(@ENTRY,0,6,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Fireball Range'),
(@ENTRY,0,7,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Fireball Range'),
(@ENTRY,0,9,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,11,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Xavian Hellcaller
SET @ENTRY := 3757;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball on Aggro'),
(@ENTRY,0,3,0,2,0,100,0,16,100,3300,6600,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball'),
(@ENTRY,0,4,0,2,0,100,0,0,14,5100,8300,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fireball after heal'),
(@ENTRY,0,5,0,2,0,100,1,0,15,0,0,11,6925,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Gift of the Xavian at 15% HP'), 
(@ENTRY,0,6,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Fireball Range'),
(@ENTRY,0,7,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Fireball Range'),
(@ENTRY,0,9,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,11,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

  -- Xavian Rogue
SET @ENTRY := 3752;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,10000,55000,60000,11,60842,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Expose Armor'),
(@ENTRY,0,1,0,2,0,100,1,0,15,0,0,11,6925,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Gift of the Xavian at 15% HP');

  -- Evenar Stillwhisper
SET @ENTRY := 33204;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Smite on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,3900,3900,6500,6500,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Holy Smite'),
(@ENTRY,0,4,0,0,0,100,0,3600,3600,26500,26500,11,11639,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shadow Word: Pain'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Smite Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Smite Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');


 -- Searing Infernal(nie wiem jak dziala...)
SET @ENTRY := 6073;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,20000,29000,11,36247,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Fel FireBall'),
(@ENTRY,0,1,0,0,0,100,0,1000,5000,30000,34000,11,32749,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Shield');

  -- Talen
SET @ENTRY := 3846;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,25000,27000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend'),
(@ENTRY,0,1,0,0,0,100,0,1000,5000,12000,16000,11,11976,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Strike');

  -- Mist Howler
SET @ENTRY := 10644;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,10000,45000,46000,11,8715,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Terrifying Howl'),
(@ENTRY,0,1,0,0,0,100,0,15000,18000,35000,38000,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Tendon Rip'),
(@ENTRY,0,2,0,0,0,100,0,3000,5000,17000,19000,11,13443,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

  -- Elder Ashenvale Bear  
SET @ENTRY := 3810;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,11000,15000,40000,42000,11,50256,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Demoralizing Roar'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,15000,18000,11,84867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sundering Swipe');

  -- Felmusk Rogue
SET @ENTRY := 3759;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,56000,60000,11,60842,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Expose Armor'),
(@ENTRY,0,1,0,0,0,100,0,16000,20000,40000,44000,11,78867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Overwhelming Stench'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');


-- Felmusk Shadowstalker 
SET @ENTRY := 3763;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Throw on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,10277,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Throw'),
(@ENTRY,0,4,0,0,0,100,0,16000,20000,40000,44000,11,78867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Overwhelming Stench'),
(@ENTRY,0,5,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
(@ENTRY,0,6,0,1,0,100,1,100,100,0,0,11,77806,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stealth on Spawn'),
(@ENTRY,0,7,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Throw Range'),
(@ENTRY,0,8,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,9,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Throw Range'),
(@ENTRY,0,10,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Throw Range');

 -- Ghostpaw Howler
SET @ENTRY := 3824;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,26000,30000,11,3264,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Blood Howl');

-- Shadethicket Bark Ripper
SET @ENTRY := 3784;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,32000,36000,11,3604,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Tendon Rip');

-- Shadethicket Stone Mover
SET @ENTRY := 3782;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,7000,23000,24000,11,6864,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Strength of Stone');

-- Shadowhorn Stag
SET @ENTRY := 3817;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6921,0,0,0,0,0,1,1,0,0,0,0,0,0,'Cast Shadowhorn Charge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,10000,15000,60000,60000,11,6922,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of the Shadowhorn');

-- Silverwing Warrior
SET @ENTRY := 12897;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,50000,8000,25000,28000,11,11977,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rend');

-- Splintertree Raider
SET @ENTRY := 12859;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Thistlefur Avenger
SET @ENTRY := 3925;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Leaping Rush on Aggro'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8602,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Vengeance at 30% HP');

-- Thistlefur Pathfinder
SET @ENTRY := 3926;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,5,35,5000,15000,11,78754,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Shot'),
(@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range'),
(@ENTRY,0,9,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn');

  -- Thistlefur Shaman
SET @ENTRY := 3924;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,10000,45000,45000,11,6742,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,25000,28000,11,39591,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Searing Totem'),
(@ENTRY,0,2,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn');

  -- Wildthorn Venomspitter
SET @ENTRY := 3820;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,6000,25000,27000,11,6917,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Venom Spitt');

-- Elenna Edune
SET @ENTRY := 24738;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

  -- Overseer Gorthak (dodac tekst)
SET @ENTRY := 17304;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,6000,14000,15000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Clave'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,20000,23000,11,11972,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shield Bash');

  -- Protector Dorinar
SET @ENTRY := 34294;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,2000,3000,123000,124000,11,78823,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Commanding Shout'),
(@ENTRY,0,1,0,0,0,100,0,12000,17000,32000,37000,11,78826,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Evasion'),
(@ENTRY,0,2,0,0,0,100,0,6000,10000,55000,59000,11,60842,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Expose Armor');

  -- Sharptalon
SET @ENTRY := 12676;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,10000,35000,39000,11,12097,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pierce Armor');

  -- Taneel Darkwood(tekst dodac!)
SET @ENTRY := 3940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,13860,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Blast on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,1900,1900,4100,4100,11,13860,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Blast'),
(@ENTRY,0,4,0,0,0,100,0,3500,3500,12550,12550,11,16568,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mind Flay'),
(@ENTRY,0,5,0,0,0,100,0,7650,7650,25050,25050,11,11640,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Renew'),
(@ENTRY,0,6,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in blast Range'),
(@ENTRY,0,7,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,8,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in blast Range'),
(@ENTRY,0,9,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,11,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Uthil Mooncall 
SET @ENTRY := 3941;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,2000,15000,17000,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast moonfire'),
(@ENTRY,0,1,0,0,0,100,0,8000,12000,27000,32000,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation'),
(@ENTRY,0,2,0,2,0,100,1,0,50,0,0,11,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bear Form at 50% HP'),
(@ENTRY,0,3,0,2,0,100,0,0,50,3000,8000,11,12161,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast maul at 50% HP');

-- Vorsha the Lasher
SET @ENTRY := 12940;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,25000,27000,11,6607,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast lash'),
(@ENTRY,0,1,0,0,0,100,0,4000,6000,10000,12000,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast trash');

  -- Keeper Heartwise
SET @ENTRY := 33443;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,63032,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Starfire on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,3700,4000,7800,8000,11,63032,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Starfire'),
(@ENTRY,0,4,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Starfire Range'),
(@ENTRY,0,5,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,6,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Starfire Range'),
(@ENTRY,0,7,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,8,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Apothecary Falthis
SET @ENTRY := 3735;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,16000,17000,11,21067,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison Bolt'),
(@ENTRY,0,1,0,0,0,100,0,11000,12000,30000,31000,11,78705,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Poison Bottle');

-- Blink Dragon 
SET @ENTRY := 3815;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,17000,19000,50000,52000,11,8611,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Phase Shift');

-- Cenarion Protector
SET @ENTRY := 3797;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,12000,27000,32000,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation'),
(@ENTRY,0,1,0,2,0,100,1,0,50,0,0,11,7090,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bear Form at 50% HP'),
(@ENTRY,0,2,0,2,0,100,0,0,50,4000,24000,11,15727,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demoralizing Roarat 50% HP');

-- Cenarion Vindicator
SET @ENTRY := 3833;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,8000,10000,25000,27000,11,15798,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Moonfire');

-- Crazed Ancient
SET @ENTRY := 3834;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,10000,30000,33000,11,6909,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Thorns');

-- Felmusk Satyr
SET @ENTRY := 3758;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,17000,19000,40000,40000,11,78867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Overwhelming Stench'),
(@ENTRY,0,1,0,0,0,100,0,5000,7000,15000,17000,11,31279,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast swipe'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Vengeance at 30% HP');

  -- Shadethicket Raincaller 
SET @ENTRY := 3783;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt on Aggro'),
(@ENTRY,0,3,0,0,0,100,0,3200,3500,7000,7200,11,9532,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Bolt'),
(@ENTRY,0,4,0,0,0,100,0,14400,14400,64800,64800,11,32193,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Lightning Cloud'),
(@ENTRY,0,5,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Bolt Range'),
(@ENTRY,0,6,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Bolt Range'),
(@ENTRY,0,8,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,9,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,10,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%');

-- Shady Nook Guardian
SET @ENTRY := 34500;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,30000,32000,11,87185,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Demoralizing Roar'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Leaping Rush on Aggro');

-- Silverwing Sentinel
SET @ENTRY := 12896;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

  -- Thistlefur Totemic
SET @ENTRY := 3922;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,30000,33000,11,78770,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Magma Totem'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn');

  -- Thistlefur Ursa
SET @ENTRY := 3921;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,18000,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thunderclap'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,3490,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzied Rage at 30% HP');

-- Warsong Vanguard
SET @ENTRY := 34366;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,6000,25000,31000,11,17963,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sundering Cleave'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,11,6268,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Rushing Charge on Aggro');

-- Withered Ancient
SET @ENTRY := 3919;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,10000,30000,33000,11,6909,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of Thorns');

-- Branch Snapper
SET @ENTRY := 10641;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,13000,20000,32000,39000,11,78808,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sunbeam'),
(@ENTRY,0,1,0,0,0,100,0,7000,12000,25000,28000,11,33844,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Entangling Roots');

  -- Rorgish Jowl
SET @ENTRY := 10639;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,18000,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thunderclap'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,3490,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzied Rage at 30% HP');

  -- Enraged Foulweald
SET @ENTRY := 12921;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,15000,18000,11,6816,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Thunderclap');

-- Elder Shadowhorn Stag
SET @ENTRY := 3818;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6921,0,0,0,0,0,1,1,0,0,0,0,0,0,'Cast Shadowhorn Charge on Aggro'),
(@ENTRY,0,1,0,0,0,100,0,10000,15000,60000,60000,11,6922,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Curse of the Shadowhorn');

-- Foulweald Pathfinder
SET @ENTRY := 3745;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,5,30,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
(@ENTRY,0,4,0,0,0,100,0,7000,9000,30000,32000,11,6817,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Corrupted Agility'),
(@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
(@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');

-- Foulweald Totemic
SET @ENTRY := 3750;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,10000,30000,32000,11,6818,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Corrupted Intellect'),
(@ENTRY,0,1,0,0,0,100,0,5000,8000,25000,28000,11,39591,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Searing Totem');

-- Foulweald Warrior
SET @ENTRY := 3743;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,7000,9000,30000,32000,11,6816,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Corrupted Strength'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Goblin Technician
SET @ENTRY := 34590;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,25000,27000,11,7978,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Throw Dynamite');

-- Shadethicket Wood Shaper
SET @ENTRY := 3781;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,9000,15000,35000,41000,11,12747,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Entangling Roots');

-- Silverwind Conqueror
SET @ENTRY := 34592;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,1000,3000,121000,123000,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout'),
(@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Wildthorn Lurker
SET @ENTRY := 3821;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,10000,13000,21000,23000,11,744,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Poison'),
(@ENTRY,0,1,0,11,0,100,1,0,0,0,0,11,77806,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Stealth on Spawn');

-- Duriel Moonfire
SET @ENTRY := 12860;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,10000,13000,41000,43000,11,12097,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pierce Armor'),
(@ENTRY,0,1,0,0,0,100,0,60000,9000,20000,29000,11,11428,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown');

  -- Dal Bloodclaw
SET @ENTRY := 3987;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,5000,8000,17000,20000,11,77558,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Bloody Strike'),
(@ENTRY,0,1,0,0,0,100,0,10000,12000,40000,45000,11,21049,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Bloodlust'),
(@ENTRY,0,2,0,11,0,100,1,0,0,0,0,11,6813,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Coat of Thistlefur on Spawn'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast enrage at 30% HP');

-- Befouled Water Elemental
SET @ENTRY := 3917;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,6000,9000,24000,27000,11,78542,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Splash'),
(@ENTRY,0,1,0,0,0,100,0,10000,14000,35000,39000,11,78799,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wave Crash'),
(@ENTRY,0,2,0,0,0,100,0,1000,4000,9000,12000,11,6873,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Foul Chill');

-- Lady Vespia
SET @ENTRY := 10559;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
(@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
(@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,32011,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Water Bolt on Aggro'),
(@ENTRY,0,3,0,9,1,100,0,40,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Bolt Range'),
(@ENTRY,0,4,0,9,1,100,0,10,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
(@ENTRY,0,5,0,9,1,100,0,0,40,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Bolt Range'),
(@ENTRY,0,6,0,3,1,100,0,0,15,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 2 at 15% Mana'),
(@ENTRY,0,7,0,3,2,100,0,0,15,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving at 15% Mana'),
(@ENTRY,0,8,0,3,2,100,0,30,100,100,100,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 When Mana is above 30%'),
(@ENTRY,0,9,0,2,2,100,1,0,15,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 3 at 15% HP'),
(@ENTRY,0,10,0,7,3,100,1,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Reset on Evade'),
(@ENTRY,0,11,0,0,0,100,0,4700,5900,12500,17000,11,32011,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Water Bolt'),
(@ENTRY,0,12,0,0,0,100,0,2300,2700,9000,12000,11,78542,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Splash');

-- Ghostpaw Alpha
SET @ENTRY := 3825;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,45,0,0,11,78837,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ghostform at 45% HP'),
(@ENTRY,0,1,0,2,0,100,1,0,45,0,0,11,78832,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast at 45% HP'),
(@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');

-- Ghostpaw Runner
SET @ENTRY := 3823;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,2,0,100,1,0,45,0,0,11,78837,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Ghostform at 45% HP'),
(@ENTRY,0,1,0,2,0,100,1,0,45,0,0,11,78832,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Arcane Blast at 45% HP'),
(@ENTRY,0,2,0,2,0,100,1,0,45,2000,2000,11,24604,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Furious Howl at 45% HP'),
(@ENTRY,0,3,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');



-- Add some spells to Ashenvale NPC's (by Bastek)


    -- Astranaar Sentinel
    SET @ENTRY := 51770;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
 
    -- Forest Song Peacekeeper
    SET @ENTRY := 51507;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,0,0,100,0,5000,10000,15000,120000,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
    (@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Hellscream Grunt
    SET @ENTRY := 51868;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,0,0,100,0,5000,10000,15000,120000,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
    (@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Silverwind Vanquisher
    SET @ENTRY := 51867;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@ENTRY,0,0,0,4,1,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro');
 
    -- Splintertree Guard
    SET @ENTRY := 51814;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Stardust Sentinel
    SET @ENTRY := 51816;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');    
   
     -- Illiyana Moonblaze <Silverwing Supply Officer>
    SET @ENTRY := 14753;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,50,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,30,10000,20000,11,21390,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Multi Shot'),
    (@ENTRY,0,4,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,5,0,2,0,100,1,0,30,0,0,11,3019,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Frenzy at 30% HP'),
    (@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Sentinel Farsong
    SET @ENTRY := 14733;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Silverwing Elite
    SET @ENTRY := 14715;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,0,0,100,0,5000,10000,15000,120000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
    (@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
   
    -- Felhunter Minion
    SET @ENTRY := 17648;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES  
    (@ENTRY,0,0,0,9,1,100,0,0,20,3500,4100,11,79616,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Drain Life');
   
    -- Big Baobob <Ancient of War>
    SET @ENTRY := 34604;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,65735,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation at 30% HP');
   
    -- Ashenvale Sentinel
    SET @ENTRY := 8015;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Splintertree Guard
    SET @ENTRY := 34052;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Raging Ancient
    SET @ENTRY := 33688;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,9,1,100,0,0,30,3500,4100,11,11922,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Entangling Roots'),
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,45,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast War Stomp at 30% HP');
   
    -- Wandering Protector
    SET @ENTRY := 12836;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,9,1,100,0,0,30,3500,4100,11,11922,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Entangling Roots'),
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,45,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast War Stomp at 30% HP');
   
    -- Astranaar Sentinel
    SET @ENTRY := 6087;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Guardian Gurtar
    SET @ENTRY := 34242;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Hellscream Grunt
    SET @ENTRY := 43653;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,0,0,100,0,5000,10000,15000,120000,11,40505,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Cleave'),
    (@ENTRY,0,5,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP'),
    (@ENTRY,0,6,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,8,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,9,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Silverwind Vanquisher
    SET @ENTRY := 43657;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@ENTRY,0,0,0,4,1,100,1,0,0,0,0,11,32064,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Shout on Aggro'),
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');
   
    -- Splintertree Guard
    SET @ENTRY := 12903;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Stardust Sentinel
    SET @ENTRY := 39254;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Warsong Guardian
    SET @ENTRY := 34241;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,95826,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Ashenvale Assassin
    SET @ENTRY := 34603;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,5,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,6,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,7,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Orendil Broadleaf
    SET @ENTRY := 3847;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,2,0,100,1,0,30,0,0,11,62804,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation at 30% HP');
   
    -- Warsong Outrider
    SET @ENTRY := 12864;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,15547,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,30,10000,20000,11,18545,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Scorpid Sting'),
    (@ENTRY,0,4,0,9,1,100,0,5,45,3500,4100,11,6660,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');
   
    -- Terrowulf Packlord
    SET @ENTRY := 3792;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@ENTRY,0,0,0,4,1,100,1,0,0,0,0,11,6507,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Battle Roar on Aggro');
   
    -- Shindrell Swiftfire
    SET @ENTRY := 3845;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Set Phase 1 on Aggro'),
    (@ENTRY,0,1,0,4,1,100,1,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving on Aggro'),
    (@ENTRY,0,2,0,4,1,100,1,0,0,0,0,11,15547,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot on Aggro'),
    (@ENTRY,0,3,0,9,1,100,0,5,45,3500,4100,11,15547,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Shoot'),
    (@ENTRY,0,4,0,0,0,100,0,5000,15000,25000,35000,11,32908,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Wing Clip'),
    (@ENTRY,0,5,0,9,1,100,0,30,100,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,6,0,9,1,100,0,9,15,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving at 15 Yards'),
    (@ENTRY,0,7,0,9,1,100,0,0,5,0,0,21,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Start Moving when not in Shoot Range'),
    (@ENTRY,0,8,0,9,1,100,0,5,30,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Stop Moving when in Shoot Range');  
   
    -- Phantim
    SET @ENTRY := 5314;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@ENTRY,0,0,0,0,0,100,0,5000,15000,25000,35000,11,16359,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Corrosive Acid Breath'),
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,20671,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Summon Phantim Illusion at 30% HP');
   
    -- Kaliva <Mistress of Chains>
    SET @ENTRY := 34602;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,9,1,100,0,5,30,15000,25000,11,81650,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Sinful Beam');
   
    -- Dreamstalker
    SET @ENTRY := 12498;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES    
    (@ENTRY,0,0,0,0,0,100,0,5000,15000,25000,35000,11,16359,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Corrosive Acid Breath');
   
    -- Emeraldon Oracle
    SET @ENTRY := 12476;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,4000,8000,15000,20000,11,9591,0,0,0,0,0,2,0,0,0,0,0,0,0,'Acid Spit'),    
    (@ENTRY,0,1,0,2,0,100,1,0,35,0,0,11,12160,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Rejuvenation at 35% HP');
   
    -- Emeraldon Tree Warder
    SET @ENTRY := 12475;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,5000,15000,25000,35000,11,78921,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Dream Lash');
   
    -- Bloodtooth Guard
    SET @ENTRY := 3932;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,5000,10000,20000,25000,11,78842,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Carnivorous Bite'),
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');
   
    -- Lesser Felguard
    SET @ENTRY := 3772;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,5000,10000,15000,25000,11,18812,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown'),
    (@ENTRY,0,1,0,0,0,100,0,500,4500,66000,77800,11,184,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Fire Shield'),
    (@ENTRY,0,2,0,2,0,100,1,0,30,0,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');
   
    -- Felslayer
    SET @ENTRY := 3774;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,1000,7000,12000,17000,11,13321,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mana Burn');    
   
    -- Duriel Moonfire (test) H
    SET @ENTRY := 12860;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,5000,10000,15000,25000,11,18812,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Knockdown'),
    (@ENTRY,0,1,0,0,0,100,0,5000,7000,35000,40000,11,12097,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Pierce Armor');  
   
    -- Emeraldon Boughguard
    SET @ENTRY := 12474;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6268,0,0,0,0,0,2,1,0,0,0,0,0,0,'Cast Rushing Charge on Aggro'),
    (@ENTRY,0,1,0,0,0,100,0,5000,7000,35000,40000,11,32736,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast Mortal Strike');  

    -- Ursol'lok 
    SET @ENTRY := 12037;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,75002,0,0,0,0,0,2,1,0,0,0,0,0,0,'Leaping Rush On Aggro'),
    (@ENTRY,0,1,0,0,0,100,0,5000,7000,25000,35000,11,84867,0,0,0,0,0,2,0,0,0,0,0,0,0,'Sundering Swipe');
 
 
    -- Painmaster Thundrak (test) A
    SET @ENTRY := 39096;
    UPDATE creature_template SET AIName='SmartAI' WHERE entry=@ENTRY;
    DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=@ENTRY;
    INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_x,target_y,target_z,target_o,comment) VALUES
    (@ENTRY,0,0,0,0,0,100,0,5000,10000,15000,25000,11,81419,0,0,0,0,0,2,0,0,0,0,0,0,0,'Cast The Painhammer'),    
    (@ENTRY,0,1,0,2,0,100,1,0,30,0,0,11,33958,0,0,0,0,0,1,0,0,0,0,0,0,0,'Cast Enrage at 30% HP');
   
   
   -- Poison Water quest items drop fix (by Bastek)
DELETE FROM creature_loot_template WHERE entry IN (2958, 2956, 2957) AND item IN (4758, 4759);
INSERT INTO creature_loot_template VALUES
(2958, 4758, -40, 1, 0, 1, 1),
(2956, 4759, -51, 1, 0, 1, 1),
(2957, 4759, -6, 1, 0, 1, 1);

UPDATE `creature_template` SET `Health_mod`=1.32 WHERE `entry`=38038;
UPDATE `creature_template` SET `KillCredit1`=5857 WHERE `entry` IN (5858);

-- Set proper spawn point for Seer Bahura (by Bastek)
UPDATE creature SET position_x = 1586.762085, position_y = -4420.654785, position_z = 15.028081, orientation = 1.375939 WHERE id = 39283;

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id`=38142;
DELETE FROM gameobject_loot_template WHERE item=48766;
INSERT INTO gameobject_loot_template VALUES
('195492', '48766', '-100', '1', '0', '1', '1');

UPDATE creature_template SET ScriptName='npc_deffiant_troll' WHERE entry=34830;


DELETE FROM script_texts WHERE npc_entry=34830;
INSERT INTO script_texts (npc_entry, entry, content_default, COMMENT)VALUES
('34830', '-1799990', 'Sorry, mon. It won\'t happen again.', 'defiant_troll_1'),
('34830', '-1799991', 'Ooops, break\'s over.', 'defiant_troll_2'),
('34830', '-1799992', 'Work was bettah in da Undermine!', 'defiant_troll_3'),
('34830', '-1799993', 'I report you to HR!', 'defiant_troll_4'),
('34830', '-1799994', 'I\'m going. I\'m going!', 'defiant_troll_5');

UPDATE creature_template SET npcflag=1 WHERE entry=34830;

-- Ancient Shadowmoon Spirit quests (by Bastek)
UPDATE quest_template SET NextQuestId = 10635 WHERE id = 10634;
UPDATE quest_template SET NextQuestId = 10636, PrevQuestId = 10634 WHERE id = 10635;
UPDATE quest_template SET NextQuestId = 10637, PrevQuestId = 10635 WHERE id = 10636;
UPDATE quest_template SET RequiredRaces = 690 WHERE id = 10639;
UPDATE quest_template SET RequiredRaces = 1101 WHERE id = 10645;

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

UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=39834;

DELETE FROM conditions WHERE SourceEntry=74409 AND SourceTypeOrReferenceId=13;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(13,0,74409,0,18,1,39834,0,0,0,'Seal Dream Portal can hit only Dream Portal Bunny.');


UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=39834;
DELETE FROM `smart_scripts` WHERE `entryorguid`=39834 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(39834,0,2,0,8,0,100,0,74409,0,0,0,33,39834,0,0,0,0,0,7,0,0,0,0,0,0,0,'Dream Portal Bunny - On SpellHit - Kill credit');

-- Fix for quest Secure the Cargo!
DELETE FROM gameobject_loot_template WHERE entry = 186450;
INSERT INTO gameobject_loot_template (entry, item, ChanceOrQuestChance, lootmode, groupid, mincountOrRef, maxcount) VALUES
(186450, 33163, -100, 1, 0, 1, 1);
DELETE FROM gameobject WHERE id = 186450;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(186450, 1, 1, 1, -4050.4, -3494.15, 39.4257, 2.07694, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3987.02, -3688.77, 46.9588, 1.55334, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4008.56, -3735.68, 45.7889, 1.85005, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3832.05, -3735.62, 38.5167, -1.95477, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3941.57, -3842.56, 35.8808, 0.157079, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3990.25, -3643.93, 44.6844, -2.51327, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3739.73, -3601.78, 41.8935, -2.60053, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3802.15, -3689.68, 43.6142, 0.349065, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3934.03, -3691.96, 42.7914, -0.733038, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4151.63, -3588.12, 41.5485, -2.96704, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3872.59, -3743.38, 42.919, -3.10665, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3876.15, -3672.18, 38.226, -2.87979, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3764.53, -3662.09, 46.6152, 2.53072, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3836.1, -3692.68, 44.1724, -0.331611, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3841.06, -3603.74, 40.4643, -2.87979, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3984.16, -3808.6, 36.449, -3.08918, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3951.3, -3723.65, 45.1108, -1.69297, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3894.64, -3798.1, 40.2407, 2.58308, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3963.13, -3492.72, 30.8604, -1.29154, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3798.32, -3583.9, 40.7298, -1.43117, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4125.91, -3536.05, 34.0636, -1.6057, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4045.37, -3672.55, 43.4523, 0.645772, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4071.13, -3736.18, 38.3415, 2.32129, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4018.3, -3836.41, 38.4298, -3.03684, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4101.67, -3746.68, 36.5069, -0.523598, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3901.86, -3852.01, 47.3186, 0.017452, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4015.71, -3502.92, 35.9685, -2.49582, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4097.73, -3509.59, 37.9191, 2.14675, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4166.49, -3672.94, 40.4527, 1.0472, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4133.8, -3675.16, 46.2591, 1.11701, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4094.93, -3790.06, 36.385, 1.13446, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3758.37, -3557.56, 40.0753, -0.593412, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4060.56, -3847.67, 36.6591, 0.610863, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3920.49, -3755.76, 38.9218, 1.29154, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -4048.43, -3615.76, 47.3822, 1.16937, 0, 0, 0, 1, 180, 100, 1),
(186450, 1, 1, 1, -3895.94, -3562.92, 37.1615, -1.67551, 0, 0, 0, 1, 180, 100, 1);
   
DELETE FROM conditions WHERE SourceEntry=50742 AND SourceTypeOrReferenceId=18;
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, ElseGroup, ConditionTypeOrReference, ConditionValue1, ConditionValue2, ConditionValue3, ErrorTextId, ScriptName, COMMENT)VALUES
(18,0,50742,0,24,2,6517,0,0,0,'You can use Scrape Sticky Tar only on dead Tar Beast'),
(18,0,50742,0,24,2,6527,0,0,0,'You can use Scrape Sticky Tar only on dead Tar Creeper');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=71969 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,71969,18,0,2,6517,0,0,'Dummy effect from Scrape Sticky Tar hit dead Tar Beast'),
(13,0,71969,18,0,2,6527,0,0,'Dummy effect from Scrape Sticky Tar hit dead Tar Creeper');


UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=6517;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6517 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(6517,0,0,0,11,0,100,0,0,0,0,0,11,14178,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tar Beast - On Respawn- Cast Sticky Tar'),
(6517,0,1,0,8,0,100,0,71969,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tar Beast - On SpellHit - Despawn');


UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=6527;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6527 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(6527,0,0,0,11,0,100,0,0,0,0,0,11,14178,2,0,0,0,0,1,0,0,0,0,0,0,0,'Tar Creeper - On Respawn- Cast Sticky Tar'),
(6527,0,1,0,0,0,100,0,8000,8000,14000,19000,11,5568,2,0,0,0,0,2,0,0,0,0,0,0,0,'Tar Creeper - IC - Cast Trample'),
(6527,0,2,0,8,0,100,0,71969,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Tar Creeper - On SpellHit - Despawn');

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
UPDATE quest_template SET SpecialFlags=1 WHERE id=12718;

UPDATE quest_template SET SpecialFlags=2 WHERE id = 12801;

DELETE FROM event_scripts WHERE id = 90000;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, X, Y, z, o)VALUES
('90000', '0', '6', '530', '0', '9332.96', '-7813.38', '136.56', '5.24');

DELETE FROM event_scripts WHERE id = 90001;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, X, Y, z, o)VALUES
('90001', '0', '6', '530', '0', '9333.98', '-7879.76', '74.9', '2.15');

DELETE FROM `creature_template_addon` WHERE `entry`=36756;
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(36756,0,0,7,0,65, '');

DELETE FROM creature_addon WHERE guid IN (SELECT `guid` FROM `creature` WHERE `id`=36756);

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry`=36756;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36756;
INSERT INTO `npc_spellclick_spells` VALUES
(36756,69261,1,3),
(36756,69262,1,1);

REPLACE INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(69262,0,0,18,0,0,0,0,0,0,0);

DELETE FROM `spell_target_position`  WHERE `id` IN (76897,76896);
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES
(76896,0,-11363.1,-2716.96,13.588,5.21725),
(76897,0,-11456.8,-2634.28,3.912,2.91132);

UPDATE `quest_template` SET `RequiredRaces`=26 WHERE `id` IN (27273,27356);


DELETE FROM `gameobject_questrelation` WHERE `id`=203186;
INSERT INTO `gameobject_questrelation`(`id`,`quest`)VALUES
(203186,26043);

UPDATE `creature_template` SET `npcflag`=0x1000000 WHERE `entry`=48671;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=48671;
INSERT INTO `npc_spellclick_spells` VALUES
(48671,90672,1,3),
(48671,79588,1,1);

DELETE FROM `spell_scripts` WHERE `id`=79588;
INSERT INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(79588,0,0,18,0,0,0,0,0,0,0);

-- Questrelation added to GO (by Bastek)
DELETE FROM gameobject_questrelation WHERE id = 204406;
INSERT INTO gameobject_questrelation VALUES
(204406, 26603);
-- Removal of old Wetlands NPC's (by Bastek)
DELETE FROM creature WHERE id IN
(1028,30720,4062,1069,1044,2089,1015,1018,1017,1020,1023,1021,1022,1042,1353,37703,1400,1417);

DELETE FROM `creature_template_addon` WHERE `entry`=42046;
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(42046,0,0,0,0,0, '78357 0');
 
DELETE FROM creature_addon WHERE guid IN (SELECT `guid` FROM `creature` WHERE `id`=42046);
 
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=78369 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES (13,0,78369,18,0,1,42046,0,0,'Extinguish Fire should only target Burning Bomber Credit');
 
-- Burning Bomber Credit
SET @ENTRY := 4204600;
SET @SOURCETYPE := 9;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,1,0,0,0,100,0,1000,1000,0,0,33,42046,0,0,0,0,0,7,0,0,0,0.0,0.0,0.0,0.0,"Burning Bomber Credit - Script - Kill Credit"),
(@ENTRY,@SOURCETYPE,2,0,0,0,100,0,1000,1000,0,0,11,61172,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Burning Bomber Credit - Script - Cast spell Extinguish Fire"),
(@ENTRY,@SOURCETYPE,3,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Burning Bomber Credit - Script - Cast spell Extinguish Fire");
 
-- Burning Bomber Credit
SET @ENTRY := 42046;
SET @SOURCETYPE := 0;
 
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=@SOURCETYPE;
UPDATE creature_template SET AIName="SmartAI" WHERE entry=@ENTRY LIMIT 1;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,@SOURCETYPE,0,0,8,0,100,0,78369,0,100,120,80,4204600,0,0,0,0,0,1,0,0,0,0.0,0.0,0.0,0.0,"Burning Bomber Credit - On SpellHit - run script");
UPDATE `creature_template` SET `flags_extra`=128 WHERE `entry`=42046;

UPDATE `creature_template_addon` SET `auras`='45111' WHERE `entry`=34830;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=72520 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,72520,18,0,1,38660,0,0,'Throw Burning Rum must hit trigger'),
(13,0,72520,18,0,1,38662,0,0,'Throw Burning Rum must hit trigger'),
(13,0,72520,18,0,1,38665,0,0,'Throw Burning Rum must hit trigger');


UPDATE `creature_template` SET `KillCredit1`=39026 WHERE `entry` IN (7856,7855,7858);


DELETE FROM `creature` WHERE `id` IN (33132,33133,33131);
DELETE FROM `creature` WHERE `id`=33048 AND `phaseMask`=2;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL,33132,1,1,2,0,0,6561.43,272.2937,11.20112,3.228859,120,0,0,1,0,0,0,0,0),
(NULL,33133,1,1,2,0,0,6499.189,189.8758,6.91524,5.235988,120,0,0,1,0,0,0,0,0),
(NULL,33131,1,1,2,0,0,6491.191,250.3396,6.027864,2.478368,120,0,0,1,0,0,0,0,0),
(NULL,33048,1,1,2,0,0,6541.613,238.9123,7.651517,1.692969,120,0,0,1,0,0,0,0,0);

UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (33132,33133,33131);

DELETE FROM `creature_questrelation` WHERE `id` IN (33132,33133,33131);
INSERT INTO `creature_questrelation` (`id`,`quest`) VALUES
(33132,13597),
(33131,13568),
(33133,13567);

DELETE FROM `creature_involvedrelation` WHERE `id` IN (33132,33133,33131);
INSERT INTO `creature_involvedrelation` (`id`,`quest`) VALUES
(33132,13597),
(33131,13568),
(33133,13567);

UPDATE `quest_template` SET `ExclusiveGroup`=13597 WHERE `id` IN (13597,13568,13567);


-- dunno czemu to nie dzia³a
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`='33048';
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33048;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid`=33048*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33048,0,0,0,20,0,100,0,13569,0,0,0,80,33048*100,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keeper Karithus - On quest complete - run script'),
(33048*100,9,0,0,0,0,100,0,0,0,0,0,28,64198,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Keeper Karithus - Script - remove aura Grovekeeper''s Trance'),
(33048*100,9,1,0,0,0,100,0,0,0,0,0,11,64359,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Keeper Karithus - Script - Cast spell Ritual Bond'),
(33048*100,9,2,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keeper Karithus - Script - say'),
(33048*100,9,3,0,0,0,100,0,7000,7000,0,0,11,62182,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keeper Karithus - Script - Cast spell Nature Channeling'),
(33048*100,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keeper Karithus - Script - say'),
(33048*100,9,5,0,0,0,100,0,0,0,0,0,28,62182,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Keeper Karithus - Script - remove aura Nature Channeling');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`='33131';
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33131;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33131,0,0,0,20,0,100,0,13568,0,0,0,85,64340,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Great Moonstalker Spirit - On quest complete - Cast Blessing of the Moonstalker');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`='33132';
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33132;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33132,0,0,0,20,0,100,0,13597,0,0,0,85,64329,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Great Thistle Bear Spirit - On quest complete - Cast Blessing of the Thistle Bear');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`='33133';
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33133;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33133,0,0,0,20,0,100,0,13567,0,0,0,85,64341,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Great Stag Spirit - On quest complete - Cast Blessing of the Stag');

DELETE FROM `creature_text` WHERE `entry`=33048;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(33048,0,0,'Please hold still for a moment.',0,0,100,0,0,0,'Keeper Karithus'),
(33048,1,0,'It is done. The spirit is bound with you and you will carry it with you anytime you are in Darkshore. May you serve nature well.',0,0,100,0,0,0,'Keeper Karithus');

delete from `playercreateinfo_spell` WHERE race = 6 AND class = 7;

insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','81','Dodge');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','107','Block');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','196','One-Handed Axes');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','197','Two-Handed Axes');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','198','One-Handed Maces');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','199','Two-Handed Maces');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','203','Unarmed');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','204','Defense');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','227','Staves');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','403','Lightning Bolt');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','522','SPELLDEFENSE (DND)');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','669','Language Orcish');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','670','Language Taurahe');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','1180','Daggers');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','1843','Disarm');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','2382','Generic');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','2479','Honorless Target');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','3050','Detect');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','3365','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6233','Closing');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6246','Closing');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6247','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6477','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6478','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','6603','Attack');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','7266','Duel');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','7267','Grovel');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','7355','Stuck');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','8386','Attacking');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','9077','Leather');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','9078','Cloth');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','9116','Shields');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','9125','Generic');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','15590','Fist Weapons');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','20549','War Stomp');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','20550','Endurance');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','20551','Nature Resistance');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','20552','Cultivation');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','21651','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','21652','Closing');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','22027','Remove Insignia');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','22810','Opening - No Text');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','27763','Relic - Totem');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','45927','Summon Friend');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','61437','Opening');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','76272','Armor Skills');
insert into `playercreateinfo_spell` (`race`, `class`, `Spell`, `Note`) values('6','7','76296','Weapon Skills');

delete from `playercreateinfo_action` WHERE race = 6 AND class = 7;

insert into `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) values('6','7','0','403','0');
insert into `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) values('6','7','9','20549','0');
insert into `playercreateinfo_action` (`race`, `class`, `button`, `action`, `type`) values('6','7','75','20549','0');

delete from `playercreateinfo_spell_custom` WHERE racemask = 6 AND classmask = 7;
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','81','Dodge','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','107','Block','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','131',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','198','One-Handed Maces','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','203','Unarmed','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','204','Defense','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','227','Staves','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','331','Healing Wave','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','403','Lightning Bolt','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','421',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','522','SPELLDEFENSE(DND)','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','526',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','546',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','556',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','669','Language Orcish','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','670','Language Taurahe','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2062',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2382','Generic','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2479','Honorless Target','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2484',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2645',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2825',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2870',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','2894',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','3050','Detect','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','3365','Opening','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','3738',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6196',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6233','Closing','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6246','Closing','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6247','Opening','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6477','Opening','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6478','Opening','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6495',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','6603','Attack','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','7266','Duel','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','7267','Grovel','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','7355','Stuck','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8012',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8143',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8166',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8170',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8177',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8386','Attacking','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','8737','Mail','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','9077','Leather','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','9078','Cloth','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','9116','Shield','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','9125','Generic','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20549','War Stomp','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20550','Endurance','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20551','Nature Resistance','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20552','Cultivation','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20608',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','20777',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','21651','Opening','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','21652','Closing','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','22027','Remove Insignia','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','22810','Opening - No Text','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25359',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25396',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25420',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25423',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25442',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25449',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25454',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25457',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25464',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25472',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25485',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25489',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25500',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25505',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25509',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25525',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25528',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25533',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25547',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25552',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25557',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25560',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25563',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25567',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25570',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25574',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25577',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25587',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','25908',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','27763','Totem','1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','33736',NULL,'1');
insert into `playercreateinfo_spell_custom` (`racemask`, `classmask`, `Spell`, `Note`, `Active`) values('6','7','36936',NULL,'1');


DELETE FROM `achievement_criteria_data` WHERE `criteria_id` BETWEEN 16214 AND 16226;
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`) VALUES 
('16214', '1', '49779'),
('16215', '1', '48630'),
('16216', '1', '50419'),
('16217', '1', '48706'),
('16218', '1', '50496'),
('16219', '1', '50491'),
('16220', '1', '48686'),
('16221', '1', '50481'),
('16222', '1', '48848'),
('16223', '1', '47682'),
('16224', '1', '48802'),
('16225', '1', '47667'),
('16226', '1', '48683');



DELETE FROM `gossip_menu_option` WHERE `menu_id`=10490;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('10490', '0', '0', 'Ancient Onu, where may I find a Seed of the Earth?', '1', '1', '10492', '0',  '0', '0', NULL);

DELETE FROM `gossip_menu` WHERE `entry` IN (10490,10492);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
('10490', '14517'),
('10492', '14518');

UPDATE `creature_template` SET `gossip_menu_id`='10490',`npcflag` = `npcflag`|'1',`AIName` = 'SmartAI' WHERE `entry`='33072';

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33072;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33072,0,0,0,62,0,100,0,10490,0,0,0,85,65154,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Onu - On gossip option select - Cast Create Seed of Earth');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=10490;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10490,0,0,9,13882,0,0,0,'','Show gossip 10490 if player has Quest 13882');

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry`=34306;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=34306;
INSERT INTO `npc_spellclick_spells` VALUES
(34306,65125,1,3),
(34306,65127,1,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=64306 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,64306,18,0,2,33206,0,0,'Call Withered Ent must hit dead Darkscale Scout');

DELETE FROM conditions WHERE SourceEntry=45911 AND SourceTypeOrReferenceId=18;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=33206;
DELETE FROM `smart_scripts` WHERE `entryorguid`=33206 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33206,0,0,0,8,0,100,1,64306,0,0,0,33,34010,0,0,0,0,0,7,0,0,0,0,0,0,0,'Darkscale Scout - On SpellHit - Kill Credit');


REPLACE INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(65127,0,0,18,0,0,0,0,0,0,0);

DELETE FROM `gameobject` WHERE `id`=195021;
INSERT INTO `gameobject`(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(NULL,195021,1,1,1,4851.218,519.6476,2.057607,5.131269,0,0,-0.5446386,0.8386708,60,100,1),
(NULL,195021,1,1,1,4910.695,608.5903,-2.852983,5.131269,0,0,-0.5446386,0.8386708,60,100,1),
(NULL,195021,1,1,1,4808.587,556.342,-0.256296,5.131269,0,0,-0.5446386,0.8386708,60,100,1),
(NULL,195021,1,1,1,4815.939,636.1059,-1.980851,5.131269,0,0,-0.5446386,0.8386708,60,100,1),
(NULL,195021,1,1,1,4948.48,679.0243,-13.81849,2.059488,0,0,0.8571672,0.5150382,60,100,1),
(NULL,195021,1,1,1,4757.76,574.2257,0.690481,3.525572,0,0,-0.9816265,0.1908124,60,100,1),
(NULL,195021,1,1,1,4778.524,519.8646,6.181726,4.834563,0,0,-0.6626196,0.7489561,60,100,1),
(NULL,195021,1,1,1,4967.363,514.0035,6.102762,6.0912,0,0,-0.09584522,0.9953963,60,100,1),
(NULL,195021,1,1,1,5015.964,560.9097,1.225466,5.899214,0,0,-0.1908083,0.9816273,60,100,1),
(NULL,195021,1,1,1,4543.027,673.5035,4.871236,4.694937,0,0,-0.7132502,0.7009096,60,100,1),
(NULL,195021,1,1,1,4643.992,696.3611,5.8778,0.3665176,0,0,0.1822348,0.983255,60,100,1),
(NULL,195021,1,1,1,4631.862,733.9583,-2.002156,5.131269,0,0,-0.5446386,0.8386708,60,100,1);

delete from `gameobject_loot_template` WHERE `entry`=27237;
insert into `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `lootmode`, `groupid`, `mincountOrRef`, `maxcount`) values
('27237','46356','-100','1','0','1','1');

UPDATE `creature` SET `MovementType`=1,`spawndist`=15 WHERE `id`=34306;

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10278,10272,10277,10279);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
('10272', '0', '0', 'Coax Thundris Windweaver''s spirit.', '1', '1', '0', '0', '0', '0', NULL),
('10278', '0', '0', 'Coax Taldan''s corpse to give up its spirit.', '1', '1', '0', '0', '0',  '0', NULL),
('10277', '0', '0', 'Coax the spirit out of Sentinel Elissa Starbreeze''s corpse.', '1', '1', '0', '0', '0',  '0', NULL),
('10279', '0', '0', 'Coax the spirit out of Caylais Moonfeather''s still corpse.', '1', '1', '0', '0', '0', '0', NULL);

DELETE FROM `npc_text` WHERE `ID` in (14264,14275,14274,14276);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`) VALUES 
(14264, 'Thundris Windweaver''s corpse lays sprawled out here, the apparent victim of the Twilight''s Hammer''s machinations.', '',0,1,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0),
(14275, 'Here''s where Taldan served his last drink.', '',0,1,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0),
(14274, 'The sentinel''s body rests here, the apparent victim of the elemental onslaught that has overtaken the town.', '',0,1,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0),
(14276, 'Far too powerful for these elementals, Caylais and her hippogryphs must have been struck down by something else.', '',0,1,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0, '', '',0,0,0,0,0,0,0,0);

DELETE FROM `gossip_menu` WHERE `entry` IN (10278,10272,10277,10279);
INSERT INTO `gossip_menu` (`entry`, `text_id`) VALUES 
('10272', '14264'),
('10278', '14275'),
('10277', '14274'),
('10279', '14276');

UPDATE `creature_template` SET `gossip_menu_id`='10272',`npcflag` = '1',`AIName` = 'SmartAI' WHERE `entry`='33001';
UPDATE `creature_template` SET `gossip_menu_id`='10278',`npcflag` = '1',`AIName` = 'SmartAI' WHERE `entry`='33035';
UPDATE `creature_template` SET `gossip_menu_id`='10277',`npcflag` = '1',`AIName` = 'SmartAI' WHERE `entry`='33033';
UPDATE `creature_template` SET `gossip_menu_id`='10279',`npcflag` = '1',`AIName` = 'SmartAI' WHERE `entry`='33037';
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry`='6887';

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33001;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33001,0,0,0,62,0,100,0,10272,0,0,0,85,62094,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Thundris Windweaver - On gossip option select - Cast Coaxing the Spirits: Thundris Windweaver''s spirit 1'),
(33001,0,1,0,62,0,100,0,10272,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Thundris Windweaver - On gossip option select - Close gossip window');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33035;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33035,0,0,0,62,0,100,0,10278,0,0,0,85,62153,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Taldan - On gossip option select - Cast Coaxing the Spirits: Taldan''s spirit 1'),
(33035,0,1,0,62,0,100,0,10278,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Taldan - On gossip option select - Close gossip window');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33037;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33037,0,0,0,62,0,100,0,10279,0,0,0,85,62156,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Caylais Moonfeather  - On gossip option select - Cast Coaxing the Spirits: Caylais Moonfeather''s spirit 1'),
(33037,0,1,0,62,0,100,0,10279,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Caylais Moonfeather  - On gossip option select - Close gossip window');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=33033;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(33033,0,0,0,62,0,100,0,10277,0,0,0,85,62150,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Sentinel Elissa Starbreeze - On gossip option select - Cast Coaxing the Spirits: Sentinel Elissa Starbreeze''s spirit 1'),
(33033,0,1,0,62,0,100,0,10277,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Sentinel Elissa Starbreeze - On gossip option select - Close gossip window');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup` IN (10278,10272,10277,10279);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,10272,0,0,9,13547,0,0,0,'','Show gossip 10272 if player has Quest 13547'),
(15,10278,0,0,9,13547,0,0,0,'','Show gossip 10278 if player has Quest 13547'),
(15,10277,0,0,9,13547,0,0,0,'','Show gossip 10277 if player has Quest 13547'),
(15,10279,0,0,9,13547,0,0,0,'','Show gossip 10279 if player has Quest 13547');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=6887;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(6887,0,0,0,20,0,100,0,13547,0,0,0,41,0,0,0,0,0,0,19,33038,10,0,0,0,0,0, 'Yalda - On quest complete - Despawn sprits'),
(6887,0,1,0,20,0,100,0,13547,0,0,0,41,0,0,0,0,0,0,19,33034,10,0,0,0,0,0, 'Yalda - On quest complete - Despawn sprits'),
(6887,0,2,0,20,0,100,0,13547,0,0,0,41,0,0,0,0,0,0,19,33036,10,0,0,0,0,0, 'Yalda - On quest complete - Despawn sprits'),
(6887,0,3,0,20,0,100,0,13547,0,0,0,41,0,0,0,0,0,0,19,33002,10,0,0,0,0,0, 'Yalda - On quest complete - Despawn sprits');


DELETE FROM `creature` WHERE `id` IN (33001,33035,33033,33037);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL,33001,1,1,1,0,0,6545.417,476.1719,5.202001,3.385939,120,0,0,1,0,0,0,0,0),
(NULL,33035,1,1,1,0,0,6417.681,525.25,24.14691,4.817109,120,0,0,1,0,0,0,0,0),
(NULL,33033,1,1,1,0,0,6438.566,368.0104,3.133064,2.199115,120,0,0,1,0,0,0,0,0),
(NULL,33037,1,1,1,0,0,6328.09,552.9063,13.73173,3.106686,120,0,0,1,0,0,0,0,0);

DELETE FROM `creature_template_addon` WHERE `entry` IN (33001,33035,33033,33037); 
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(33001,0,0,7,0,65, NULL),
(33035,0,0,7,0,65, NULL),
(33033,0,0,7,0,65, NULL),
(33037,0,0,7,0,65, NULL);

-- Some NPC's spawn fixes
DELETE FROM creature WHERE id IN (36056);
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana,  MovementType, npcflag, unit_flags, dynamicflags) VALUES
(36056, 1, 1, 1, 4860, 36056, -1050.29, 1612.84, 60.255, 6.19592, 600, 0, 0, 1220, 0, 0, 0, 0, 0);


DELETE FROM `creature` WHERE `id` in (1164,1197);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL,1164,0,1,1,0,1,-5558.792,-2988.115,342.2309,2.635447,120,5,0,1,0,1,0,1,0),
(NULL,1164,0,1,1,0,1,-5576.539,-2909.421,365.5653,2.409149,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5579.86,-2960.23,346.5733,4.363323,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5584.349,-2974.787,346.0908,4.293977,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5599.218,-3009.425,347.8498,4.399914,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5632.53,-2945.57,367.5334,6.230816,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5647.11,-2982.02,350.6183,3.193953,120,5,0,1,0,1,0,0,0),
(NULL,1164,0,1,1,0,1,-5721.891,-2898.884,366.8198,2.822381,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5607.16,-2976.6,347.8153,2.9147,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5611.139,-2911.149,361.8596,0.5263825,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5621.322,-2979.183,347.6213,3.276958,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5668.745,-2988.925,354.4633,1.609986,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5682.7,-2969.38,367.5453,2.408554,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5707.66,-2936.08,366.0883,2.70526,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5719.457,-2921.108,366.0049,1.557203,120,5,0,1,0,1,0,0,0),
(NULL,1197,0,1,1,0,1,-5746.38,-2935.64,366.0049,1.11659,120,5,0,1,0,1,0,0,0);
UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry`=42339;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=42339;
INSERT INTO `npc_spellclick_spells` VALUES
(42339,78975,1,3),
(42339,78974,1,0);

-- Set proper drop chance for some items
DELETE FROM creature_loot_template Where item = 21377;
INSERT INTO creature_loot_template VALUES
(7153, 21377, -25, 1, 0, 1, 1),
(7154, 21377, -24, 1, 0, 1, 1),
(7155, 21377, -23, 1, 0, 1, 1),
(7156, 21377, -47, 1, 0, 1, 1),
(7157, 21377, -47, 1, 0, 1, 1),
(7158, 21377, -47, 1, 0, 1, 1),
(9462, 21377, -26, 1, 0, 1, 1),
(9464, 21377, -47, 1, 0, 1, 1),
(14342, 21377, -6, 1, 0, 1, 1);

UPDATE creature_loot_template SET ChanceOrQuestChance = 9 WHERE entry = 14523 AND item = 13140;
UPDATE creature_loot_template SET ChanceOrQuestChance = 87 WHERE entry = 10648 AND item = 11668;
UPDATE creature_loot_template SET ChanceOrQuestChance = 1 WHERE item = 20742 AND entry IN (10738,10916,7438,7439,7440,7441,7442);

-- Delete old quests from database
DELETE FROM creature_involvedrelation WHERE id = 3140 AND quest = 786;
DELETE FROM creature_questrelation WHERE id = 3140 AND quest = 786;
DELETE FROM creature_questrelation WHERE quest IN (298,301,302,273,454,281);
DELETE FROM creature_involvedrelation WHERE quest IN (298,301,302,273,454,281);
DELETE FROM gameobject_questrelation WHERE quest = 4449;
DELETE FROM gameobject_involvedrelation WHERE quest = 4449;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=6508;
DELETE FROM `smart_scripts` WHERE `entryorguid`=6508 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(6508,0,0,0,0,0,100,0,30000,60000,30000,60000,11,14792,2,0,0,0,0,2,0,0,0,0,0,0,0,'Venomhide Ravasaur - IC - Cast spell Venomhide Poison');

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id`=41768;
UPDATE `creature_template` SET `unit_flags`=`unit_flags`|4 WHERE `entry`=41768;

UPDATE quest_template SET Method=2 WHERE id IN(14069,14070,14071,14122);
DELETE FROM quest_template WHERE id IN(28606,28607,14114);
DELETE FROM creature_involvedrelation WHERE quest IN(28606,28607);


DELETE FROM `creature_template_addon` WHERE `entry`=41671;
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(41671,0,0,8,0,430, NULL);

DELETE FROM creature_addon WHERE guid IN (SELECT `guid` FROM `creature` WHERE `id`=41671);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=41671;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41671 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41671*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41671,0,0,0,8,0,100,0,77819,0,0,0,80,41671*100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Trapped Miner - On SpellHit - run script'),
(41671*100,9,0,0,0,0,100,0,1000,1000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Stand'),
(41671*100,9,1,0,0,0,100,0,1000,1000,0,0,17,26,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Remove all emotes'),
(41671*100,9,2,0,0,0,100,0,1000,1000,0,0,5,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Bow'),
(41671*100,9,3,0,0,0,100,0,1000,1000,0,0,33,41671,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Trapped Miner - Script - Kill Credit'),
(41671*100,9,4,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Say'),	
(41671*100,9,5,0,0,0,100,0,1000,1000,0,0,11,83889,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Cast Cosmetic Hearthstone'),
(41671*100,9,6,0,0,0,100,0,1000,1000,0,0,41,4500,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Trapped Miner - Script - Despawn');

DELETE FROM `creature_text` WHERE `entry`=41671;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(41671,0,0,'I can''t wait to get home to my family. Thank you, stranger.',0,0,100,0,0,0,'Trapped Miner'),
(41671,0,1,'I thought I would die down here.',0,0,100,0,0,0,'Trapped Miner'),
(41671,0,2,'I thought they were going to tear me apart!',0,0,100,0,0,0,'Trapped Miner'),
(41671,0,3,'Light bless you, stranger. You''ve saved me!',0,0,100,0,0,0,'Trapped Miner'),
(41671,0,4,'Thank you!',0,0,100,0,0,0,'Trapped Miner'),
(41671,0,5,'You''re the best thing I''ve seen since the troggs showed up!',0,0,100,0,0,0,'Trapped Miner');

REPLACE INTO `spell_scripts`(`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`)VALUES
(78974,0,0,18,0,0,0,0,0,0,0);

DELETE FROM `gameobject` WHERE `id`=204345;
insert into `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) values
(NULL,'204345','0','1','1','-9459.37','-1902.44','82.4646','4.2038','0','0','0.862249','-0.506484','300','100','1');

-- Fix for quest Rock Lobster (by Bastek)
DELETE FROM gameobject WHERE id = 204284;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(204284, 0, 1, 1, -8344.98, 1346.31, -49.9491, 1.67832, 0, 0, 0.744081, 0.668089, 120, 0, 1),
(204284, 0, 1, 1, -8398.22, 1373.04, -58.181, 1.02251, 0, 0, 0.489271, 0.872132, 120, 0, 1),
(204284, 0, 1, 1, -8432.17, 1337.68, -54.3599, 1.56836, 0, 0, 0.706243, 0.707969, 120, 0, 1),
(204284, 0, 1, 1, -8433.11, 1312.43, -53.5845, 1.6744, 0, 0, 0.742771, 0.669545, 120, 0, 1),
(204284, 0, 1, 1, -8477.2, 1374.94, -65.991, 6.24149, 0, 0, 0.0208472, -0.999783, 120, 0, 1),
(204284, 0, 1, 1, -8433.12, 1380.48, -62.4973, 4.37223, 0, 0, 0.81659, -0.577217, 120, 0, 1);

DELETE FROM gameobject_loot_template WHERE entry = 204284;
INSERT INTO gameobject_loot_template VALUES
(204284, 58809, -100, 1, 0, 1, 1);

UPDATE gameobject_template SET castBarCaption = 'Collecting', faction = 35, data0 = 1691, data14 = 19676 WHERE entry = 204284;

-- Kroum
UPDATE creature_template SET minlevel = 85,maxlevel = 85 WHERE entry = 36728;
DELETE FROM creature WHERE id = 36728;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(36728,1,1,1,0,0,2990.2,-4164.109,101.4216,0.8377581,120,0,0,1,0,0,0,0,0);
-- Valormok Grunt
UPDATE creature_template SET minlevel = 19,maxlevel = 20 WHERE entry = 36815;
DELETE FROM creature WHERE id = 36815;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(36815,1,1,1,0,0,2924.523,-4137.929,101.0537,2.949606,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2991.527,-4217.135,97.41331,4.118977,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2982.563,-4057.266,100.9007,1.727876,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2964.362,-4206.807,98.48338,5.826658,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2960.394,-4062.658,103.195,2.268928,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2950.682,-4093.368,103.9977,2.75762,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2940.821,-4114.222,104.4351,2.356194,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2936.291,-4164.899,100.8526,3.263766,120,0,0,1,0,0,0,0,0),
(36815,1,1,1,0,0,2935.081,-4166.321,100.9208,2.176859,120,0,0,1,0,0,0,0,0);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=41251;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41251 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=41251*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(41251,0,0,0,8,0,100,1,93773,0,0,0,80,41251*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Frostmane Builder - On SpellHit - run script'),
(41251,0,1,0,8,0,100,1,93773,0,0,0,33,50606,0,0,0,0,0,7,0,0,0,0,0,0,0,'Frostmane Builder - On SpellHit - kill credit'),
(41251*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostmane Builder - Script - say'),
(41251*100,9,1,0,0,0,100,0,1000,1000,0,0,89,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostmane Builder - Script - random move'),
(41251*100,9,2,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Frostmane Builder - Script - say'),
(41251*100,9,3,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Frostmane Builder - Script - Despawn');

DELETE FROM `creature_text` WHERE `entry`=41251;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(41251,0,0,'Can''t... lift... tools...',0,0,100,0,0,0,'Frostmane Builder'),
(41251,0,1,'No make me small!',0,0,100,0,0,0,'Frostmane Builder'),
(41251,0,2,'What you do to me?',0,0,100,0,0,0,'Frostmane Builder'),
(41251,0,3,'Why everyone else get so big?',0,0,100,0,0,0,'Frostmane Builder'),
(41251,1,0,'Take curse away!',0,0,100,0,0,0,'Frostmane Builder');

UPDATE `creature` SET `MovementType`=0,`spawndist`=0 WHERE `id`=41251;

UPDATE `creature_template` SET `KillCredit1`=1161 WHERE `entry`=1162;


DELETE FROM gameobject WHERE id = 202652;
INSERT INTO gameobject (id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(202652, 1, 1, 1, 5487.32, -2337.84, 1461.96, 0.313166, 0, 0, 0.155944, 0.987766, 300, 0, 1),
(202652, 1, 1, 1, 5467.66, -2339.42, 1462.91, 5.20227, 0, 0, 0.514528, -0.857474, 300, 0, 1),
(202652, 1, 1, 1, 5465.97, -2300.35, 1461, 6.19973, 0, 0, 0.0417175, -0.999129, 300, 0, 1),
(202652, 1, 1, 1, 5435.08, -2299.22, 1459.11, 6.01908, 0, 0, 0.131667, -0.991294, 300, 0, 1),
(202652, 1, 1, 1, 5439.29, -2283.31, 1457.43, 5.54392, 0, 0, 0.361274, -0.93246, 300, 0, 1),
(202652, 1, 1, 1, 5421.58, -2274.86, 1451.27, 0.15216, 0, 0, 0.0760065, 0.997107, 300, 0, 1),
(202652, 1, 1, 1, 5372.44, -2297.85, 1443.97, 6.24685, 0, 0, 0.0181666, -0.999835, 300, 0, 1),
(202652, 1, 1, 1, 5331.68, -2303.28, 1438.02, 0.407415, 0, 0, 0.202302, 0.979323, 300, 0, 1),
(202652, 1, 1, 1, 5307.54, -2303.29, 1434.69, 5.94055, 0, 0, 0.170482, -0.985361, 300, 0, 1),
(202652, 1, 1, 1, 5286, -2333.2, 1433.85, 0.756921, 0, 0, 0.369491, 0.929235, 300, 0, 1);

DELETE FROM creature_loot_template WHERE entry = 39436 AND item = 52568;
INSERT INTO creature_loot_template VALUES 
(39436, 52568, -1, 1, 0, 3, 3);

DELETE FROM creature_loot_template WHERE entry = 39438 AND item = 52568;
INSERT INTO creature_loot_template VALUES 
(39438, 52568, -1, 1, 0, 3, 3);


-- Fix for quest Lightning in a Bottle
UPDATE quest_template SET ObjectiveText1 = 'Charged Condenser Jar' WHERE id = 25355;
DELETE FROM gameobject WHERE id = 202731;
INSERT INTO gameobject (id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(202731, 1, 1, 1, 5099.75, -2395.26, 1425.51, 1.2423, 0, 0, 0.581972, 0.813209, 300, 0, 1),
(202731, 1, 1, 1, 5067.42, -2280.54, 1401.86, 3.36759, 0, 0, 0.993623, -0.112758, 300, 0, 1),
(202731, 1, 1, 1, 5104.58, -2229.06, 1388.05, 3.48383, 0, 0, 0.985395, -0.170283, 300, 0, 1),
(202731, 1, 1, 1, 5042.96, -2165.66, 1386.98, 0.193009, 0, 0, 0.0963547, 0.995347, 300, 0, 1),
(202731, 1, 1, 1, 5070.87, -2128.11, 1375.32, 0.0249324, 0, 0, 0.0124659, 0.999922, 300, 0, 1),
(202731, 1, 1, 1, 5071.25, -2070.32, 1369.55, 4.06973, 0, 0, 0.894238, -0.447592, 300, 0, 1),
(202731, 1, 1, 1, 5124.61, -2054.12, 1366.39, 3.0872, 0, 0, 0.99963, 0.0271935, 300, 0, 1),
(202731, 1, 1, 1, 5292.42, -1899.74, 1346.4, 4.50091, 0, 0, 0.777788, -0.628527, 300, 0, 1);

-- NPC Gek Nozzlerocket added to Eastern Plaguelands
DELETE FROM creature WHERE id = 48704;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana,  MovementType, npcflag, unit_flags, dynamicflags) VALUES
(48704, 0, 1, 1, 36238, 48704, 2278.15, -5259.87, 81.6873, 4.72984, 600, 0, 0, 1848, 0, 0, 0, 0, 0);

update `creature_template` set `spell1`=62246,`spell2`=63996,`VehicleId`=50,`minlevel`=20,`maxlevel`=20 where `entry`=32851;

UPDATE `creature_template` SET `npcflag`=`npcflag`|0x1000000 WHERE `entry` in (32851,43742);
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` in (32851,43742);
INSERT INTO `npc_spellclick_spells` VALUES
(43742,64602,1,2),
(32851,98843,1,1);

UPDATE `creature_template` SET `ScriptName`='npc_shattertusk_trigger',`unit_flags`=0,`flags_extra`=130 WHERE `entry`=33913;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceID`=13 AND `SourceEntry`=63996 AND `SourceGroup`=0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ConditionTypeOrReference`,`elseGroup`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`Comment`) VALUES
(13,0,63996,18,0,1,33913,0,0,'');

DELETE FROM `creature` WHERE `id` in (11196,10919);

-- Officer Jankie
DELETE FROM creature WHERE id = 36410;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(36410,1,1,1,0,0,174.066,1794.819,86.32273,1.082104,120,0,0,1,0,0,0,0,0);
UPDATE creature_template SET npcflag = 2, minlevel = 45, maxlevel = 45 WHERE entry = 36410;
-- Jankie's Mount
DELETE FROM creature WHERE id = 36416;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(36416,1,1,1,0,0,171.2066,1793.292,86.31238,0.9773844,120,0,0,1,0,0,0,0,0);
UPDATE creature_template SET minlevel = 40, maxlevel = 40 WHERE entry = 36416;

DELETE FROM `spell_proc_event` WHERE `entry`=89086;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `procFlags`, `CustomChance`) VALUES (89086, 1, 340, 3);
DELETE FROM `spell_proc_event` WHERE `entry`=89088;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `procFlags`, `Cooldown`) VALUES (89088, 126, 65792, 45);

DELETE FROM `gameobject` WHERE `id`=194105;
REPLACE INTO `gameobject`(`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(412001,194105,1,1,1,7376.342,-425.0824,2.099702,4.607672,0,0,-0.743144,0.6691315,60,100,1);

DELETE FROM `gameobject_questrelation` WHERE `id`=194105 AND `quest`=13527;
REPLACE INTO `gameobject_questrelation`(`id`,`quest`)VALUES
(194105,13527);

DELETE FROM `gameobject_questrelation` WHERE `id`=194105 AND `quest`=13521;
REPLACE INTO `gameobject_involvedrelation`(`id`,`quest`)VALUES
(194105,13521);

DELETE FROM `creature` WHERE `id`=32972;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL,32972,1,1,1,0,0,7447.6,-267.3907,12.73817,1.481029,120,0,0,1,0,0,0,0,0);

UPDATE `creature` SET `spawntimesecs` = '30' WHERE id = 33024;
DELETE FROM `spell_scripts` WHERE `id` = '86264' AND `command` = '18';
INSERT INTO `spell_scripts` (`id`, `command`, `datalong`) VALUES ('86264', '18', '1000');
DELETE FROM `conditions` WHERE `SourceEntry` = 86264 AND `ConditionValue1` = '46268';
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceEntry`, `ConditionTypeOrReference`, `ConditionValue1`) VALUES ('17', '86264', '19', '46268');

-- Add quest relation to GO at Loch Modan (by Bastek)
DELETE FROM gameobject_questrelation WHERE id IN (194387,194378,194388,194389,194391,194390);
INSERT INTO gameobject_questrelation VALUES
(194387, 13656), -- Explorers' League Document (1 of 6)
(194378, 13655), -- Explorers' League Document (2 of 6)
(194388, 13657), -- Explorers' League Document (3 of 6)
(194389, 13658), -- Explorers' League Document (4 of 6)
(194391, 13660), -- Explorers' League Document (5 of 6)
(194390, 13659); -- Explorers' League Document (6 of 6)


DELETE FROM gameobject WHERE id IN (195042, 195080);
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(195042, 1, 1, 1, 4680.752, 670.2813, 5.874341, 6.143561, 0, 0, -0.06975555, 0.9975641, 300, 0, 1),
(195042, 1, 1, 1, 4592.535, 713.4514, 0.307507, 2.862335, 0, 0, 0.9902678, 0.1391754, 300, 0, 1),
(195080, 1, 1, 1, 4723.093, 714.9028, -0.025332, 0, 0, 0, 0, 0, 300, 0, 1),
(195080, 1, 1, 1, 4756.054, 748.3386, -0.025576, 0, 0, 0, 0, 0, 300, 0, 1),
(195080, 1, 1, 1, 4704.289, 755.5052, 0.012387, 0, 0, 0, 0, 0, 300, 0, 1),
(195080, 1, 1, 1, 4624.233, 745.0521, 0.052223, 0, 0, 0, 0, 0, 300, 0, 1),
(195080, 1, 1, 1, 4775.91, 668.684, -0.0141, 0.3665176, 0, 0, 0.1822348, 0.983255, 300, 0, 1),
(195080, 1, 1, 1, 4508.93, 751.007, 0.00246328, 4.41713, 0, 0, 0.803427, -0.595404, 300, 0, 1),
(195080, 1, 1, 1, 4779.905, 600.7101, 0.019505, 0, 0, 0, 0, 0, 300, 0, 1),
(195080, 1, 1, 1, 4723.093, 714.9028, -0.025332, 0, 0, 0, 0, 0, 300, 0, 1);

DELETE FROM gameobject_loot_template WHERE entry IN (195042, 195080);
INSERT INTO gameobject_loot_template VALUES
(195042, 46384, -100, 1, 0, 1, 1),
(195080, 46384, -100, 1, 0, 1, 1);

DELETE FROM gameobject WHERE id = 203247;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(203247, 0, 1, 1, -3846.27, -825.721, -6.51973, 4.136433, 0, 0, -0.8788166, 0.4771597, 300, 0, 1);

DELETE FROM gameobject_loot_template WHERE entry = 203247;
INSERT INTO gameobject_loot_template VALUES
(203247, 56031, -100, 1, 0, 1, 1);

-- Proper spawn for Sigrun Ironhew
DELETE FROM creature WHERE id = 2860;
INSERT INTO creature (id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags) VALUES
(2860,0,1,1,0,0,-6610.99,-3421.93,279.3604,2.478368,120,0,0,1,0,0,0,0,0);

-- Delete old NPC's from database (by Bastek)
DELETE FROM creature WHERE id = 3207; -- Hexed Troll
DELETE FROM creature WHERE id = 1224; -- Young Threshadon
DELETE FROM creature WHERE guid IN (6475,6473,8435,7913,7357,7911); -- Bloodtalon taillasher
DELETE FROM creature WHERE id IN (1194,1191,1188,1192); -- Loch Modan NPC's
DELETE FROM creature WHERE id IN (1163,1164,1166,1197); -- Stonesplinter's w Loch Modan
DELETE FROM creature WHERE id = 1193; -- Loch Frenzy w Loch Modan
DELETE FROM creature WHERE id IN (1180,1179,1183,1178,1181,1210); -- Mo'grosh w Loch Modan
DELETE FROM creature WHERE id = 2187; -- Elder Darkshore Thresher
DELETE FROM creature WHERE id = 11863; -- Azore Aldamort is no longer in game

-- Set proper spawn time for Stolen Hyjal Egg (by Bastek)
UPDATE gameobject SET spawntimesecs = 300 WHERE id = 203143;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=42553;
DELETE FROM `smart_scripts` WHERE `entryorguid`=42553;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(42553,0,0,0,20,0,100,0,26800,0,0,0,41,0,0,0,0,0,0,19,42598,0,0,0,0,0,0, 'Engineer Grindspark - On Quest Rewarded - Despawn GS-9x Multi-Bot');

-- NPC added Overseer Oilfist <The Thorium Brotherhood>
DELETE FROM creature WHERE id = 14625;
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana,  MovementType, npcflag, unit_flags, dynamicflags) VALUES
(14625, 0, 1, 1, 14653, 0, -6501.13, -1173.36, 325.947, 2.30383, 500, 0, 4120, 0, 0, 0, 0, 0, 0);

DELETE FROM creature WHERE guid=80644;
DELETE FROM quest_template WHERE id=93;

DELETE FROM creature_loot_template WHERE item=6443;
INSERT INTO creature_loot_template VALUES
('3637','6443', '-37', '1', '0', '1' ,'1'),
('8886','6443', '-36', '1', '0', '1' ,'1'),
('3636','6443', '-35', '1', '0', '1' ,'1'),
('5053','6443', '-28', '1', '0', '1' ,'1'),
('5755','6443', '-27', '1', '0', '1' ,'1'),
('5048','6443', '-21', '1', '0', '1' ,'1'),
('5761','6443', '-16', '1', '0', '1' ,'1'),
('5762','6443', '-10', '1', '0', '1' ,'1'),
('5056','6443', '-6', '1', '0', '1' ,'1'),
('5756','6443', '-5', '1', '0', '1' ,'1'),
('3631','6443', '-3', '1', '0', '1' ,'1'),
('3641','6443', '-3', '1', '0', '1' ,'1'),
('3633','6443', '-2', '1', '0', '1' ,'1'),
('3634','6443', '-2', '1', '0', '1' ,'1'),
('3630','6443', '-1.9', '1', '0', '1' ,'1'),
('3632','6443', '-1.8', '1', '0', '1' ,'1'),
('20797','6443', '-0.7', '1', '0', '1' ,'1');

UPDATE creature_template SET npcflag=16777216 WHERE entry=50047;
DELETE FROM creature WHERE guid IN(311609,5010);
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=11443;
DELETE FROM `smart_scripts` WHERE `entryorguid`=11443 AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=11443*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(11443,0,0,0,8,0,100,0,74415,0,0,0,80,11443*100,0,2,0,0,0,1,0,0,0,0,0,0,0,'Gordok Ogre-Mage - On SpellHit - run script'),
(11443,0,1,0,2,0,100,1,29,30,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gordok Ogre-Mage - On 30%hp - emote'),
(11443*100,9,0,0,2,0,100,1,29,30,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Gordok Ogre-Mage - Script - yell'),
(11443*100,9,1,0,2,0,100,1,29,30,0,0,11,83976,2,0,0,0,0,1,0,0,0,0,0,0,0,'Gordok Ogre-Mage - Script - Shrink'),
(11443*100,9,2,0,0,0,100,0,1000,1000,0,0,33,39845,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Gordok Ogre-Mage - Script - Kill credit'),
(11443*100,9,3,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Gordok Ogre-Mage - Script - Despawn');

DELETE FROM `creature_text` WHERE `entry`=11443;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(11443,0,0,'Noooooooooooooooo!',1,0,100,0,0,0,'Gordok Ogre-Mage'),
(11443,1,0,'%s is weak enought to capture.',2,0,100,0,0,0,'Gordok Ogre-Mage');

-- The Rod of Lianthe drop fix (by Bastek)
DELETE FROM creature_loot_template WHERE entry IN (19792, 19796, 19806) AND item = 31316;
INSERT INTO creature_loot_template VALUES
(19792, 31316, -6, 1, 0, 1, 1),
(19796, 31316, -6, 1, 0, 1, 1),
(19806, 31316, -5, 1, 0, 1, 1);

SET @ENTRY :=45199;
UPDATE `creature_template` SET `AIName`='SmartAI',`RegenHealth`=0 WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@ENTRY;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,11,0,100,0,0,0,0,0,99,10,50,0,0,0,0,1,0,0,0,0,0,0,0, 'Wounded Brave Watcher - On respawn - Change hp'),
(@ENTRY,0,1,0,8,0,100,0,774,0,0,0,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Wounded Brave Watcher - On spell hit - Quest credit');

-- Another fix for proper spawns
DELETE FROM creature WHERE id IN (2766,3411,3995,12816,11821,2771);
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(2766, 0, 1, 1, 610, 0, -2117.71, -2010.82, 6.29982, 2.91768, 400, 0, 0, 1678, 0,  0, 0, 0, 0),
(3411, 1, 1, 1, 4357, 3411, -182.988, -348.691, 8.5921, 4.74729, 600, 0, 0, 713, 0,  0, 0, 0, 0),
(3995, 1, 1, 1, 4104, 0, -272.48, -394.084, 17.2051, 6.19592, 600, 0, 0, 713, 0, 0, 0,  0, 0),
(12816, 1, 1, 1, 12709, 12816, -177.568, -233.317, 8.87961, 5.84685, 600, 0, 0, 713, 0, 0,  0, 0, 0),
(11821, 1, 1, 1, 11751, 11821, 158.443, 71.4323, 48.7988, 3.17976, 600, 0, 0, 1003, 0, 0,  0, 0, 0),
(2771, 0, 1, 1, 4045, 2771, -947.488, -3539.4, 71.0106, 0.453786, 400, 0, 0, 1003, 0, 0,  0, 0, 0);

DELETE FROM `creature_questrelation` WHERE `quest`=310;
DELETE FROM `creature_involvedrelation` WHERE `quest`=310;


UPDATE `creature_template` SET `KillCredit1`=38358 WHERE `entry` IN (6510,6511,6509,6512);

-- Makes Mohawk Grenade unique (by Bastek)
UPDATE item_template SET maxcount = 1 WHERE entry = 43489;

UPDATE creature_template SET ScriptName='npc_crate_mine' WHERE entry=42500;

DELETE FROM gameobject WHERE id=3001672;
INSERT INTO `gameobject` (`id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
('3001672','0','1','1','-9842.87','1395.26','37.4207','3.34131','0','0','0.995018','-0.0996913','300','0','1');

UPDATE creature_template SET ScriptName='npc_thug' WHERE entry=42562;

DELETE FROM creature WHERE guid IN(305227,305784,305923,304853,62836,89773,305936,304861,253361);

UPDATE creature_template_addon SET auras ='54503 0 81238 0' WHERE entry = 42560;
UPDATE creature_template_addon SET auras ='54503 0 68442 0' WHERE entry = 42558;
UPDATE creature_template_addon SET auras ='81238 0' WHERE entry = 238;
UPDATE creature_template_addon SET auras ='81238 0' WHERE entry = 582;

DELETE FROM creature WHERE id IN(42560,42558,582);
INSERT INTO `creature` (`id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
('42558','0','1','1','0','0','-9860.55','1274.1','40.7224','0.704305','300','0','0','126','0','0','0','0','0'),
('42560','0','1','1','0','0','-9858.42','1275.48','40.8294','2.22405','300','0','0','42','0','0','0','0','0'),
('582','0','1','1','0','582','-9852.08','909.974','29.9337','0.509507','300','0','0','55','0','0','0','0','0');

-- Triggers
DELETE FROM creature WHERE id IN (25090,25091,25092);
INSERT INTO creature (id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, MovementType, npcflag, unit_flags, dynamicflags) VALUES
(25090, 530, 1, 1, 0, 0, 13200.6, -7048.38, 3.82285, 3.17961, 180, 0, 0, 57, 0, 0, 0, 0, 0),
(25091, 530, 1, 1, 21072, 0, 13317.5, -6988.85, 4.13809, 3.11521, 180, 0, 0, 57, 0, 0, 0, 0, 0),
(25092, 530, 1, 1, 0, 0, 13272.2, -7144.51, 4.93783, 3.72311, 180, 0, 0, 57, 0, 0, 0, 0, 0);


UPDATE creature SET modelid=15435 WHERE id=45561;
UPDATE creature_template SET modelid1=15435,modelid2=0 WHERE entry=45561;

DELETE FROM gameobject WHERE id IN (205890,205891,205892);
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(205890, 0, 1, 1, 284.798, -2674.51, 119.949, 3.31213, 0, 0, 0.996367, -0.0851638, 300, 0, 1),
(205891, 0, 1, 1, 264.673, -2805.09, 123.369, 0.126574, 0, 0, 0.0632448, 0.997998, 300, 0, 1),
(205892, 0, 1, 1, 217.369, -2715.43, 121.663, 1.13736, 0, 0, 0.538521, 0.842612, 300, 0, 1);

DELETE FROM gameobject_loot_template WHERE entry IN (205890,205891,205892);
INSERT INTO gameobject_loot_template VALUES
(205890, 61972, -100, 1, 0, 1, 1),
(205891, 61973, -100, 1, 0, 1, 1),
(205892, 61974, -100, 1, 0, 1, 1);

DELETE FROM gameobject WHERE id = 203197;
INSERT INTO gameobject (id,map,spawnMask,phaseMask,position_x,position_y,position_z,orientation,rotation0,rotation1,rotation2,rotation3,spawntimesecs,animprogress,state) VALUES
(203197, 1, 1, 1, 3613.73, -2332.68, 1091.35, 3.4208, 0, 0, 0.990271, -0.139153, 300, 0, 1),
(203197, 1, 1, 1, 3640.62, -2281.98, 1083.29, 2.51289, 0, 0, 0.950997, 0.3092, 300, 0, 1),
(203197, 1, 1, 1, 4036.29, -2244.29, 1133.91, 1.6182, 0, 0, 0.723665, 0.690151, 300, 0, 1),
(203197, 1, 1, 1, 4020.55, -2263.44, 1133.94, 5.43288, 0, 0, 0.412462, -0.910975, 300, 0, 1),
(203197, 1, 1, 1, 4004.52, -2255.18, 1133.83, 6.19236, 0, 0, 0.0453987, -0.998969, 300, 0, 1);

DELETE FROM creature_loot_template WHERE entry = 41030 AND item = 55809;
INSERT INTO creature_loot_template VALUES 
(41030, 55809, -100, 1, 0, 1, 1);

-- Add some items to loot at Eversong Woods
DELETE FROM creature_loot_template WHERE entry = 15298 AND item = 20483;
INSERT INTO creature_loot_template VALUES
(15298, 20483, 47, 1, 0, 1, 1);
DELETE FROM creature_loot_template WHERE entry = 15968 AND item = 20765;
INSERT INTO creature_loot_template VALUES
(15968, 20765, 88, 1, 0, 1, 1);

update `creature_template` set `unit_flags`=0 where `entry`=2647;
-- Fix for quest The Flameseers Staff
UPDATE quest_template SET ObjectiveText1 = 'Charred Staff Fragment' WHERE id = 25472;
DELETE FROM gameobject WHERE id = 202846;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(202846,1,1,1,5369.74,-2976.56,1549.84,0.127947,0,0,0.06393,0.997954,300,0,1),
(202846,1,1,1,5378.95,-2977.25,1550.56,5.14743,0,0,0.537845,-0.843044,300,0,1),
(202846,1,1,1,5384.12,-2988.36,1551.66,4.70446,0,0,0.709904,-0.704299,300,0,1),
(202846,1,1,1,5378.95,-2999.7,1552.56,3.83267,0,0,0.940893,-0.338704,300,0,1),
(202846,1,1,1,5372.98,-3000.17,1552.4,3.39285,0,0,0.992119,-0.125297,300,0,1),
(202846,1,1,1,5370.6,-3007.24,1553.57,2.90276,0,0,0.992878,0.119134,300,0,1),
(202846,1,1,1,5355.69,-3003.62,1552.04,2.90276,0,0,0.992878,0.119134,300,0,1),
(202846,1,1,1,5350.28,-2978.84,1548.08,2.21789,0,0,0.895229,0.445606,300,0,1),
(202846,1,1,1,5361.48,-2969,1547.07,0.942403,0,0,0.453957,0.891023,300,0,1),
(202846,1,1,1,5374.65,-2966.27,1547.98,0.893709,0,0,0.432131,0.901811,300,0,1),
(202846,1,1,1,5391.34,-2992.95,1552.88,6.04514,0,0,0.118744,-0.992925,300,0,1),
(202846,1,1,1,5363.85,-3009.69,1553.38,3.98425,0,0,0.912547,-0.408973,300,0,1);

DELETE FROM `creature` WHERE `id`=32997;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(NULL,32997,1,1,1,0,0,4812.737,71.86166,51.33166,0.5170139,120,10,0,1,0,1,0,0,0);


UPDATE `creature_template` SET `minlevel`=17,`maxlevel`=19,`faction_A`=15,`faction_H`=15,`mindmg`=20,`maxdmg`=40 WHERE `entry`=32997;

DELETE FROM `creature_loot_template` WHERE `entry`=32997 AND `item`=44886;
INSERT INTO `creature_loot_template`(`entry`,`item`,`ChanceOrQuestChance`,`lootmode`,`groupid`,`mincountOrRef`,`maxcount`)VALUES
('32997','44886','100','1','0','1','1');

-- Fix for quest Preemptive Methods (by Bastek)
DELETE FROM gameobject_loot_template WHERE entry = 13891;
INSERT INTO gameobject_loot_template VALUES
(13891, 5339, -100, 1, 0, 1, 1);

DELETE FROM gameobject WHERE id = 13891;
INSERT INTO gameobject (id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(13891, 1, 1, 1, -232.344, -148.216, -62.7499, -2.07694, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 45.9468, 275.327, -89.1026, -2.21656, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -360.631, 43.2781, -100.909, -1.83259, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -94.1341, -264.677, -55.5865, 1.06465, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 55.9325, 389.222, -60.8304, 1.98967, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 60.8216, 459.733, -63.9568, -2.61799, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 48.0354, -165.494, -81.7236, 0.767944, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -26.1847, 181.751, -103.945, -2.84488, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -178.29, -101.693, -65.8531, -2.79252, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -64.4431, 62.0624, -28.4545, -2.35619, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 27.6547, -222.968, -80.5542, -0.977383, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -382.755, -100.201, -64.46, -1.88495, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -31.3705, 268.373, -103.759, -2.84488, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -164.128, -337.607, -68.9215, 0.95993, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -46.0182, 63.2591, -85.972, 2.16421, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -223.392, -50.9034, -102.96, -2.79252, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 14.8624, 531.139, -57.1727, -2.93214, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 3.27935, 411.871, -65.9418, -2.16421, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -34.8546, 368.386, -59.371, -2.16421, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 75.7804, 200.276, -92.4961, -1.78023, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -111.872, -38.7467, -28.4545, -3.03684, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -48.3285, -134.548, -68.5341, -0.226892, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -169.717, -224.064, -55.6624, 2.18166, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, 28.4734, 146.89, -90.4116, -1.78023, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -293.322, -319.377, -68.2288, -0.890117, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -147.206, -146.156, -66.9507, -1.5708, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -45.1274, 450.582, -104.504, 2.84488, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -95.8325, 423.05, -106.731, 2.84488, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -35.8711, 463.283, -54.8242, -2.93214, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -80.8724, 113.195, -89.759, 2.16421, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -36.2995, -281.637, -66.5813, -0.977383, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -70.8434, 286.93, -89.9548, -2.21656, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -129.738, -52.6916, -76.7491, -2.79252, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -196.059, 29.3717, -50.2278, 0.645772, 0, 0, 0, 1, 180, 100, 1),
(13891, 1, 1, 1, -12.3259, -176.299, -75.5731, 0.767944, 0, 0, 0, 1, 180, 100, 1);

-- Centaur Bracers quest items drop fix (by Bastek)
DELETE FROM creature_loot_template WHERE entry IN (9523,9524,3275,44170,3396,3397) AND item = 5030;
INSERT INTO creature_loot_template VALUES
(9523, 5030, -100, 1, 0, 1, 1),
(9524, 5030, -93, 1, 0, 1, 1),
(3275, 5030, -80, 1, 0, 1, 1),
(44170, 5030, -39, 1, 0, 1, 1),
(3396, 5030, -22, 1, 0, 1, 1),
(3397, 5030, -11, 1, 0, 1, 1);

UPDATE `creature_template` SET `npcflag`=0x1000000 WHERE `entry`=36059;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=36059;
INSERT INTO `npc_spellclick_spells` VALUES
(36059,68291,1,2);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=36059;
DELETE FROM `smart_scripts` WHERE `entryorguid`=36059 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(36059,0,1,0,31,0,100,0,68291,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Blood-filled Leech - On SpellHitTarget - Despawn');

UPDATE `creature_template` SET `ScriptName`='npc_rejuvenated_thunder_lizard' WHERE `entry`=35412;

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=1815;
DELETE FROM `smart_scripts` WHERE `entryorguid`=1815 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(1815,0,0,0,6,0,100,0,0,0,0,0,11,83105,2,0,0,0,0,1,0,0,0,0,0,0,0,'Diseased Black Bear - On Death - Cast Latent Disease: Summon Plague Tangle');

 UPDATE `gameobject_template` SET `flags`=0 WHERE `entry`=205060;