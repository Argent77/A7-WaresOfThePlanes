// Lure of Darkness: Cultist Leader (ambush)

BEGIN ~a7-demc1~

IF ~True()~ leader.intro
  SAY @350 /* Greetings, adventurers. It has come to our attention that you have recently come into the possession of a certain artifact. */
  IF ~~ + leader.intro.1
END

IF ~~ leader.intro.1
  SAY @351 /* It's an ornate metal disc that originally belonged to us but was stolen by a former member of our organization. */
  = @352 /* Since you were not directly involved in the incident I'd like to make you an offer. Return the item to us and we will compensate you for your trouble. */
  ++ @353 /* Who are you? */ + leader.who.1
  ++ @355 /* What's so special about the item? */ + leader.what.1
  ++ @357 /* And if we refuse? */ + leader.stall.1
  + ~PartyHasItem("a7-mi15")~ + @359 /* Alright, you can have it. */ + leader.accept.1
  + ~CheckStatLT(LastTalkedToBy,16,CHR)~ + @360 /* We don't have it anymore. */ + leader.deceive.1
  + ~!CheckStatLT(LastTalkedToBy,16,CHR)~ + @360 /* We don't have it anymore. */ + leader.deceive.2
  + ~PartyHasItem("a7-mi15")~ + @361 /* No, I won't give it to you. */ + leader.refuse.1
END

IF ~~ leader.who.1
  SAY @354 /* I am Orma, a conjurer of no mean power. And these are my collegues who have also mastered the arcane arts. But that shouldn't concern you. */
  ++ @355 /* What's so special about the item? */ + leader.what.1
END

IF ~~ leader.what.1
  SAY @356 /* That is not for you to know. Suffice to say that it's important to us. Important enough that we're willing to bargain with you. */
  ++ @357 /* And if we refuse? */ + leader.stall.1
END

IF ~~ leader.stall.1
  SAY @358 /* A refusal is out of the question. Don't be a fool. We will get the item one way or another. */
  + ~PartyHasItem("a7-mi15")~ + @359 /* Alright, you can have it. */ + leader.accept.1
  + ~CheckStatLT(LastTalkedToBy,16,CHR)~ + @360 /* We don't have it anymore. */ + leader.deceive.1
  + ~!CheckStatLT(LastTalkedToBy,16,CHR)~ + @360 /* We don't have it anymore. */ + leader.deceive.2
  + ~PartyHasItem("a7-mi15")~ + @361 /* No, I won't give it to you. */ + leader.refuse.1
END

IF ~~ leader.accept.1
  SAY @362 /* You've made a wise choice. This is for your trouble. Then I'll take my leave now. */
  IF ~~ DO ~SetGlobal("A7-DarknessQuest","GLOBAL",9)
            SetGlobal("A7-CultistLeave","A7WP02",1)
            EraseJournalEntry(@3201)
            EraseJournalEntry(@3202)
            TakePartyItemNum("a7-mi15",1)
            DestroyItem("a7-mi15")
            GiveGoldForce(500)
            AddXP2DA("a7-dark2")~
            SOLVED_JOURNAL @3250 EXIT
END

IF ~~ leader.deceive.1
  SAY @363 /* Do you really think I would buy such a simplistic lie? If you aren't willing to hand it over then we'll take it from your dead hands. Attack them! */
  IF ~~ DO ~SetGlobal("A7-CultistHostile","A7WP02",1)
            Enemy()~
            UNSOLVED_JOURNAL @3203 EXIT
END

IF ~~ leader.deceive.2
  SAY @364 /* Our divinations revealed that you have the item in your possession. You are either lying to us or have discarded it only recently. In either case we can't afford to let you go. Attack them! */
  IF ~~ DO ~SetGlobal("A7-CultistHostile","A7WP02",1)
            Enemy()~
            UNSOLVED_JOURNAL @3203 EXIT
END

IF ~~ leader.refuse.1
  SAY @365 /* That's regrettable. But my patience has run out anyway. Don't think this will be an easy fight. We have all mastered our professions. Attack them! */
  IF ~~ DO ~SetGlobal("A7-CultistHostile","A7WP02",1)
            Enemy()~
            UNSOLVED_JOURNAL @3204 EXIT
END
