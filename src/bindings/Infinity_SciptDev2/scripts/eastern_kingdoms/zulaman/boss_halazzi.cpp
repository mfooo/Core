/* Copyright (C) 2006 - 2011 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program; if not, write to the Free Software
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/* ScriptData
SDName: boss_Halazzi
SD%Complete: 80
SDComment:
SDCategory: Zul¡äAman
EndScriptData */

#include "precompiled.h"
#include "zulaman.h"
//#include "spell.h"

//(-1568043,'Come, fools. Fill ma empty cages...',12029,1,0,0,'halazzi SAY_EVENT1'),
//(-1568044,'I be waitin, strangers. Your deaths gonna make me stronger!',12030,1,0,0,'halazzi SAY_EVENT2'),

enum
{
    SAY_AGGRO                      = -1568034, //(-1568034,'Get on ya knees and bow.... to da fang and claw!',12020,1,0,0,'halazzi SAY_AGGRO'),
    SAY_SPLIT                      = -1568035, //(-1568035,'I fight wit\' untamed spirit....',12021,1,0,0,'halazzi SAY_SPLIT'),
    SAY_MERGE                      = -1568036,//(-1568036,'Spirit, come back to me!',12022,1,0,0,'halazzi SAY_MERGE'),
    SAY_SABERLASH1                 = -1568037,//(-1568037,'Me gonna carve ya now!',12023,1,0,0,'halazzi SAY_SABERLASH1'),
    SAY_SABERLASH2                 = -1568038,//(-1568038,'You gonna leave in pieces!',12024,1,0,0,'halazzi SAY_SABERLASH2'),
    SAY_BERSERK                    = -1568039,//(-1568039,'Whatch you be doing? Pissin\' yourselves...',12025,1,0,0,'halazzi SAY_BERSERK'),
    SAY_KILL1                      = -1568040,//(-1568040,'You cant fight the power!',12026,1,0,0,'halazzi SAY_KILL1'),
    SAY_KILL2                      = -1568041,//(-1568041,'You gonna fail!',12027,1,0,0,'halazzi SAY_KILL2'),
    SAY_DEATH                      = -1568042,//(-1568042,'Chaga... choka\'jinn.',12028,1,0,0,'halazzi SAY_DEATH'),

    SPELL_DUAL_WIELD               = 29651,
    SPELL_SABER_LASH               = 43267,
    SPELL_FRENZY                   = 43139,
    SPELL_FLAMESHOCK               = 43303,
    SPELL_EARTHSHOCK               = 43305,
    SPELL_TRANSFORM_SPLIT          = 43142,
    SPELL_TRANSFORM_SPLIT2         = 43573,
    SPELL_TRANSFORM_MERGE          = 43271,
    SPELL_SUMMON_LYNX              = 43143,
    SPELL_SUMMON_TOTEM             = 43302,
    SPELL_BERSERK                  = 45078,
    SPELL_LIGHTNING                = 43301,

    MOB_SPIRIT_LYNX                = 24143,
    MOB_TOTEM                      = 24224   // totem handled by eventAI
};

enum PhaseHalazzi
{
    PHASE_NONE = 0,
    PHASE_LYNX = 1,
    PHASE_SPLIT = 2,
    PHASE_HUMAN = 3,
    PHASE_MERGE = 4,
    PHASE_ENRAGE = 5
};

struct MANGOS_DLL_DECL boss_halazziAI : public ScriptedAI
{
    boss_halazziAI(Creature *c) : ScriptedAI(c)
    {
        pInstance = ((ScriptedInstance*)c->GetInstanceData());
        Reset();
        // wait for core patch be accepted
        SpellEntry *TempSpell = (SpellEntry*)GetSpellStore()->LookupEntry(SPELL_SUMMON_TOTEM);
        if (TempSpell && TempSpell->EffectImplicitTargetA[0] != 1)
            TempSpell->EffectImplicitTargetA[0] = 1;
        // need to find out what controls totem's spell cooldown
        TempSpell = (SpellEntry*)GetSpellStore()->LookupEntry(SPELL_LIGHTNING);
        if (TempSpell && TempSpell->CastingTimeIndex != 5)
            TempSpell->CastingTimeIndex = 5; // 2000 ms casting time
    }

    ScriptedInstance *pInstance;

    uint32 FrenzyTimer;
    uint32 SaberlashTimer;
    uint32 ShockTimer;
    uint32 TotemTimer;
    uint32 CheckTimer;
    uint32 BerserkTimer;

    uint32 TransformCount;

    PhaseHalazzi Phase;

    uint64 LynxGUID;

