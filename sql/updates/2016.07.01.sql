UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=32971; 
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=32971; 
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=32971; 
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=32971);

UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=32973; 
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=32973; 
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=32973; 
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=32973);

UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=32974; 
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=32974; 
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=32974; 
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=32974);

UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry`=32972; 
UPDATE `creature_template_addon` SET `auras`='' WHERE `entry`=32972; 
UPDATE `creature` SET `phaseMask`=1 WHERE `id`=32972; 
UPDATE `creature_addon` SET `auras`='' WHERE `guid` IN (SELECT `guid` FROM `creature` WHERE `id`=32972);