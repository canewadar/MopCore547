DELETE FROM `game_event_gameobject` WHERE `guid` IN
(213432, 213435, 213373, 213370, 213429, 213431, 213372, 213374,
 197155, 213376, 213371, 213369);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1, 213432), (1, 213435), (1, 213373), (1, 213370),
(1, 213429), (1, 213431), (1, 213372), (1, 213374),
(1, 197155), (1, 213376), (1, 213371), (1, 213369);
DELETE FROM `creature_addon` WHERE `guid` = 400136;
DELETE FROM `creature_template_addon` WHERE `entry` = 54334;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES
(54334, 0, 1, 483);
DELETE FROM `game_event_gameobject` WHERE `guid` IN
(46505, 46502, 46503, 46498, 46497, 46444, 46399, 46517);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(75, 46505), (75, 46502), (75, 46503), (75, 46498),
(75, 46497), (75, 46444), (75, 46399), (75, 46517);

DELETE FROM `game_event_gameobject` WHERE `guid` IN
(529990, 529805, 529989, 529806, 529991, 529804, 529993, 529803,
 529745, 529746, 529994, 529802, 529747, 529801, 529748, 529995,
 529800, 529749, 529996, 529799, 529750, 529798, 529751, 529997,
 529797, 529752, 529998, 529796, 529753, 529795, 529754, 529999,
 529794, 529755, 530000, 529793, 529756, 529792, 529757, 530001,
 529791, 529758, 530002, 529790, 529759, 529789, 529760, 530003,
 529788, 529761, 530004, 529787, 529762, 529786, 529763, 530005,
 529785, 529764, 530006, 529784, 529765, 529783, 529766, 530007,
 529782, 529767, 530008, 529781, 529768, 529992, 530020, 530025,
 530027, 530029, 530026, 530021, 530023, 530018, 530017, 530019,
 530009, 530012, 530034, 530024, 530028, 530022, 529777, 530015,
 529774, 529769, 530010, 530032, 530033, 530011, 530013, 530014,
 530030, 530016, 529780, 530031, 529779, 529773, 529778, 529772,
 529771, 529770, 529776, 529775);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(26, 529990), (26, 529805), (26, 529989), (26, 529806),
(26, 529991), (26, 529804), (26, 529993), (26, 529803),
(26, 529745), (26, 529746), (26, 529994), (26, 529802),
(26, 529747), (26, 529801), (26, 529748), (26, 529995),
(26, 529800), (26, 529749), (26, 529996), (26, 529799),
(26, 529750), (26, 529798), (26, 529751), (26, 529997),
(26, 529797), (26, 529752), (26, 529998), (26, 529796),
(26, 529753), (26, 529795), (26, 529754), (26, 529999),
(26, 529794), (26, 529755), (26, 530000), (26, 529793),
(26, 529756), (26, 529792), (26, 529757), (26, 530001),
(26, 529791), (26, 529758), (26, 530002), (26, 529790),
(26, 529759), (26, 529789), (26, 529760), (26, 530003),
(26, 529788), (26, 529761), (26, 530004), (26, 529787),
(26, 529762), (26, 529786), (26, 529763), (26, 530005),
(26, 529785), (26, 529764), (26, 530006), (26, 529784),
(26, 529765), (26, 529783), (26, 529766), (26, 530007),
(26, 529782), (26, 529767), (26, 530008), (26, 529781),
(26, 529768), (26, 529992), (26, 530020), (26, 530025),
(26, 530027), (26, 530029), (26, 530026), (26, 530021),
(26, 530023), (26, 530018), (26, 530017), (26, 530019),
(26, 530009), (26, 530012), (26, 530034), (26, 530024),
(26, 530028), (26, 530022), (26, 529777), (26, 530015),
(26, 529774), (26, 529769), (26, 530010), (26, 530032),
(26, 530033), (26, 530011), (26, 530013), (26, 530014),
(26, 530030), (26, 530016), (26, 529780), (26, 530031),
(26, 529779), (26, 529773), (26, 529778), (26, 529772),
(26, 529771), (26, 529770), (26, 529776), (26, 529775);

UPDATE `creature` SET `spawndist`= 10, `MovementType` = 1 WHERE `id` = 72777;
UPDATE `creature` SET `spawndist`= 0, `MovementType` = 0 WHERE `guid` IN
(175185, 175186, 175106, 175184,
 175187, 175190, 175188, 175359,
 175349, 175351, 175357, 175350,
 175352, 175329, 175326, 175324,
 175327, 175331, 175342, 175336,
 175337, 175312, 175313, 175334,
 175333, 175335, 175318, 175319,
 175317, 175316, 175315, 175291,
 175314, 175294, 175295, 175293,
 175292, 175286, 175285, 175287,
 175270, 175288, 175241, 175267,
 175266, 175268, 175255, 175283,
 175277, 175276, 175284, 175247,
 175250, 175244, 175245, 175224,
 175222, 175223, 175221, 175219,
 175225, 175220, 175246, 175249,
 175248, 175239, 175240, 175237,
 175238, 175257, 175260, 175262,
 175261, 175264, 175256, 175258,
 175263, 175259, 186905, 186904);
 
 SET @BP_ENTRY     = 951;
