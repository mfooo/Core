-- instance mount hyjal fixes

-- creature Template
     -- Tyrande Whisperwind 
	UPDATE `creature_template` SET `npcflag` = npcflag|1 WHERE `entry` = '17948';

-- Respawntime
     -- Thrall and Jaina Proudmore
	UPDATE creature SET spawntimesecs=600 WHERE id IN (17852, 17772); 
	UPDATE creature_template SET rank=1 WHERE entry = 17772;

-- EventAI 
     -- Towering Infernal
	DELETE FROM creature_ai_scripts WHERE id=1781802;
	INSERT INTO creature_ai_scripts VALUES
	(1781802, 17818, 0, 0, 100, 3, 2000, 2000, 2000, 2000, 11, 36057, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Towering Infernal - Cast Burning Maul as DMG AoE');
