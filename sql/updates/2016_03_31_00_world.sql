UPDATE `gameobject` SET `spawntimesecs` = 30 WHERE `guid` = 4160649;
-- Fix Quest "Trolling for information" (24489)
-- Update quest chain, Ice and Fire (218) needs Trolling for information (24489) completed and add missing text

DELETE FROM `creature_queststarter` WHERE `quest` = 24489;
DELETE FROM `gameobject_queststarter` WHERE `quest` = 24489;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 24489;
INSERT INTO `creature_queststarter` (`id`, `quest`) VALUES (1354, 24489);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 1354;
DELETE FROM `creature_questender` WHERE `quest` = 24489;
DELETE FROM `gameobject_questender` WHERE `quest` = 24489;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (1354, 24489);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=1354;
UPDATE `quest_template` SET `SourceSpellId` = 0, `OfferRewardText` = 'Hmm... interesting.  From what you''re saying, it sounds like a fire elemental might have snuck in from Searing Gorge.  Or, the earthquake opened up a crack to the elemental plane...$b$b<Soren laughs uncomfortably.>$b$bEither way, this is bad news.  You should probably report this information to Grelin.', `RequestItemsText` = 'I cant even begin to imagine what would make the trolls act like this.',`RequiredNpcOrGo2` = 37108, `RequiredNpcOrGo2` = 37174, `RequiredNpcOrGo3` = 37173 WHERE `Id` = 24489;

-- Add creature text for Soothsayer Rikkari

REPLACE INTO creature_text
VALUES (37173,0,0,'What we gon'' do now, you ask ? We wait.',12,0,100,1,3,0,'Soothsayer Rikkari 1st sentence');

REPLACE INTO creature_text
VALUES (37173,1,0,'Grik''nir says he gon'' talk to the elemental, get it to fight on our side.',12,0,100,1,3,0,'Soothsayer Rikkari 2nd sentence');

REPLACE INTO creature_text
VALUES (37173,2,0,'Soon enough we take over dis valley. Soon enough.',12,0,100,1,3,0,'Soothsayer Rikkari 3rd sentence');


-- Soothsayer Rikkari SAI
SET @ENTRY := 37173;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,100,0,1,3,5000,6000,1,0,4000,0,0,0,0,7,0,0,0,0,0,0,0,"Start 1st sentence when in range"),
(@ENTRY,0,1,0,52,0,100,0,0,37173,0,0,1,1,4000,0,0,0,7,0,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,2,0,52,0,100,0,1,37173,0,0,1,2,4000,0,0,0,7,0,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,3,0,52,0,100,0,2,37173,0,0,33,37173,0,0,0,0,7,7,0,0,0,0,0,0,0,"Validate objective");

-- Add creature text for Soothsayer Shi'kala

REPLACE INTO creature_text
VALUES (37108,0,0,'Da spirits be angry with us.',12,0,100,1,3,0,'Soothsayer Shi''kala 1st sentence');

REPLACE INTO creature_text
VALUES (37108,1,0,'I don'' know why the spirits be rejectin'' us so.',12,0,100,1,3,0,'Soothsayer Shi''kala 2nd sentence');

REPLACE INTO creature_text
VALUES (37108,2,0,'Don'' worry, child. Grik''nir gonna help us get through this.',12,0,100,1,3,0,'Soothsayer Shi''kala 3rd sentence');


-- Soothsayer Shi'kala SAI
SET @ENTRY := 37108;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,100,0,1,3,5000,6000,1,0,4000,0,0,0,0,7,0,0,0,0,0,0,0,"Start 1st sentence when in range"),
(@ENTRY,0,1,0,52,0,100,0,0,37108,0,0,1,1,4000,0,0,0,7,7,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,2,0,52,0,100,0,1,37108,0,0,1,2,4000,0,0,0,7,7,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,3,0,52,0,100,0,2,37108,0,0,33,37108,0,0,0,0,7,7,0,0,0,0,0,0,0,"Validate objective");

-- Add creature text for Soothsayer Mirim'koa

REPLACE INTO creature_text
VALUES (37174,0,0,'Our land be a land of ice an'' snow',12,0,100,1,3,0,'Soothsayer Mirim''koa 1st sentence');

REPLACE INTO creature_text
VALUES (37174,1,0,'But beneath the earth, child, there always be fire.',12,0,100,1,3,0,'Soothsayer Mirim''koa 2nd sentence');

REPLACE INTO creature_text
VALUES (37174,2,0,'De spirit come from deep down to talk with Grik''nir.',12,0,100,1,3,0,'Soothsayer Mirim''koa 3rd sentence');


-- Soothsayer Mirim'koa SAI
SET @ENTRY := 37174;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,10,0,100,0,1,3,5000,6000,1,0,4000,0,0,0,0,7,0,0,0,0,0,0,0,"Start 1st sentence when in range"),
(@ENTRY,0,1,0,52,0,100,0,0,37174,0,0,1,1,4000,0,0,0,7,7,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,2,0,52,0,100,0,1,37174,0,0,1,2,4000,0,0,0,7,7,0,0,0,0,0,0,0,"Start 2nd sentence after TEXT_OVER"),
(@ENTRY,0,3,0,52,0,100,0,2,37174,0,0,33,37174,0,0,0,0,7,7,0,0,0,0,0,0,0,"Validate objective");

UPDATE `creature_template` SET `mindmg`="10",`maxdmg`="15" WHERE `entry`=808;
UPDATE `creature_template` SET `mindmg`="10",`maxdmg`="15" WHERE `entry`=37112;
DELETE FROM `creature_equip_template` WHERE (`entry`=1872);
