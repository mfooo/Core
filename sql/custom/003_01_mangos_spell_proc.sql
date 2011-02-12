/*Item - Death Knight T10 Tank 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70652;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70652','0','15',0x00000008,'0','0',0x00004000,'0','0','0','0');

/*Item - Paladin T10 Protection 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70761;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70761','0','10','0',0x80004000,'0',0x00004000,'0','0','0','0');

/*Item - Paladin T10 Holy 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70756;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70756','0','10',0x00200000,'0','0',0x00004000,'0','0','0','0');

/*Item - Hunter T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70727;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70727','0','9',0x00000001,'0','0','0','0','0','0','0');

/*Item - Hunter T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70730;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70730','0','9',0x00004000,0x00001000,'0','0','0','0','0','0');

/* Item - Priest T10 Healer 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70799;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70799','0','6',0x00000800,'0','0','0','0','0','0','0');

/*Item - Shaman T10 Restoration 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70808;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70808','0','11',0x00000100,'0','0','0','2','0','0','0');

/*Item - Druid T10 Balance 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70723;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70723','0','7',0x00000005,'0','0','0','2','0','0','0');

/*Item - Rogue T10 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70805;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70805','0','8','0',0x00020000,'0',0x00004000,'0','0','0','0');

/*Item - Rogue T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70803;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70803','0','8','4063232','0','0','0','0','0','0','0');

/*Item - Shaman T10 Elemental 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70817;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70817','0','11','0',0x00001000,'0',0x00010000,'0','0','0','0');

/*Item - Shaman T10 Enhancement 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70830;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70830','0','11','0',0x00020000,'0',0x00004000,'0','0','0','0');

/*Item - Warlock T10 4P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70841;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70841','0','5',0x00000004,0x00000100,'0','0','0','0','0','0');

/*Item - Warrior T10 Melee 2P Bonus*/
DELETE FROM `spell_proc_event` WHERE entry = 70854;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES('70854','0','5','0',0x00000010,'0','0','0','0','0','0');

-- (64952) Item - Druid T8 Feral Relic ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (64952);
INSERT INTO `spell_proc_event` VALUES (64952, 0x00, 7, 0x00000000, 0x00000440, 0x00000000, 0x00000000, 0x00000000, 0.000000, 0.000000, 0);

-- (67653) Coliseum 5 Tank Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67653);
INSERT INTO `spell_proc_event` VALUES (67653, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000008, 0x00000000, 0.000000, 0.000000, 45);

-- (67670) Coliseum 5 CasterTrinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67670);
INSERT INTO `spell_proc_event` VALUES (67670, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00010000, 0x00000000, 0.000000, 0.000000, 45);

-- (67672) Coliseum 5 Melee Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67672);
INSERT INTO `spell_proc_event` VALUES (67672, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00000044, 0x00000000, 0.000000, 0.000000, 45);

-- (67667) Coliseum 5 Healer Trinket ()
DELETE FROM `spell_proc_event` WHERE `entry` IN (67667);
INSERT INTO `spell_proc_event` VALUES (67667, 0x00, 0, 0x00000000, 0x00000000, 0x00000000, 0x00004000, 0x00000000, 0.000000, 0.000000, 45);