SET @SI_ENTRY     = 49869;
SET @BBW_ENTRY    = 49871;
SET @MMCB_ENTRY   = 197;
SET @SIS_ENTRY    = 50047;
SET @GA_ENTRY     = 50039;
SET @H_ENTRY      = 448;
SET @LN_ENTRY     = 61837;
SET @SAR_ENTRY    = 42216;
SET @WOLF_ENTRY_1 = 43291;
SET @WOLF_ENTRY_2 = 43292;
SET @MAGE_ENTRY   = 53836;

DELETE FROM `creature` WHERE `guid`=11598421;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(11598421, @MAGE_ENTRY, 0, 1, -8959, -147, 81.5134, 3.76123, 300, 0, 0);
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@MAGE_ENTRY;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=-11598421 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-11598421, 0, 0, 0, 1, 0, 100, 0, 4200, 6700, 5100, 6400, 11, 167677, 0, 0, 0, 0, 0, 10, 18253, 44548, 0, 0, 0, 0, 0, "Stormwind Mage - On Reset - Summon Water Elemental"),
(-11598421, 0, 1, 0, 1, 0, 100, 0, 7400, 7900, 6700, 7100, 11, 166991, 0, 0, 0, 0, 0, 10, 18253, 44548, 0, 0, 0, 0, 0, "Stormwind Mage - On Reset - Summon Water Elemental");
DELETE FROM `creature_template_addon` WHERE `entry`=@MAGE_ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MAGE_ENTRY, 0, 257, 474, '69787');

