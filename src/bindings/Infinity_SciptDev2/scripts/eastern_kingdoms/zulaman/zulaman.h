/* Copyright (C) 2006 - 2011 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 * This program is free software licensed under GPL version 2
 * Please see the included DOCS/LICENSE.TXT for more information */

#ifndef DEF_ZULAMAN_H
#define DEF_ZULAMAN_H

enum InstanceZA
{
    MAX_ENCOUNTER           = 7,
    MAX_VENDOR              = 2,

    SAY_INST_RELEASE        = -1568067,//(-1568067,'Zul\'jin got a surprise for ya...',12052,1,0,0,'zulaman SAY_INST_RELEASE'),
    SAY_INST_BEGIN          = -1568068,//(-1568068,'Da spirits gonna feast today! Begin da ceremonies, sacrifice da prisoners... make room for our new guests!',12053,1,0,0,'zulaman SAY_INST_BEGIN'),
    SAY_INST_PROGRESS_1     = -1568069,//(-1568069,'Take your pick, trespassers! Any of ma priests be happy to accommodate ya.',12054,1,0,0,'zulaman SAY_INST_PROGRESS_1'),
    SAY_INST_PROGRESS_2     = -1568070,//(-1568070,'Don\'t be shy. Thousands have come before you. Ya not be alone in your service.',12055,1,0,0,'zulaman SAY_INST_PROGRESS_2'),
    SAY_INST_PROGRESS_3     = -1568071,//(-1568071,'Ya gonna fail, strangers. Many try before you, but dey only make us stronger!',12056,1,0,0,'zulaman SAY_INST_PROGRESS_3'),
    SAY_INST_WARN_1         = -1568072,//(-1568072,'Your efforts was in vain, trespassers. The rituals nearly be complete.',12057,1,0,0,'zulaman SAY_INST_WARN_1'),
    SAY_INST_WARN_2         = -1568073,//(-1568073,'Soon da cages gonna be empty, da sacrifices be complete, and you gonna take dere places.',12058,1,0,0,'zulaman SAY_INST_WARN_2'),
    SAY_INST_WARN_3         = -1568074,//(-1568074,'Time be running low, strangers. Soon you gonna join da souls of dem ya failed to save.',12059,1,0,0,'zulaman SAY_INST_WARN_3'),
    SAY_INST_WARN_4         = -1568075,//(-1568075,'Make haste, ma priests! Da rituals must not be interrupted!',12060,1,0,0,'zulaman SAY_INST_WARN_4'),
    SAY_INST_SACRIF1        = -1568076,//(-1568076,'Ya make a good try... but now you gonna join da ones who already fall.',12061,1,0,0,'zulaman SAY_INST_SACRIF1'),
    SAY_INST_SACRIF2        = -1568077,//(-1568077,'Ya not do too bad. Ya efforts [...] for a small time. Come to me now. Ya prove yourself worthy offerings.',12062,1,0,0,'zulaman SAY_INST_SACRIF2'),
    SAY_INST_COMPLETE       = -1568078,//(-1568078,'Watch now. Every offering gonna strengthen our ties to da spirit world. Soon, we gonna be unstoppable!',12065,1,0,0,'zulaman SAY_INST_COMPLETE');

    WORLD_STATE_ID          = 3104,
    WORLD_STATE_COUNTER     = 3106,

    TYPE_EVENT_RUN          = 1,
    TYPE_AKILZON            = 2,
    TYPE_NALORAKK           = 3,
    TYPE_JANALAI            = 4,
    TYPE_HALAZZI            = 5,
    TYPE_MALACRASS          = 6,
    TYPE_ZULJIN             = 7,

    TYPE_RAND_VENDOR_1      = 8,
    TYPE_RAND_VENDOR_2      = 9,

    DATA_AKILZON            = 10,
    DATA_NALORAKK           = 11,
    DATA_JANALAI            = 12,
    DATA_HALAZZI            = 13,
    DATA_MALACRASS          = 14,
    DATA_ZULJIN             = 15,
    DATA_HARRISON           = 16,
    DATA_SPIRIT_LYNX        = 17,

    TYPE_CHESTLOOTED		= 18,

    DATA_J_EGGS_RIGHT       = 19,
    DATA_J_EGGS_LEFT        = 20,

    DATA_GO_GONG            = 21,
    DATA_GO_MALACRASS_GATE  = 22,
    DATA_GO_ENTRANCE        = 23,

    DATA_HEXLORDGUID        = 24,
    DATA_HEXLORDDOOR        = 25,
    DATA_AKILZONDOOR        = 26,
    DATA_ZULJINDOOR         = 27,
    DATA_ENTRANCEDOOR       = 28,
    DATA_HALAZZIFRONTDOOR   = 29,
    DATA_HEXLORDGATE        = 30,
    DATA_BOSSKILLED         = 31,

    NPC_EGG                 = 23817,
    NPC_SPIRIT_LYNX         = 24143
};

#endif