-- Zul'Aman
UPDATE instance_template SET ScriptName='instance_zulaman' WHERE map=568;
UPDATE creature_template SET ScriptName='npc_harrison_jones_za' WHERE entry=24358;
UPDATE gameobject_template SET ScriptName='go_strange_gong' WHERE entry=187359;
UPDATE creature_template SET ScriptName='npc_forest_frog' WHERE entry=24396;
UPDATE `creature_template` SET `ScriptName` = 'npc_zulaman_hostage' WHERE `entry` IN (23790, 23999, 24024, 24001);

-- boss_halazzi
UPDATE `creature_template` SET `ScriptName` = 'boss_halazzi' WHERE `entry` = '23577';
UPDATE `creature_template` SET `ScriptName` = 'mob_halazzi_lynx' WHERE `entry` = '24143';
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '24224'; -- lightling totem handled by EventAI

-- boss janalai
UPDATE `creature_template` SET `ScriptName` = 'boss_janalai' WHERE `entry` = '23578';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatcher' WHERE `entry` = '23818';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_hatchling' WHERE `entry` = '23598';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_egg' WHERE `entry` = '23817';
UPDATE `creature_template` SET `ScriptName` = 'mob_janalai_firebomb' WHERE `entry` = '23920';

-- boss malacrass
UPDATE `creature_template` SET `ScriptName` = 'boss_hexlord_malacrass' WHERE `entry` =24239;
UPDATE `creature_template` SET `ScriptName` = 'boss_alyson_antille' WHERE `entry` =24240;
UPDATE `creature_template` SET `ScriptName` = 'boss_thurg' WHERE `entry` =24241;
UPDATE `creature_template` SET `ScriptName` = 'boss_slither' WHERE `entry` =24242;
UPDATE `creature_template` SET `ScriptName` = 'boss_lord_raadan' WHERE `entry` =24243;
UPDATE `creature_template` SET `ScriptName` = 'boss_gazakroth' WHERE `entry` =24244;
UPDATE `creature_template` SET `ScriptName` = 'boss_fenstalker' WHERE `entry` =24245;
UPDATE `creature_template` SET `ScriptName` = 'boss_darkheart' WHERE `entry` =24246;
UPDATE `creature_template` SET `ScriptName` = 'boss_koragg' WHERE `entry` =24247;
UPDATE `creature_template` SET `faction_A` = '1890', `faction_H` = '1890' WHERE `entry` in ('24240', '24241', '24242', '24243', '24244', '24245', '24246', '24247');

-- boss akilzon
UPDATE `creature_template` set `ScriptName` = 'boss_akilzon' where entry = 23574;
UPDATE `creature_template` set `ScriptName` = 'mob_akilzon_eagle' where `entry`=24858;  /*default was event ai*/

-- boss nalorakk
UPDATE `creature_template` SET `ScriptName` = 'boss_nalorakk' WHERE `entry` = 23576;


-- boss ZulJin
UPDATE `creature_template` SET `ScriptName` = 'boss_zuljin' WHERE `entry` =23863;
UPDATE `creature_template` SET `ScriptName` = 'do_nothing' WHERE `entry` = '24187';
UPDATE `creature_template` SET `ScriptName` = 'mob_zuljin_vortex' WHERE `entry` = '24136';
UPDATE `creature_template` SET `minlevel` = '73', `maxlevel` = '73' WHERE `entry` IN (24187, 24136);
DELETE FROM `spell_proc_event` WHERE `entry` = 43983;
INSERT INTO `spell_proc_event` VALUES ('43983', '0', '0', '0', '0', '0', '16384', '0', '0');
DELETE FROM `spell_script_target` WHERE `entry` = 42577;
INSERT INTO `spell_script_target` VALUES ('42577', '1', '24136');


/*
-- Creature spawn on the way to akil'zon
DELETE FROM `creature` WHERE `guid` BETWEEN 230000 AND 230010;
INSERT INTO `creature` (`guid`,`id`, `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `curhealth`, `curmana`) VALUES
(230000, 23581, 568, 224.096924, 1437.665771, 26.265295, 1.608510, 7200, 66000, 31550),
(230001, 24179, 568, 233.399994, 1438.020020, 26.299900, 1.608510, 7200, 57000, 32310),
(230002, 23582, 568, 234.033142, 1421.244629, 31.651335, 1.608510, 7200, 86000, 0),
(230003, 23542, 568, 223.330750, 1420.840820, 31.219351, 1.608510, 7200, 86000, 0),
(230004, 23581, 568, 223.538971, 1402.530029, 37.571327, 1.608510, 7200, 66000, 31550),
(230005, 24179, 568, 232.815765, 1402.880127, 37.486328, 1.608510, 7200, 57000, 32310),
(230006, 23582, 568, 232.780609, 1384.333496, 44.486130, 1.542536, 7200, 86000, 0),
(230007, 23542, 568, 223.556198, 1384.594238, 43.710697, 1.627359, 7200, 86000, 0),
(230008, 23596, 568, 269.566864, 1377.615479, 49.321880, 3.143176, 7200, 69000, 6462),
(230009, 23596, 568, 265.754272, 1373.319580, 49.325592, 3.143176, 7200, 69000, 6462),
(230010, 23596, 568, 265.740967, 1381.712524, 49.322567, 3.143176, 7200, 69000, 6462);


-- fix spells
DELETE FROM `spell_proc_event` WHERE `entry` = 43983;
INSERT INTO `spell_proc_event` (`entry`,`procFlags`) VALUES 
('43983','16384');

-- fix gameobjects
-- doors
DELETE FROM `gameobject` WHERE `id` IN (186303, 186304, 186859, 186858);
INSERT INTO `gameobject`  (`guid`, `id`, `map`, `spawnMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(160001, 186303, 568, 1, 307.178, 1122.81, 10.0798, 0.0546852, 0, 0, 0.0273392, 0.999626, 25, 0, 0),
(160002, 186304, 568, 1, 125, 915, 34, 4.67869, 0, 0, 0.718921, -0.695091, 25, 0, 1),
(160003, 186859, 568, 1, 120.526, 733.926, 45.1114, 4.72569, 0, 0, 0.70239, -0.711792, 25, 0, 0),
(160004, 186858, 568, 1, 337.269, 1396.05, 74.4265, 0.320266, 0, 0, 0.15945, 0.987206, 25, 0, 0);

UPDATE `creature_template` SET `minlevel` = '73', `maxlevel` = '73' WHERE `entry` IN (24187);
UPDATE `creature_template` SET `npcflag` = 0 WHERE `entry` = 24396; -- set npcflag 0 at frogs - they will not sell things anymore 
UPDATE `creature` SET `spawnMask` = 0 WHERE `id` = 23790; -- Despawn 'Tanzar'

UPDATE `creature` SET `position_x` = '-77.4956', `position_y` = '1294.76', `position_z` = '48.487', `orientation` = '1.66278' WHERE `id` = 23576;
*/
