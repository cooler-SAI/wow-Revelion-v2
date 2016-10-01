UPDATE `quest_template` SET `RequiredNpcOrGo1` = 0, `RequiredNpcOrGo2` = 0, `RequiredNpcOrGo3` = 0, `RequiredNpcOrGo4` = 0, `RequiredNpcOrGoCount1` = 0, `RequiredNpcOrGoCount2` = 0, `RequiredNpcOrGoCount3` = 0, `RequiredNpcOrGoCount4` = 0 WHERE `Id` = 13518;

-- Quest 13527 No Accounting for Taste
DELETE FROM `npc_spellclick_spells` WHERE (`npc_entry`='32975');
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`) VALUES ('32975', '62113', '1');
UPDATE `creature_template` SET `npcflag`='16777216' WHERE (`entry`='32975');

UPDATE `quest_template` SET `RequiredNpcOrGo1` = 0, `RequiredNpcOrGoCount1` = 0, `RequiredItemId2` = 0, `RequiredItemCount2` = 0 WHERE `Id` = 13557;