DELETE FROM mangos_string WHERE entry > 20079 AND entry < 20102;
INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(20080, 'The battle will begin in two minutes.', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzará en dos minutos.', 'La batalla comenzará en dos minutos.', NULL),
(20081, 'The battle will begin in 1 minute.', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzará en un minuto.', 'La batalla comenzará en un minuto.', NULL),
(20082, 'The battle will begin in 30 seconds!', NULL, NULL, NULL, NULL, NULL, 'La batalla comenzará en 30 segundos. ¡Preparaos!', 'La batalla comenzará en 30 segundos. ¡Preparaos!', NULL),
(20083, 'The battle has begun!', NULL, NULL, NULL, NULL, NULL,'¡La batalla ha comenzado!', '¡La batalla ha comenzado!', NULL),
(20084, 'the alliance keep', NULL, NULL, NULL, NULL, NULL, 'la fortaleza de la Alianza', 'la fortaleza de la Alianza', NULL),
(20085, 'the horde keep', NULL, NULL, NULL, NULL, NULL, 'la fortaleza de la Horda', 'la fortaleza de la Horda', NULL),
(20086, '%s wins!', NULL, NULL, NULL, NULL, NULL, '¡%s gana!', '¡%s gana!', NULL),
(20087, 'The west gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, '¡La puerta Oeste de %s ha sido destruida!', '¡La puerta Oeste de %s ha sido destruida!', NULL),
(20088, 'The east gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, '¡La puerta Este de %s ha sido destruida!', '¡La puerta Este de %s ha sido destruida!', NULL),
(20089, 'The south gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, '¡La puerta Sur de %s ha sido destruida!', '¡La puerta Sur de %s ha sido destruida!', NULL),
(20090, 'The north gate of %s is destroyed!', NULL, NULL, NULL, NULL, NULL, '¡La puerta Norte de %s ha sido destruida!', '¡La puerta Norte de %s ha sido destruida!', NULL),
(20091, '$n has assaulted the %s', NULL, NULL, NULL, NULL, NULL, '¡$n ha asaltado %s!', '¡$n ha asaltado %s!', NULL),
(20092, '$n has defended the %s', NULL, NULL, NULL, NULL, NULL, '¡$n ha defendido %s!', '¡$n ha defendido %s!', NULL),
(20093, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', NULL, NULL, NULL, NULL, NULL, '¡$n asalta %s! ¡Si no es defendido, %s lo controlará en un minuto!', '¡$n asalta %s! ¡Si no es defendido, %s lo controlará en un minuto!', NULL),
(20094, 'The %s has taken the %s', NULL, NULL, NULL, NULL, NULL, '%s ha tomado %s.', '', NULL),
(20095, 'Workshop', NULL, NULL, NULL, NULL, NULL, 'el Taller', 'el Taller', NULL),
(20096, 'Docks', NULL, NULL, NULL, NULL, NULL, 'los Muelles', 'los Muelles', NULL),
(20097, 'Refinery', NULL, NULL, NULL, NULL, NULL, 'la Refinería', 'la Refinería', NULL),
(20098, 'Quarry', NULL, NULL, NULL, NULL, NULL, 'la Cantera', 'la Cantera', NULL),
(20099, 'Hangar', NULL, NULL, NULL, NULL, NULL, 'el Hangar', 'el Hangar', NULL),
(20100, 'Alliance', NULL, NULL, NULL, NULL, NULL, 'La Alianza', 'La Alianza', NULL),
(20101, 'Horde', NULL, NULL, NULL, NULL, NULL, 'La Horda', 'La Horda', NULL);

-- Alliance Gunship Cannon
UPDATE `creature_template` SET `spell1`=69495,`VehicleId`=452, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34929;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34929);
INSERT INTO `npc_spellclick_spells` VALUES ('34929', '60968', '0', '0', '0', '1');
-- Horde Gunship Cannon
UPDATE `creature_template` SET `spell1`=68825,`VehicleId`=453, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34935;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34935);
INSERT INTO `npc_spellclick_spells` VALUES ('34935', '60968', '0', '0', '0', '1');
-- Keep Cannon
UPDATE `creature_template` SET `VehicleId`=160,`spell1`=67452,`spell2`=68169, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34944;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34944);
INSERT INTO `npc_spellclick_spells` VALUES ('34944', '60968', '0', '0', '0', '1');
-- Catapult
UPDATE `creature_template` SET `VehicleId`=438,`spell1`=66218,`spell2`=66296, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34793;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34793);
INSERT INTO `npc_spellclick_spells` VALUES ('34793', '60968', '0', '0', '0', '1');
-- Demolisher
UPDATE `creature_template` SET `VehicleId`=509,`spell1`=67442,`spell2`=60206, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34775;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34775);
INSERT INTO `npc_spellclick_spells` VALUES ('34775', '60968', '0', '0', '0', '1');
-- Siege Engine
UPDATE `creature_template` SET `VehicleId`=447,`spell1`=67816,`spell2`=69502, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34776;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34776);
INSERT INTO `npc_spellclick_spells` VALUES ('34776', '60968', '0', '0', '0', '1');
-- Siege Engine
UPDATE `creature_template` SET `VehicleId`=436,`spell1`=67816,`spell2`=69502, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=35069;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (35069);
INSERT INTO `npc_spellclick_spells` VALUES ('35069', '60968', '0', '0', '0', '1');
DELETE FROM `vehicle_accessory` WHERE `entry` IN (35069, 34776);
INSERT INTO `vehicle_accessory` VALUES
(35069, 36355, 7, 1, 'Isle of Conquest Siege Engine'),
(34776, 34777, 7, 1, 'Isle of Conquest Siege Engine');
-- Glaive Thrower
UPDATE `creature_template` SET `VehicleId`=447,`spell1`=68827,`spell2`=69515, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34802;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34802);
INSERT INTO `npc_spellclick_spells` VALUES ('34802', '60968', '0', '0', '0', '1');
-- Glaive Thrower
UPDATE `creature_template` SET `VehicleId`=447,`spell1`=68827,`spell2`=69515, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=35273;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (35273);
INSERT INTO `npc_spellclick_spells` VALUES ('35273', '60968', '0', '0', '0', '1');
-- Flame Turret
UPDATE `creature_template` SET `spell1`=68832, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34778;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34778);
INSERT INTO `npc_spellclick_spells` VALUES ('34778', '60968', '0', '0', '0', '1');
-- Flame Turret
UPDATE `creature_template` SET `spell1`=68832, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=36356;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (36356);
INSERT INTO `npc_spellclick_spells` VALUES ('36356', '60968', '0', '0', '0', '1');
-- Siege Turret
UPDATE `creature_template` SET `spell1`=67462,`spell2`=69505, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=34777;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (34777);
INSERT INTO `npc_spellclick_spells` VALUES ('34777', '60968', '0', '0', '0', '1');
-- Siege Turret
UPDATE `creature_template` SET `spell1`=67462,`spell2`=69505, `iconName` = 'vehicleCursor', ScriptName = 'npc_battleground_vehicle' WHERE `entry`=36355;
DELETE FROM `npc_spellclick_spells` WHERE npc_entry IN (36355);
INSERT INTO `npc_spellclick_spells` VALUES ('36355', '60968', '0', '0', '0', '1');
-- Catapult speed
UPDATE `creature_template` SET `speed_run`=2.428571,`speed_walk`=2.8 WHERE `entry`=34793;

