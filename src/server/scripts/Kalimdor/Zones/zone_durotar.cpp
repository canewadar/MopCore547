/*
* Copyright (C) 2013 Skymist Project
*
* This file is NOT free software. You may NOT copy, redistribute it or modify it.
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"
#include "Group.h"

/*######
## Quest 25134: Lazy Peons
## npc_lazy_peon
######*/

enum LazyPeonData
{
	//Spells
	SPELL_PEON_SLEEPING       = 17743,
	SPELL_AWAKEN_PEON         = 19938,
	//Gameobject
	GO_LUMBERPILE             = 175784,
	//Quest
	QUEST_LAZY_PEONS          = 25134,
	//Events
	EVENT_AWAKEN_PEON         = 1,
	EVENT_IN_POINT,
	EVENT_HOME,
	EVENT_PEON_SLEEPING,
	//Point
	POINT_1                   = 1
};

class npc_lazy_peon : public CreatureScript
{
public:
	npc_lazy_peon() : CreatureScript("npc_lazy_peon") { }

	struct npc_lazy_peonAI : public ScriptedAI
	{
		npc_lazy_peonAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			events.Reset();
			events.ScheduleEvent(EVENT_PEON_SLEEPING, 1000);
		}

		void MovementInform(uint32 /*type*/, uint32 id)
		{
			if (id == POINT_1)
				events.ScheduleEvent(EVENT_IN_POINT, 1000);
		}

		void SpellHit(Unit* caster, const SpellInfo* spell)
		{
			if (spell->Id == SPELL_AWAKEN_PEON && caster->GetTypeId() == TYPEID_PLAYER && CAST_PLR(caster)->GetQuestStatus(QUEST_LAZY_PEONS) == QUEST_STATUS_INCOMPLETE)
			{
				caster->ToPlayer()->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
				events.ScheduleEvent(EVENT_AWAKEN_PEON, 500);
				events.CancelEvent(EVENT_PEON_SLEEPING);
			}
		}

		void UpdateAI(uint32 const diff)
		{
			events.Update(diff);

			while (uint32 eventId = events.ExecuteEvent())
			{
				switch (eventId)
				{
				case EVENT_AWAKEN_PEON:
					me->RemoveAllAuras();
					Talk(urand(0, 3));
					if (GameObject* Lumberpile = me->FindNearestGameObject(GO_LUMBERPILE, 20))
						me->GetMotionMaster()->MovePoint(POINT_1, Lumberpile->GetPositionX() - 1, Lumberpile->GetPositionY(), Lumberpile->GetPositionZ());
					break;
				case EVENT_IN_POINT:
					me->HandleEmoteCommand(EMOTE_STATE_WORK_CHOPWOOD);
					events.ScheduleEvent(EVENT_HOME, 300000);
					break;
				case EVENT_HOME:
					me->HandleEmoteCommand(EMOTE_STATE_NONE);
					me->GetMotionMaster()->MoveTargetedHome();
					events.ScheduleEvent(EVENT_PEON_SLEEPING, 1000);
					break;
				case EVENT_PEON_SLEEPING:
					DoCast(SPELL_PEON_SLEEPING);
					events.ScheduleEvent(EVENT_PEON_SLEEPING, 120000);
					break;
				default:
					break;
				}
			}

			DoMeleeAttackIfReady();
		}

	private:
		EventMap events;
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_lazy_peonAI(creature);
	}
};

/*######
## Quest 25165: Never Trust a Big Barb and a Smile
## npc_clattering_scorpid
######*/
enum ClatteringScorpidData
{
    //Text
    EMOTE_CLATTERING_SCORPID                    = 0,
    //npc
    NPC_POISON_EXTRACTION_TOTEM                 = 39236,
    //Spell
    SPELL_SUNDERING_CLEAVE                      = 79687,
    SPELL_ENVENOM                               = 73672,
    SPELL_POISON_EXTRACTION_TOTEM               = 73673,
    //Quest
    QUEST_NEVER_TRUST_A_BIG_BARB_AND_A_SMILE    = 25165,
    //Events
    EVENT_SUNDERING_CLEAVE                      = 1,
    EVENT_ENVENOM
};