    void Reset()
    {
		if (pInstance)
		{
            pInstance->SetData(TYPE_HALAZZI, NOT_STARTED);
			if (GameObject* pEncounterDoor = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_HALAZZIFRONTDOOR)))
				pEncounterDoor->SetGoState(GO_STATE_READY);
		}

        TransformCount = 0;
        BerserkTimer = 600000;
        CheckTimer = 1000;

        DoCastSpellIfCan(m_creature, SPELL_DUAL_WIELD, true);

        Phase = PHASE_NONE;
        EnterPhase(PHASE_LYNX);
    }

    void Aggro(Unit *who)
    {
		if (pInstance)
            pInstance->SetData(TYPE_HALAZZI, IN_PROGRESS);

        DoScriptText(SAY_AGGRO, m_creature);
        EnterPhase(PHASE_LYNX);
    }

    void JustSummoned(Creature* summon)
    {
        summon->AI()->AttackStart(m_creature->getVictim());
        if (summon->GetEntry() == MOB_SPIRIT_LYNX)
            LynxGUID = summon->GetGUID();
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= m_creature->GetHealth() && Phase != PHASE_ENRAGE)
            damage = 0;
    }

    void SpellHit(Unit *caster, const SpellEntry *spell)
    {
        if (spell->Id == SPELL_TRANSFORM_SPLIT2)
            EnterPhase(PHASE_HUMAN);
    }

    void AttackStart(Unit *who)
    {
        if (Phase != PHASE_MERGE)
            ScriptedAI::AttackStart(who);
    }

    void EnterPhase(PhaseHalazzi NextPhase)
    {
        switch(NextPhase)
        {
        case PHASE_LYNX:
        case PHASE_ENRAGE:
            if (Phase == PHASE_MERGE)
            {
                m_creature->CastSpell(m_creature, SPELL_TRANSFORM_MERGE, true);
                m_creature->Attack(m_creature->getVictim(), true);
                m_creature->GetMotionMaster()->MoveChase(m_creature->getVictim());
            }
            if (Unit *Lynx = m_creature->GetMap()->GetUnit( LynxGUID))
            {
                Lynx->SetVisibility(VISIBILITY_OFF);
                Lynx->SetDeathState(JUST_DIED);
            }
            m_creature->SetMaxHealth(600000);
            m_creature->SetHealth(600000 - 150000 * TransformCount);
            FrenzyTimer = 16000;
            SaberlashTimer = 20000;
            ShockTimer = 10000;
            TotemTimer = 12000;
            break;
        case PHASE_SPLIT:
            DoScriptText(SAY_SPLIT, m_creature);
            m_creature->CastSpell(m_creature, SPELL_TRANSFORM_SPLIT, true);
            break;
        case PHASE_HUMAN:
            //DoCast(m_creature, SPELL_SUMMON_LYNX, true);
            DoSpawnCreature(MOB_SPIRIT_LYNX, 0,0,0,0, TEMPSUMMON_CORPSE_DESPAWN, 0);
            m_creature->SetMaxHealth(400000);
            m_creature->SetHealth(400000);
            ShockTimer = 10000;
            TotemTimer = 12000;
            break;
        case PHASE_MERGE:
            if (Unit *Lynx = m_creature->GetMap()->GetUnit( LynxGUID))
            {
                DoScriptText(SAY_MERGE, m_creature);
                Lynx->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                Lynx->GetMotionMaster()->Clear();
                Lynx->GetMotionMaster()->MoveFollow(m_creature, 0, 0);
                m_creature->GetMotionMaster()->Clear();
                m_creature->GetMotionMaster()->MoveFollow(Lynx, 0, 0);
                TransformCount++;
            }break;
        default:
            break;
        }
        Phase = NextPhase;
    }

     void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() && !m_creature->getVictim())
            return;

        if (BerserkTimer < diff)
        {
            DoScriptText(SAY_BERSERK, m_creature);
            DoCastSpellIfCan(m_creature, SPELL_BERSERK, true);
            BerserkTimer = 60000;
        }else BerserkTimer -= diff;

        if (Phase == PHASE_LYNX || Phase == PHASE_ENRAGE)
        {
            if (SaberlashTimer < diff)
            {
                // A tank with more than 490 defense skills should receive no critical hit
                //m_creature->CastSpell(m_creature, 41296, true);
                m_creature->CastSpell(m_creature->getVictim(), SPELL_SABER_LASH, true);
                //m_creature->RemoveAurasDueToSpell(41296);

                switch (rand()%2)
                {
                    case 0: DoScriptText(SAY_SABERLASH1, m_creature); break;
                    case 1: DoScriptText(SAY_SABERLASH2, m_creature); break;
                }
                SaberlashTimer = 30000;
            }else SaberlashTimer -= diff;

            if (FrenzyTimer < diff)
            {
                DoCastSpellIfCan(m_creature, SPELL_FRENZY);
                FrenzyTimer = (10+rand()%5)*1000;
            }else FrenzyTimer -= diff;

            if (Phase == PHASE_LYNX)
            {
                if (CheckTimer < diff)
                {
                    if (m_creature->GetHealth() * 4 < m_creature->GetMaxHealth() * (3 - TransformCount))
                        EnterPhase(PHASE_SPLIT);
                    CheckTimer = 1000;
                }else CheckTimer -= diff;
            }
        }

        if (Phase == PHASE_HUMAN || Phase == PHASE_ENRAGE)
        {
            if (TotemTimer < diff)
            {
                DoCastSpellIfCan(m_creature, SPELL_SUMMON_TOTEM);
                TotemTimer = 20000;
            }else TotemTimer -= diff;

            if (ShockTimer < diff)
            {
                if (Unit* target = m_creature->SelectAttackingTarget(ATTACKING_TARGET_RANDOM,0))
                {
                    if (target->IsNonMeleeSpellCasted(false))
                        DoCastSpellIfCan(target,SPELL_EARTHSHOCK);
                    else
                        DoCastSpellIfCan(target,SPELL_FLAMESHOCK);
                    ShockTimer = 10000 + rand()%5000;
                }
            }else ShockTimer -= diff;

            if (Phase == PHASE_HUMAN)
            {
                if (CheckTimer < diff)
                {
                    if (m_creature->GetHealth() * 10 < m_creature->GetMaxHealth())
                        EnterPhase(PHASE_MERGE);
                    else
                    {
                        Unit *Lynx = m_creature->GetMap()->GetUnit( LynxGUID);
                        if (Lynx && Lynx->GetHealth() * 10 < Lynx->GetMaxHealth())
                            EnterPhase(PHASE_MERGE);
                    }
                    CheckTimer = 1000;
                }else CheckTimer -= diff;
            }
        }

        if (Phase == PHASE_MERGE)
        {
            if (CheckTimer < diff)
            {
                Unit *Lynx = m_creature->GetMap()->GetUnit( LynxGUID);
                if (Lynx && m_creature->IsWithinDistInMap(Lynx, 6.0f))
                {
                    if (TransformCount < 3)
                        EnterPhase(PHASE_LYNX);
                    else
                        EnterPhase(PHASE_ENRAGE);
                }
                CheckTimer = 1000;
            }else CheckTimer -= diff;
        }

        DoMeleeAttackIfReady();
    }

    void KilledUnit(Unit* victim)
    {
        switch(rand()%2)
        {
        case 0: DoScriptText(SAY_KILL1, m_creature); break;
        case 1: DoScriptText(SAY_KILL2, m_creature); break;
        }
    }

    void JustDied(Unit* Killer)
    {
		if(pInstance)
		{
            pInstance->SetData(TYPE_HALAZZI, DONE);
            if (GameObject* pEncounterDoor = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_HALAZZIFRONTDOOR)))
                pEncounterDoor->SetGoState(GO_STATE_ACTIVE);
            if (pInstance->GetData64(DATA_BOSSKILLED)>=4) {
                if (GameObject* pEncounterDoor = pInstance->instance->GetGameObject(pInstance->GetData64(DATA_HEXLORDGATE)))
                    pEncounterDoor->SetGoState(GO_STATE_ACTIVE);
			}
		}


        DoScriptText(SAY_DEATH, m_creature);
    }
};