-- Update alliance boss faction 
UPDATE `creature_template` SET `faction_A`=84, `faction_H`=84 WHERE `entry`=34924;
-- Update horde boss faction 
UPDATE `creature_template` SET `faction_A`=83, `faction_H`=83 WHERE `entry`=34922;
-- Update Kor Kron Guard faction 
UPDATE `creature_template` SET `faction_A`=83, `faction_H`=83 WHERE `entry`=34918;
-- Update Npc Seven TH Legion Infantry faction 
UPDATE `creature_template` SET `faction_A`=84, `faction_H`=84 WHERE `entry`=34919;

-- those doors are not selectables
UPDATE `gameobject_template` SET `flags`=0x00000021 WHERE `entry` IN (195223,195703,195491,195451,195452,195437,195436);

-- alliance bombs, they can be only used by the horde
UPDATE `gameobject_template` SET `faction`=1995 WHERE `entry`=195332;
-- horde bombs, they can be only used by the alliance
UPDATE `gameobject_template` SET `faction`=1997 WHERE `entry`=195333;

-- horde teleporters
UPDATE `gameobject_template` SET `faction`=1995 WHERE `entry` IN  (195314,195313);
-- alliance teleporters
UPDATE `gameobject_template` SET `faction`=1997 WHERE `entry` IN (195315,195316);

-- Refinery's and Quarry's spells.
DELETE FROM `spell_area` WHERE `spell` IN (68719,68720);
INSERT INTO `spell_area` (`spell`,`area`) VALUES 
(68719,4741),
(68719,4747),
(68719,4748),
(68719,4749),
(68719,4750),
(68719,4751),
(68719,4752),
(68719,4753),
(68719,4710),
(68720,4741),
(68720,4747),
(68720,4748),
(68720,4749),
(68720,4750),
(68720,4751),
(68720,4752),
(68720,4710),
(68720,4753);

-- Spirit guides (This must be done with BG events - this is hacky way)
DELETE FROM creature WHERE guid = '4456542';
INSERT INTO creature VALUES (4456542,13117,628,2,1,0,413,1300.96,-833.926,48.9162,1.54371,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456545';
INSERT INTO creature VALUES (4456545,13116,628,2,1,0,3043,1300.96,-833.926,48.9162,1.54371,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456548';
INSERT INTO creature VALUES (4456548,13117,628,2,1,0,413,774.936,-649.506,9.74979,4.73256,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456551';
INSERT INTO creature VALUES (4456551,13116,628,2,1,0,3043,774.936,-649.506,9.74979,4.73256,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456554';
INSERT INTO creature VALUES (4456554,13117,628,2,1,0,413,802.641,-1123.01,134.439,2.17347,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456557';
INSERT INTO creature VALUES (4456557,13116,628,2,1,0,3043,802.641,-1123.01,134.439,2.17347,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456560';
INSERT INTO creature VALUES (4456560,13117,628,2,1,0,413,278.452,-883.192,49.889,1.62151,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456563';
INSERT INTO creature VALUES (4456563,13116,628,2,1,0,3043,278.452,-883.192,49.889,1.62151,25,5,0,37890,6310,0,0);
DELETE FROM creature WHERE guid = '4456580';
INSERT INTO creature VALUES (4456580,13117,628,2,1,0,413,629.43,-279.53,11.321,0.106643,25,5,0,37420,6310,0,0);
DELETE FROM creature WHERE guid = '4456583';
INSERT INTO creature VALUES (4456583,13116,628,2,1,0,3043,629.43,-279.53,11.321,0.106643,25,5,0,37890,6310,0,0);