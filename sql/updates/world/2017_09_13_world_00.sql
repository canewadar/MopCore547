INSERT INTO `areatrigger_teleport` (`id`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('9244', 'Siege of Orgrimmar (Out)', '870', '1224.61', '619.85', '331', '2.33');
INSERT INTO `areatrigger_teleport` (`id`, `name`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('9245', 'Siege of Orgrimmar (Entrance)', '1136', '1441.29', '314.84', '289.3', '1.58');

UPDATE `access_requirement` SET `level_min`='90'  WHERE `mapId`='1136';
