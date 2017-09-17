DELETE FROM `creature` WHERE `zoneId`='876';

DELETE FROM `gameobject` WHERE `zoneId`='876';

-- add the mailbox xD
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `protect_anti_doublet`) VALUES ('173422', '191948', '1', '876', '876', '1', '65535', '16219.2', '16271.3', '13.0077', '4.99032', '0', '0', '0.602342', '-0.798238', '300', '0', '1', '0', NULL);
