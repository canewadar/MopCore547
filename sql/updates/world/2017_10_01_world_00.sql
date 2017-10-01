SET @ENTRY := 39464;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,60,0,100,0,0,0,5000,10000,11,73958,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drowned Thunder Lizard - On Update - Cast '<Spell not found!>'"),
(@ENTRY,0,1,0,25,0,100,0,0,0,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drowned Thunder Lizard - On Reset - Set Npc Flag Spellclick"),
(@ENTRY,0,2,0,73,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drowned Thunder Lizard - On Spellclick - Set Npc Flag "),
(@ENTRY,0,3,0,73,0,100,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Drowned Thunder Lizard - On Spellclick - Despawn In 5000 ms");


INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(39464, 73945, 1, 0);

-- Northwatch Foothold
-- Lar must kneel
DELETE FROM `creature_template_addon` WHERE `entry`=3140;
INSERT INTO `creature_template_addon` (`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(3140,0,0,8,1,0, '');

-- Infataryman
-- attackemote
DELETE FROM `creature_addon` WHERE `guid` IN (309448,309459,309441,309447,309438,309424,309436,309428,309424,309440);
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES 
(309448,0,0,0,1,27, ''),
(309459,0,0,0,1,27, ''),
-- handleemote
(309441,0,0,0,1,69, ''),
(309447,0,0,0,1,69, ''),
(309438,0,0,0,1,69, ''),
-- sitting
(309436,0,0,1,1,0, ''),
(309428,0,0,1,1,0, ''),
(309424,0,0,1,1,0, ''),
(309440,0,0,1,1,0, '');

-- Clattering Scorpid SAI
SET @ENTRY := 3125;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,0,0,100,0,4000,4500,32000,38000,11,79687,0,0,0,0,0,19,0,0,0,0,0,0,0,"Clattering Scorpid - In Combat - Cast '<Spell not found!>'"),
(@ENTRY,0,1,4,2,0,100,0,0,30,15000,15000,11,73672,0,0,0,0,0,19,39236,25,0,0,0,0,0,"Clattering Scorpid - Between 0-30% Health - Cast '<Spell not found!>'"),
(@ENTRY,0,2,0,2,0,100,0,0,30,15000,15000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Clattering Scorpid - Between 0-30% Health - Say Line 0"),
(@ENTRY,0,3,0,31,0,100,0,0,0,0,0,33,39236,0,0,0,0,0,23,0,0,0,0,0,0,0,"Clattering Scorpid - On Target Spellhit - Quest Credit 'Never Trust a Big Barb and a Smile'"),
(@ENTRY,0,4,0,61,0,100,0,0,0,0,0,11,73672,0,0,0,0,0,2,0,0,0,0,0,0,0,"Clattering Scorpid - Between 0-0% Health - Cast '<Spell not found!>'");

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=3 AND `SourceEntry`=3125;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,3,3125,0,0,9,0,25165,0,0,0,"","Clattering Scorpid - Only enable text if quest 'Never Trust a Big Barb and a Smile' is active");

DELETE FROM `creature_text` WHERE `entry`=3125;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(3125, 0, 0, '%s is casting Envenom!  Place your totem down now!', 42, 0, 100, 0, 0, 0, 'Clattering Scorpid to Player');

UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=0 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=1 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=2 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=3 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=4 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=5 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;
UPDATE `conditions` SET `ConditionValue1`=25165 WHERE  `SourceTypeOrReferenceId`=15 AND `SourceGroup`=3062 AND `SourceEntry`=6 AND `SourceId`=0 AND `ElseGroup`=0 AND `ConditionTypeOrReference`=8 AND `ConditionTarget`=0 AND `ConditionValue1`=826 AND `ConditionValue2`=0 AND `ConditionValue3`=0;

-- Thonk SAI
SET @ENTRY := 39323;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,19,0,100,0,25187,0,0,0,33,39357,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thonk - On Quest 'Lost in the Floods' Taken - Quest Credit 'Lost in the Floods'"),
(@ENTRY,0,1,0,19,0,100,0,25187,0,0,0,33,39358,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thonk - On Quest 'Lost in the Floods' Taken - Quest Credit 'Lost in the Floods'"),
(@ENTRY,0,2,0,19,0,100,0,25187,0,0,0,33,39359,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thonk - On Quest 'Lost in the Floods' Taken - Quest Credit 'Lost in the Floods'"),
(@ENTRY,0,3,0,19,0,100,0,25187,0,0,0,33,39360,0,0,0,0,0,7,0,0,0,0,0,0,0,"Thonk - On Quest 'Lost in the Floods' Taken - Quest Credit 'Lost in the Floods'");

UPDATE `creature_template` SET `ScriptName`='npc_thonk' WHERE  `entry`=39323;
UPDATE `creature_template` SET `ScriptName`='npc_zentaji' WHERE  `entry`=39324;
UPDATE `creature_template` SET `ScriptName`='npc_tekla' WHERE  `entry`=39325;
UPDATE `creature_template` SET `ScriptName`='npc_misha' WHERE  `entry`=3193;
UPDATE `creature_template` SET `ScriptName`='npc_raggaran' WHERE  `entry`=39326;

-- Wayward Plainstrider SAI
SET @ENTRY := 39337;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,0,0,0,4,0,100,1,0,0,0,0,11,6268,0,0,0,0,0,2,0,0,0,0,0,0,0,"Wayward Plainstrider - On Aggro - Cast 'Rushing Charge' (No Repeat)"),
(@ENTRY,0,1,0,2,0,100,1,0,45,0,0,80,@ENTRY*100+00,2,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Plainstrider - Between 0-45% Health - Run Script (No Repeat)");


-- Actionlist SAI
SET @ENTRY := 3933700;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ENTRY AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ENTRY,9,0,0,0,0,100,0,0,0,0,0,18,8389378,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Plainstrider - On Script - Set Flags Not Attackable & Immune To Players & Immune To NPC's & Fleeing"),
(@ENTRY,9,1,0,0,0,100,0,0,0,0,0,33,39336,0,0,0,0,0,7,0,0,0,0,0,0,0,"Wayward Plainstrider - On Script - Quest Credit 'Unbidden Visitors'"),
(@ENTRY,9,2,0,0,0,100,0,0,0,0,0,11,73757,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Plainstrider - On Script - Cast '<Spell not found!>'"),
(@ENTRY,9,3,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,146,3679,28,2,"Wayward Plainstrider - On Script - Set Orientation 2"),
(@ENTRY,9,4,0,0,0,100,0,0,0,0,0,46,50,0,0,0,0,0,1,0,0,0,146,3679,28,2,"Wayward Plainstrider - On Script - Move Forward 50 Yards"),
(@ENTRY,9,5,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Plainstrider - On Script - Despawn In 2000 ms"),
(@ENTRY,9,6,0,60,0,100,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Wayward Plainstrider - INCORRECT EVENT TYPE - Evade");