class npc_clattering_scorpid : public CreatureScript
{
    public:
        npc_clattering_scorpid() : CreatureScript("npc_clattering_scorpid") { }

        struct npc_clattering_scorpidAI : public ScriptedAI
        {
            npc_clattering_scorpidAI(Creature* creature) : ScriptedAI(creature) { }

            void Reset()
            {
                events.Reset();
            }
            
            void EnterCombat(Unit* /*who*/)
            {
                events.ScheduleEvent(EVENT_SUNDERING_CLEAVE, urand(4000, 4500));
                events.ScheduleEvent(EVENT_ENVENOM, urand(2000, 9000));
            }
            
            void SpellHitTarget(Unit* target, const SpellInfo* spell)
            {
                if (spell->Id == SPELL_ENVENOM)
                {
                    if (Player* player = target->ToPlayer())
                    {
                        if (player->HasAura(SPELL_POISON_EXTRACTION_TOTEM))
                            player->KilledMonsterCredit(NPC_POISON_EXTRACTION_TOTEM);
                    }
                }
            }

            void UpdateAI(uint32 const diff)
            {
                if (!UpdateVictim())
                    return;

                events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SUNDERING_CLEAVE:
                            DoCastVictim(SPELL_SUNDERING_CLEAVE);
                            events.ScheduleEvent(EVENT_SUNDERING_CLEAVE, urand(32000, 38000));
                            break;
                        case EVENT_ENVENOM:
                            if (Player* player = me->getVictim()->ToPlayer())
                            {
                                if (player->GetQuestStatus(QUEST_NEVER_TRUST_A_BIG_BARB_AND_A_SMILE) == QUEST_STATUS_INCOMPLETE)
                                    Talk(EMOTE_CLATTERING_SCORPID, player->GetGUID());
                            }
                            DoCastVictim(SPELL_ENVENOM);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

            private:
                EventMap events;
        };

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_clattering_scorpidAI(creature);
        }
};

/*######
## Quest 25205: The Wolf and The Kodo
## spell_rumbling_hooves_73868
######*/
class spell_rumbling_hooves_73868 : public SpellScriptLoader
{
    public:
        spell_rumbling_hooves_73868() : SpellScriptLoader("spell_rumbling_hooves_73868") { }

        class IsEntry
        {
            public:
                explicit IsEntry(uint32 entry) : _entry(entry) { }

                bool operator()(WorldObject* obj) const
                {
                    if (Creature* target = obj->ToCreature())
                        return target->GetEntry() == _entry;

                    return true;
                }

            private:
                uint32 _entry;
        };

        class spell_rumbling_hooves_73868_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_rumbling_hooves_73868_SpellScript);

            void FilterTargets(std::list<WorldObject*>& targets)
            {
                targets.remove_if(IsEntry(GetCaster()->GetEntry()));
            }

            void Register()
            {
                OnObjectAreaTargetSelect += SpellObjectAreaTargetSelectFn(spell_rumbling_hooves_73868_SpellScript::FilterTargets, EFFECT_0, TARGET_UNIT_DEST_AREA_ENTRY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_rumbling_hooves_73868_SpellScript();
        }
};

enum VoodooSpells
{
    SPELL_BREW        = 16712, // Special Brew
    SPELL_GHOSTLY     = 16713, // Ghostly
    SPELL_HEX1        = 16707, // Hex
    SPELL_HEX2        = 16708, // Hex
    SPELL_HEX3        = 16709, // Hex
    SPELL_GROW        = 16711, // Grow
    SPELL_LAUNCH      = 16716, // Launch (Whee!)
};

// Voodoo - 17009.
class spell_voodoo : public SpellScriptLoader
{
    public:
        spell_voodoo() : SpellScriptLoader("spell_voodoo") { }