DELETE FROM `creature_equip_template` WHERE `entry`=@BP_ENTRY;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(@BP_ENTRY, 1907, 0, 0);
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`equipment_id`=951 WHERE `id`=@BP_ENTRY;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@BP_ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @BP_ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BP_ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 1800000, 1800000, 11, 13864, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Every 30 Minutes - Cast 'Power Word: Fortitude'"),
(@BP_ENTRY, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 53, 0, @BP_ENTRY*100, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - On Reset - Start Waypoint Path"),
(@BP_ENTRY, 0, 2, 3, 40, 0, 15, 0, 0, 0, 0, 0, 54, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Pause Waypoint"),
(@BP_ENTRY, 0, 3, 0, 61, 0, 20, 0, 0, 0, 0, 0, 88, (@BP_ENTRY*100)+0, (@BP_ENTRY*100)+3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Random Timed Action");
DELETE FROM `waypoints` WHERE `entry`=@BP_ENTRY*100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@BP_ENTRY*100, 1, -8829.18, -147.578, 80.4889, 'Brother Paxton Waypoint Path 01'),
(@BP_ENTRY*100, 2, -8822.08, -146.456, 80.877, 'Brother Paxton Waypoint Path 02'),
(@BP_ENTRY*100, 3, -8817.2, -150.924, 81.5878, 'Brother Paxton Waypoint Path 03'),
(@BP_ENTRY*100, 4, -8811.99, -159.78, 81.614, 'Brother Paxton Waypoint Path 04');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN((@BP_ENTRY*100)+0, (@BP_ENTRY*100)+1, (@BP_ENTRY*100)+2, (@BP_ENTRY*100)+3) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
((@BP_ENTRY*100)+0, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+0, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+0, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 66097, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Penance'),
((@BP_ENTRY*100)+0, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+1, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+1, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+1, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 38588, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Flash Heal'),
((@BP_ENTRY*100)+1, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+2, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+2, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+2, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 8362, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Renew'),
((@BP_ENTRY*100)+2, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 0, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+3, 9, 0, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 11, 93091, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Cast AOE Heal'),
((@BP_ENTRY*100)+3, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 1, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text');

DELETE FROM `creature_text` WHERE `entry` IN (@BP_ENTRY, @SI_ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@BP_ENTRY, 0, 0, 'BY THE LIGHT BE RENEWED!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Renew Cast Phrase'),
(@BP_ENTRY, 1, 0, 'AND I LAY MY HANDS UPON YOU!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Renew Cast Phrase'),
(@BP_ENTRY, 1, 1, 'Let the Holy Light embrace you!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@BP_ENTRY, 2, 0, 'Be healed, brother!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@BP_ENTRY, 2, 1, 'FIGHT ON, BROTHER!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@SI_ENTRY, 0, 0, 'HELP!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 1, 'I need a heal!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 2, 'I could use a heal, brother!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 3, 'Make yourself useful and heal me, Paxton!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 1, 0, 'Come, monsters! We will crush you!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 1, 'I\'ll kill a hundred more of your battle worgs!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 2, 'Look alive, men! There are orcs and worgs about!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 3, 'Your filthy dogs won\'t be enough!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 4, 'Your worgs are no match for the might of Stormwind!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell');

DELETE FROM `locales_creature_text` WHERE `entry` IN (@BP_ENTRY, @SI_ENTRY);
INSERT INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`, `text_loc9`, `text_loc10`) VALUES
(@BP_ENTRY, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ДА ИСЦЕЛИТ ТЕБЯ СВЕТ!', NULL, NULL),
(@BP_ENTRY, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'НЫНЕ ВОЗЛАГАЮ НА ТЕБЯ РУКИ!', NULL, NULL),
(@BP_ENTRY, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да озарит тебя Свет!', NULL, NULL),
(@BP_ENTRY, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Исцелись, брат!', NULL, NULL),
(@BP_ENTRY, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ВОЗВРАЩАЙСЯ В СТРОЙ, БРАТ!', NULL, NULL),
(@SI_ENTRY, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ПОМОГИ МНЕ!', NULL, NULL),
(@SI_ENTRY, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Излечи меня!', NULL, NULL),
(@SI_ENTRY, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Излечи меня, брат!', NULL, NULL),
(@SI_ENTRY, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Пакстон, приди мне на помощь и исцели меня!', NULL, NULL),
(@SI_ENTRY, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Идите сюда, чудовища! Мы с вами расправимся!', NULL, NULL),
(@SI_ENTRY, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я прикончу еще сотню ваших боевых воргов!', NULL, NULL),
(@SI_ENTRY, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Будьте начеку! Поблизости орки и ворги!', NULL, NULL),
(@SI_ENTRY, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Пора вас отправить вслед за вашими грязными псами!', NULL, NULL),
(@SI_ENTRY, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ваши ворги бессильны перед военной мощью Штормграда!', NULL, NULL);

UPDATE `creature_template` SET `AIName`="" WHERE `entry`=@SIS_ENTRY;
UPDATE `creature` SET `curhealth`=1 WHERE `id`=@SIS_ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIS_ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIS_ENTRY*100 AND `source_type`=9;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@SIS_ENTRY;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@SIS_ENTRY, 93072, 1, 0),
(@SIS_ENTRY, 93097, 0, 0);

UPDATE `creature_template` SET `scriptname`="npc_blackrock_battle_worg" WHERE `entry`=@BBW_ENTRY;
UPDATE `creature` SET `MovementType`=1,`spawndist`=15 WHERE `id`=@GA_ENTRY;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@LN_ENTRY, @SAR_ENTRY, @MMCB_ENTRY, @WOLF_ENTRY_1, @WOLF_ENTRY_2);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES
(@LN_ENTRY, 5, 1, 426),
(@SAR_ENTRY, 5, 1, 483),
(@MMCB_ENTRY, 0, 1, 483),
(@WOLF_ENTRY_1, 3, 1, 0),
(@WOLF_ENTRY_2, 1, 1, 0);
UPDATE `creature` SET `position_z`=99.0125 WHERE `id`=@LN_ENTRY;
DELETE FROM `creature` WHERE `guid` IN (11598411, 11598412, 11598413, 11598414, 11598415, 11598416, 11598417, 11598418, 11598419, 11598420);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `isActive`, `protec_anti_doublet`) VALUES
(11598411, 42059, 0, 6170, 9, 1, 1, 0, 0, -8938.35, -132.975, 82.2191, 5.42745, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598412, 42059, 0, 6170, 9, 1, 1, 0, 0, -8939.87, -134.071, 82.2103, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598413, 42059, 0, 6170, 9, 1, 1, 0, 0, -8941.13, -132.506, 82.2646, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598414, 42059, 0, 6170, 9, 1, 1, 0, 0, -8939.73, -131.37, 82.3038, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598415, 42059, 0, 6170, 9, 1, 1, 0, 0, -8941.22, -129.797, 82.4094, 5.56489, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598416, 42059, 0, 6170, 9, 1, 1, 0, 0, -8942.53, -131.052, 82.4063, 5.46672, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598417, 42094, 0, 6170, 9, 1, 1, 0, 1, -8971.18, -155.411, 81.5028, 3.86227, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598418, 42094, 0, 6170, 9, 1, 1, 0, 1, -8964.33, -155.348, 81.5031, 5.61438, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598419, 42094, 0, 6170, 9, 1, 1, 0, 1, -8968.87, -148.46, 81.5031, 1.51785, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598420, 42094, 0, 6170, 9, 1, 1, 0, 1, -8971.34, -150.209, 81.5028, 2.50353, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=42094;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=42094 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(42094, 0, 0, 0, 1, 0, 100, 0, 1500, 5300, 1000, 4900, 10, 51, 45, 36, 54, 60, 43, 1, 0, 0, 0, 0, 0, 0, 0, "Stormwind Recruit - OOC - Play Random Emote");
DELETE FROM `creature_equip_template` WHERE `entry`=42094;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(42094, 1899, 143, 2551);

DELETE FROM `creature_equip_template` WHERE `entry`=42938;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(42938, 56117, 0, 0);
UPDATE `creature` SET `equipment_id`=42938 WHERE `id`=42938;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@H_ENTRY AND `source_type`=0;
DELETE FROM `creature_text` WHERE `entry`=@H_ENTRY;
UPDATE `creature_template` SET `AIName`="", `scriptname`="npc_hogger" WHERE `entry`=@H_ENTRY;