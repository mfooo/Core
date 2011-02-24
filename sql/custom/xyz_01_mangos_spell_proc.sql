/*Fingers of Frost - still needed*/
DELETE FROM `spell_proc_event` WHERE `entry` IN (44543,44545);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMaskA0`, `SpellFamilyMaskA1`, `SpellFamilyMaskA2`, `SpellFamilyMaskB0`, `SpellFamilyMaskB1`, `SpellFamilyMaskB2`, `SpellFamilyMaskC0`, `SpellFamilyMaskC1`, `SpellFamilyMaskC2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(44543, 0, 3, 33555104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 0),
(44545, 0, 3, 33555104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 15, 0);

/* Decimation */
UPDATE `spell_proc_event` SET `SpellFamilyMaskB0` = 0x000000C0, `SpellFamilyMaskB1` = 0x00000000, `SpellFamilyMaskB2` = 0x00000000 WHERE `entry` =63156;