        class spell_voodoo_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_voodoo_SpellScript);

            bool Validate(SpellInfo const* /*spell*/)
            {
                if (!sSpellMgr->GetSpellInfo(SPELL_BREW) || !sSpellMgr->GetSpellInfo(SPELL_GHOSTLY) ||
                    !sSpellMgr->GetSpellInfo(SPELL_HEX1) || !sSpellMgr->GetSpellInfo(SPELL_HEX2) ||
                    !sSpellMgr->GetSpellInfo(SPELL_HEX3) || !sSpellMgr->GetSpellInfo(SPELL_GROW) ||
                    !sSpellMgr->GetSpellInfo(SPELL_LAUNCH))
                    return false;
                return true;
            }

            void HandleDummy(SpellEffIndex /*effIndex*/)
            {
                uint32 spellid = RAND(SPELL_BREW, SPELL_GHOSTLY, RAND(SPELL_HEX1, SPELL_HEX2, SPELL_HEX3), SPELL_GROW, SPELL_LAUNCH);
                if (Unit* target = GetHitUnit())
                    GetCaster()->CastSpell(target, spellid, false);
            }

            void Register()
            {
                OnEffectHitTarget += SpellEffectFn(spell_voodoo_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
            }
        };

        SpellScript* GetSpellScript() const
        {
            return new spell_voodoo_SpellScript();
        }
};

enum BbladeCultist
{
    SPELL_INCINER  = 79938,
    SPELL_SUMMIMP  = 11939,
    SPELL_IMMOL    = 11962,

    SPELL_FELBLOOD = 80174,
    SPELL_INFUSED  = 84325,

    SAY_FLEE       = 0 // 15%
};

// Burning Blade Cultist - 3199.
class npc_bblade_cultist : public CreatureScript
{
public:
    npc_bblade_cultist() : CreatureScript("npc_bblade_cultist") { }

    struct npc_bblade_cultistAI : public ScriptedAI
    {
        npc_bblade_cultistAI(Creature* creature) : ScriptedAI(creature) { }

        uint32 IncinerateTimer;
        uint32 ImmolateTimer;
        bool Flee;

        void Reset()
        {
            IncinerateTimer = urand(1000, 4000);
            ImmolateTimer = urand (5500, 9500);
            DoCast(me, SPELL_SUMMIMP);
            Flee = false;
        }

        void EnterEvadeMode()
        {
            me->RemoveAllAuras();
            Reset();
            me->DeleteThreatList();
            me->CombatStop(false);
            me->GetMotionMaster()->MoveTargetedHome();
        }

        void JustDied (Unit* killer)
        {
            if (killer->HasAura(SPELL_FELBLOOD))
            {
                if (AuraPtr aura = killer->GetAura(SPELL_FELBLOOD))
                {
                    if (aura->GetStackAmount() >= 5)
                    {
                        killer->RemoveAurasDueToSpell(SPELL_FELBLOOD);
                        me->AddAura(SPELL_INFUSED, killer);
                    }
                    else me->AddAura(SPELL_FELBLOOD, killer);
                }
            }
            else me->AddAura(SPELL_FELBLOOD, killer);
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim() || me->HasUnitState(UNIT_STATE_CASTING))
                return;

            if (!Flee && HealthBelowPct(16))
            {
                Talk(SAY_FLEE);
                me->DoFleeToGetAssistance();
                IncinerateTimer = 10000;
                Flee = true;
            }

            if (IncinerateTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_INCINER);
                IncinerateTimer = urand(3000, 6000);
            }
            else IncinerateTimer -= diff;

            if (ImmolateTimer <= diff)
            {
                DoCast(me->getVictim(), SPELL_IMMOL);
                ImmolateTimer = urand(17000, 21000);
            }
            else ImmolateTimer -= diff;

            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_bblade_cultistAI(creature);
    }
};

enum Watershed // quest 25187 item 52514 spell 73817 http://www.youtube.com/watch?v=J501FKs1CgE
{
    // Vehicles, on boarding give credit and eject back to place.
    WATERSHED_RAGARRAN      = 39320,
    WATERSHED_TEKLA         = 39345,
    WATERSHED_MISHA         = 39346,
    WATERSHED_ZENTAJI       = 39347,
};

void AddSC_durotar()
{
    new npc_lazy_peon();
    new npc_clattering_scorpid();
    new spell_rumbling_hooves_73868();
    new spell_voodoo();
    new npc_bblade_cultist();
}
