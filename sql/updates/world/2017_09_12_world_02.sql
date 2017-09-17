UPDATE `quest_template` SET `RequiredRaces` = 1101 WHERE `Id` = 28765;
UPDATE `quest_template` SET `PrevQuestId` = 29078, `NextQuestId` = 0, `NextQuestIdChain` = 0 WHERE `Id` = 29078;
UPDATE `quest_template` SET `RequiredRaces` = 2098245 WHERE `Id` = 28762;
UPDATE `quest_template` SET `NextQuestId` = 28769 WHERE `Id` = 28757;
UPDATE `quest_template` SET `NextQuestId` = 28770 WHERE `Id` = 28762;
UPDATE `quest_template` SET `NextQuestId` = 28771 WHERE `Id` = 28763;
UPDATE `quest_template` SET `NextQuestId` = 28772 WHERE `Id` = 28764;
UPDATE `quest_template` SET `NextQuestId` = 28773 WHERE `Id` = 28765;
UPDATE `quest_template` SET `NextQuestId` = 28774 WHERE `Id` = 28766;
UPDATE `quest_template` SET `NextQuestId` = 29079, `NextQuestIdChain` = 29079 WHERE `Id` = 28765;
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 49874;
UPDATE `quest_template` SET `NextQuestId` = 29080 WHERE `Id` = 29079;
UPDATE `quest_template` SET `PrevQuestId` = 28757 WHERE `Id` = 28757;
UPDATE `quest_template` SET `PrevQuestId` = 28762 WHERE `Id` = 28762;
UPDATE `quest_template` SET `PrevQuestId` = 28763 WHERE `Id` = 28763;
UPDATE `quest_template` SET `PrevQuestId` = 28764 WHERE `Id` = 28764;
UPDATE `quest_template` SET `PrevQuestId` = 28765 WHERE `Id` = 28765;
UPDATE `quest_template` SET `PrevQuestId` = 28767 WHERE `Id` = 28767;
UPDATE `quest_template` SET `PrevQuestId` = 31139, `NextQuestId` = 29080, `ExclusiveGroup` = 0, `NextQuestIdChain` = 29080 WHERE `Id` = 31140;
UPDATE `quest_template` SET `RequiredClasses` = 0, `NextQuestId` = 31140, `ExclusiveGroup` = 0 WHERE `Id` = 31139;
UPDATE `quest_template` SET `RequiredClasses` = 0, `NextQuestId` = 29080, `ExclusiveGroup` = 0, `NextQuestIdChain` = 29080 WHERE `Id` = 31140;
UPDATE `quest_template` SET `RequiredClasses` = 0, `PrevQuestId` = 31139, `NextQuestId` = 29080, `ExclusiveGroup` = 0, `NextQuestIdChain` = 29080 WHERE `Id` = 31140;
UPDATE `quest_template` SET `RequiredClasses` = 0, `RequiredRaces` = 2098253, `PrevQuestId` = 29080 WHERE `Id` = 28806;
UPDATE `quest_template` SET `PrevQuestId` = 31140, `NextQuestId` = 29081 WHERE `Id` = 29080;
UPDATE `quest_template` SET `NextQuestId` = 29083 WHERE `Id` = 29081;
UPDATE `quest_template` SET `PrevQuestId` = 29083 WHERE `Id` = 26391;

DELETE FROM `creature` WHERE `id`=42944;

DELETE FROM `creature_template_addon` WHERE (`entry`=50047);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES (50047, 0, 0, 0, 1, 0, 84063);

UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0 WHERE `entry` = 42940;
UPDATE `creature_template` SET `modelid1` = 15880, `modelid2` = 0, `unit_flags` = 33587714 WHERE `entry` = 42940;

DELETE FROM `creature` WHERE `id`=42218;
INSERT INTO `creature` (`guid`,`id`,`map`,`zoneId`,`areaId`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`npcflag2`,`unit_flags`,`unit_flags2`,`dynamicflags`,`isActive`,`protec_anti_doublet`) VALUES
(168293, 42218, 0, 6170, 9, 1, 1, 0, 0, -8909.29, -132.802, 80.6389, 2.11185, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(168290, 42218, 0, 6170, 9, 1, 1, 0, 0, -8919.3, -137.372, 80.604, 2.11185, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(168241, 42218, 0, 6170, 9, 1, 1, 0, 0, -9023.47, -96.3879, 87.1935, 0.732427, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(168230, 42218, 0, 6170, 9, 1, 1, 0, 0, -9046.76, -53.7981, 88.0941, 4.57492, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(168229, 42218, 0, 6170, 9, 1, 1, 0, 0, -9042.76, -53.9013, 88.1395, 4.83123, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(168228, 42218, 0, 6170, 9, 1, 1, 0, 0, -9042.93, -58.2272, 88.295, 4.74869, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167613, 42218, 0, 12, 87, 1, 1, 0, 0, -9366.76, 108.286, 61.095, 3.49854, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167612, 42218, 0, 12, 12, 1, 1, 0, 0, -9366.24, 115.074, 61.6785, 3.5221, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167611, 42218, 0, 12, 87, 1, 1, 0, 0, -9372.14, 106.311, 60.7301, 3.48617, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167610, 42218, 0, 12, 87, 1, 1, 0, 0, -9369.42, 107.309, 60.9207, 3.49189, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167609, 42218, 0, 12, 87, 1, 1, 0, 0, -9371.45, 109.751, 60.9178, 3.48921, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167608, 42218, 0, 12, 87, 1, 1, 0, 0, -9368.76, 110.728, 61.115, 3.49478, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167607, 42218, 0, 12, 87, 1, 1, 0, 0, -9375.94, 111.312, 60.8491, 3.48245, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167606, 42218, 0, 12, 87, 1, 1, 0, 0, -9373.27, 112.275, 61.0647, 3.48732, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167605, 42218, 0, 12, 12, 1, 1, 0, 0, -9363.62, 112.509, 61.4972, 3.48319, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167476, 42218, 0, 12, 12, 1, 1, 0, 0, -9654.67, -739.244, 44.5022, 4.80748, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167475, 42218, 0, 12, 12, 1, 1, 0, 0, -9649.83, -697.918, 46.3843, 4.48588, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167474, 42218, 0, 12, 12, 1, 1, 0, 0, -9646.92, -698.61, 46.4415, 4.48518, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167473, 42218, 0, 12, 12, 1, 1, 0, 0, -9650.5, -700.875, 46.1217, 4.48771, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167472, 42218, 0, 12, 12, 1, 1, 0, 0, -9647.57, -701.53, 46.043, 4.48662, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167471, 42218, 0, 12, 12, 1, 1, 0, 0, -9648.23, -704.45, 45.5645, 4.48969, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167470, 42218, 0, 12, 12, 1, 1, 0, 0, -9645.74, -667.959, 49.0418, 4.28755, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167469, 42218, 0, 12, 12, 1, 1, 0, 0, -9647.15, -673.772, 48.8153, 4.34019, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(167468, 42218, 0, 12, 12, 1, 1, 0, 0, -9646.45, -670.865, 48.9542, 4.31071, 120, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(999484, 42218, 0, 0, 0, 1, 1, 0, 0, -9011.44, -62.7255, 87.1745, 1.71485, 300, 0, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0, ''),
(999485, 42218, 0, 0, 0, 1, 1, 0, 0, -9007.29, -61.9982, 87.0045, 1.71485, 300, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '');




