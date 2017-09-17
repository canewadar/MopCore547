-- Script/Quest: Fix: The Wolf and The Kodo (25205)

SET @NPC_THE_WOLF                   := 39364;
SET @NPC_THE_KODO                   := 39365;
SET @NPC_SHIN_STONEPILLAR           := 39380;
SET @SPELL_SUMMON_THE_WOLF          := 73840;
SET @SPELL_DASH                     := 73851;
SET @SPELL_HUNTING                  := 73841;
SET @SPELL_RUMBLING_HOOVES          := 73868;
SET @SPELL_SEE_INVIS_1              := 73426;
SET @SPELL_RIDE_VEHICLE_HARDCODED   := 86319;
SET @SPELL_PERMANENT_FEIGN_DEATH    := 29266;
SET @QUEST_THE_WOLF_AND_THE_KODO    := 25205;
SET @GOSSIP_SHIN_STONEPILLAR        := 11209;

UPDATE `creature` SET `spawndist`=0, `MovementType`=0 WHERE `id`=@NPC_THE_KODO;

UPDATE `creature_template` SET `spell1`=@SPELL_DASH, `AIName`='SmartAI', `VehicleId`=690, `ScriptName`='' WHERE `entry`=@NPC_THE_WOLF;
UPDATE `creature_template` SET `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@NPC_THE_KODO;
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP_SHIN_STONEPILLAR, `AIName`='SmartAI', `ScriptName`='' WHERE `entry`=@NPC_SHIN_STONEPILLAR;

UPDATE `quest_template` SET `StartScript`=0 WHERE `id`=@QUEST_THE_WOLF_AND_THE_KODO;
DELETE FROM `quest_start_scripts` WHERE id=@QUEST_THE_WOLF_AND_THE_KODO;

UPDATE `locales_quest` SET `QuestGiverTextWindow_loc3`='Der Kodo', `QuestGiverTargetName_loc3`='Der Kodo' WHERE `entry`=@QUEST_THE_WOLF_AND_THE_KODO;

DELETE FROM `spell_script_names` WHERE `spell_id`=@SPELL_RUMBLING_HOOVES;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(@SPELL_RUMBLING_HOOVES, 'spell_rumbling_hooves_73868');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP_SHIN_STONEPILLAR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(15, @GOSSIP_SHIN_STONEPILLAR, 0, 0, 0, 9, 0, @QUEST_THE_WOLF_AND_THE_KODO, 0, 0, 0, 0, 0, '', 'Show gossip only if player has Quest 25205 taken');

DELETE FROM `creature_text` WHERE `entry`=@NPC_THE_WOLF;
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@NPC_THE_WOLF, 0, 0, 'One day, The Wolf was very hungry, so he ran east to look for some food.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 1, 0, 'The Wolf ran and ran, looking for an easy meal.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 2, 0, 'The Wolf did not care for raptor meat.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 3, 0, "The Wolf was lazy, and didn't want to work for his meal.", 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 4, 0, 'The Wolf had grown tired of eating boar meat.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 5, 0, 'The more he ran, the more his stomach growled.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 6, 0, 'He happened upon a pair of battling kodos. $B Clever as he was, The Wolf decide to wait for one to defeat the other.', 42, 0, 100, 377, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 7, 0, 'When the weaker Kodo died, The Wolf approached and tried to eat it.', 42, 0, 100, 0, 0, 0, 'The Wolf'),
(@NPC_THE_WOLF, 8, 0, "The Remaining Kodo, angry at The Wolf's impetuousness, $B swiftly killed The Wolf before he had a chance to eat.", 42, 0, 100, 0, 0, 0, 'The Wolf');

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP_SHIN_STONEPILLAR;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(@GOSSIP_SHIN_STONEPILLAR, 0, 0, 'Can you tell me your fable, Shin?', 1, 1, 0, 0, 0, 0, '');

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@NPC_THE_WOLF;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@NPC_THE_WOLF, @SPELL_RIDE_VEHICLE_HARDCODED, 1, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_THE_WOLF, @NPC_THE_WOLF*100, @NPC_THE_WOLF*100+1, @NPC_SHIN_STONEPILLAR, -930695, -930696, -930697, -930698, -930699, -930700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
-- Shin Stonepillar <Far Seer>
(@NPC_SHIN_STONEPILLAR, 0, 0, 1, 62, 0, 100, 0, @GOSSIP_SHIN_STONEPILLAR, 0, 0, 0, 72, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Shin Stonepillar - On Gossip Select - Close Gossip'),
(@NPC_SHIN_STONEPILLAR, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 85, @SPELL_SUMMON_THE_WOLF, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Shin Stonepillar - Linked With Previous Event - Cast Summon The Wolf'),
-- The Wolf
(@NPC_THE_WOLF, 0, 0, 1, 54, 0, 100, 0, 0, 0, 0, 0, 75, @SPELL_HUNTING, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - Just Summoned - Add Aura Hunting'),
(@NPC_THE_WOLF, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 75, @SPELL_SEE_INVIS_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Wolf Linked With Previous Event - Add Aura See Invis 1 (Player)'),
(@NPC_THE_WOLF, 0, 2, 0, 54, 0, 100, 0, 0, 0, 0, 0, 18, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - Just Summoned - Set unit_flags UNIT_FLAG_NON_ATTACKABLE'),
(@NPC_THE_WOLF, 0, 3, 0, 54, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - Just Summoned - Emote Text 0'),
(@NPC_THE_WOLF, 0, 4, 0, 23, 0, 100, 1, @SPELL_DASH, 1, 5000, 5000, 80, @NPC_THE_WOLF*100+1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Cast Spell - Start Script (history)'),
(@NPC_THE_WOLF, 0, 5, 0, 38, 0, 100, 1, 0, 1, 0, 0, 80, @NPC_THE_WOLF*100, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Data 0 1 - Start Script'),
--
(@NPC_THE_WOLF*100+1, 9, 0, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 1'),
(@NPC_THE_WOLF*100+1, 9, 1, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 2'),
(@NPC_THE_WOLF*100+1, 9, 2, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 1, 3, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 3'),
(@NPC_THE_WOLF*100+1, 9, 3, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 4'),
(@NPC_THE_WOLF*100+1, 9, 4, 0, 0, 0, 100, 1, 7000, 7000, 0, 0, 1, 5, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 5'),
--
(@NPC_THE_WOLF*100, 9, 0, 0, 0, 0, 100, 1, 500, 500, 0, 0, 103, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Stop Movement'),
(@NPC_THE_WOLF*100, 9, 1, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 1, 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 6'),
(@NPC_THE_WOLF*100, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 45, 0, 2, 0, 0, 0, 0, 9, @NPC_THE_KODO, 0, 10, 0, 0, 0, 0, 'The Wolf - On Script - Set Data 0 2'),
(@NPC_THE_WOLF*100, 9, 3, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 1, 7, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 7'),
(@NPC_THE_WOLF*100, 9, 4, 0, 0, 0, 100, 1, 500, 500, 0, 0, 103, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Start Movement'),
(@NPC_THE_WOLF*100, 9, 5, 0, 0, 0, 100, 1, 500, 500, 0, 0, 59, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Set Run (off)'),
(@NPC_THE_WOLF*100, 9, 6, 0, 0, 0, 100, 1, 500, 500, 0, 0, 69, 0, 0, 0, 0, 0, 0, 19, @NPC_THE_KODO, 10, 1, 0, 0, 0, 0, 'The Wolf - On Script - Move toward dead Kodo'),
(@NPC_THE_WOLF*100, 9, 7, 0, 0, 0, 100, 1, 5000, 5000, 0, 0, 1, 8, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Emote Text 8'),
(@NPC_THE_WOLF*100, 9, 8, 0, 0, 0, 100, 1, 500, 500, 0, 0, 45, 0, 3, 0, 0, 0, 0, 9, @NPC_THE_KODO, 0, 10, 0, 0, 0, 0, 'The Wolf - On Script - Set Data 0 3'),
(@NPC_THE_WOLF*100, 9, 9, 0, 0, 0, 100, 0, 500, 500, 0, 0, 28, @SPELL_SEE_INVIS_1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Remove Aura See Invis 1 (Player)'),

(@NPC_THE_WOLF*100, 9, 10, 0, 0, 0, 100, 0, 500, 500, 0, 0, 75, @SPELL_PERMANENT_FEIGN_DEATH, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Add aura Permanent Feign Death'),
(@NPC_THE_WOLF*100, 9, 11, 0, 0, 0, 100, 0, 500, 500, 0, 0, 33, @NPC_THE_KODO, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Give Kill Credit'),
(@NPC_THE_WOLF*100, 9, 12, 0, 0, 0, 100, 1, 4000, 4000, 0, 0, 62, 1, 0, 0, 0, 0, 0, 7, 0, 0, 0, 1288.20, -4335.85, 34.03, 3.37, 'The Wolf - On Script - Teleport to Player'), 
(@NPC_THE_WOLF*100, 9, 13, 0, 0, 0, 100, 1, 500, 500, 0, 0, 41, 1000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Wolf - On Script - Force Despawn'),
-- The Kodo
-- group 1
(-930695, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930695, 0, 1, 0, 10, 0, 100, 0, 1, 10, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 10, 0, 0, 0, 0, 'The Kodo - On Range - Set Data 0 1'),
(-930695, 0, 2, 0, 38, 0, 100, 0, 0, 2, 0, 0, 5, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Play Emote STATE_STAND'),
(-930695, 0, 3, 4, 38, 0, 100, 0, 0, 3, 0, 0, 11, @SPELL_RUMBLING_HOOVES, 2, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 15, 0, 0, 0, 0, 'The Kodo - On Data 0 3 - Cast Rumbling Hooves'),
(-930695, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn'),
(-930696, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930696, 0, 1, 2, 38, 0, 100, 0, 0, 2, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Die'),
(-930696, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 14000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn'),
-- group 2
(-930697, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930697, 0, 1, 0, 10, 0, 100, 0, 1, 10, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 10, 0, 0, 0, 0, 'The Kodo - On Range - Set Data 0 1'),
(-930697, 0, 2, 0, 38, 0, 100, 0, 0, 2, 0, 0, 5, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Play Emote STATE_STAND'),
(-930697, 0, 3, 4, 38, 0, 100, 0, 0, 3, 0, 0, 11, @SPELL_RUMBLING_HOOVES, 2, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 15, 0, 0, 0, 0, 'The Kodo - On Data 0 3 - Cast Rumbling Hooves'),
(-930697, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn'),
(-930698, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930698, 0, 1, 2, 38, 0, 100, 0, 0, 2, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Die'),
(-930698, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 14000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn'),
-- group 3
(-930699, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930699, 0, 1, 0, 10, 0, 100, 0, 1, 10, 0, 0, 45, 0, 1, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 10, 0, 0, 0, 0, 'The Kodo - On Range - Set Data 0 1'),
(-930699, 0, 2, 0, 38, 0, 100, 0, 0, 2, 0, 0, 5, 26, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Play Emote STATE_STAND'),
(-930699, 0, 3, 4, 38, 0, 100, 0, 0, 3, 0, 0, 11, @SPELL_RUMBLING_HOOVES, 2, 0, 0, 0, 0, 9, @NPC_THE_WOLF, 0, 15, 0, 0, 0, 0, 'The Kodo - On Data 0 3 - Cast Rumbling Hooves'),
(-930699, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 3000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn'),
(-930700, 0, 0, 0, 25, 0, 100, 0, 0, 0, 0, 0, 5, 438, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Reset - Play Emote STATE_ATTACK_UNARMED - Wolf and Kodos'),
(-930700, 0, 1, 2, 38, 0, 100, 0, 0, 2, 0, 0, 37, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - On Data 0 2 - Die'),
(-930700, 0, 2, 0, 61, 0, 100, 0, 0, 0, 0, 0, 41, 14000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'The Kodo - Linked With Previous Event - Force Despawn');
