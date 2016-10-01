/*
 * Copyright (C) 2013-2015 InfinityCore <http://www.noffearrdeathproject.net/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
SDName: Boss_Landslide
SD%Complete: 100
SDComment:
SDCategory: Maraudon
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"

enum Spells
{
    SPELL_KNOCKAWAY         = 18670,
    SPELL_TRAMPLE           = 5568,
    SPELL_LANDSLIDE         = 21808
};

class boss_landslide : public CreatureScript
{
public:
    boss_landslide() : CreatureScript("boss_landslide") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_landslideAI (creature);
    }

    struct boss_landslideAI : public ScriptedAI
    {
        boss_landslideAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 KnockAwayTimer;
        uint32 TrampleTimer;
        uint32 LandslideTimer;

        void Reset()
        {
            KnockAwayTimer = 8000;
            TrampleTimer = 2000;
            LandslideTimer = 0;
        }

        void EnterCombat(Unit* /*who*/)
        {
        }

        void UpdateAI(const uint32 diff)
        {
            if (!UpdateVictim())
                return;

            //KnockAwayTimer
            if (KnockAwayTimer <= diff)
            {
                DoCastVictim(SPELL_KNOCKAWAY);
                KnockAwayTimer = 15000;
            }
            else KnockAwayTimer -= diff;

            //TrampleTimer
            if (TrampleTimer <= diff)
            {
                DoCast(me, SPELL_TRAMPLE);
                TrampleTimer = 8000;
            }
            else TrampleTimer -= diff;

            //Landslide
            if (HealthBelowPct(50))
            {
                if (LandslideTimer <= diff)
                {
                    me->InterruptNonMeleeSpells(false);
                    DoCast(me, SPELL_LANDSLIDE);
                    LandslideTimer = 60000;
                }
                else LandslideTimer -= diff;
            }

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_landslide()
{
    new boss_landslide();
}