/****
** Spirits Lynx AI
****/

enum lynx
{
    //lynx spells
    SPELL_LYNX_FRENZY      = 43290,
    SPELL_SHRED_ARMOR      = 43243
};

struct MANGOS_DLL_DECL boss_spiritlynxAI : public ScriptedAI
{
    boss_spiritlynxAI(Creature *c) : ScriptedAI(c) { Reset(); }

    uint32 FrenzyTimer;
    uint32 shredder_timer;

    void Reset()
    {
        FrenzyTimer = (30+rand()%20)*1000;  //frenzy every 30-50 seconds
        shredder_timer = 4000;
    }

    void DamageTaken(Unit *done_by, uint32 &damage)
    {
        if (damage >= m_creature->GetHealth())
            damage = 0;
    }

    void AttackStart(Unit *who)
    {
        if (!m_creature->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE))
            ScriptedAI::AttackStart(who);
    }

    void Aggro(Unit *who) { m_creature->SetInCombatWithZone(); }

    void UpdateAI(const uint32 diff)
    {
        if (!m_creature->SelectHostileTarget() || !m_creature->getVictim())
            return;

        if (FrenzyTimer < diff)
        {
            DoCastSpellIfCan(m_creature, SPELL_LYNX_FRENZY);
            FrenzyTimer = (30+rand()%20)*1000;
        }else FrenzyTimer -= diff;

        if (shredder_timer < diff)
        {
            DoCastSpellIfCan(m_creature->getVictim(), SPELL_SHRED_ARMOR);
            shredder_timer = 4000;
        }else shredder_timer -= diff;

        DoMeleeAttackIfReady();
    }

};

CreatureAI* GetAI_boss_halazziAI(Creature *_Creature)
{
    return new boss_halazziAI (_Creature);
}

CreatureAI* GetAI_boss_spiritlynxAI(Creature *_Creature)
{
    return new boss_spiritlynxAI (_Creature);
}

void AddSC_boss_halazzi()
{
    Script *newscript;
    newscript = new Script;
    newscript->Name = "boss_halazzi";
    newscript->GetAI = &GetAI_boss_halazziAI;
    newscript->RegisterSelf();

    newscript = new Script;
    newscript->Name = "mob_halazzi_lynx";
    newscript->GetAI = &GetAI_boss_spiritlynxAI;
    newscript->RegisterSelf();
}
