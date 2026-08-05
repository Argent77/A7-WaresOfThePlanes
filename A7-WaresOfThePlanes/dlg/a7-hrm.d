// Harmonium dialog

BEGIN ~a7-hrmp~

IF ~True()~ intro
  SAY @100 /* Hold, prime! I'd like to have words with you. */
  ++ @101 /* Prime? What are you talking about? */ + intro.1
  ++ @102 /* Who are you? */ + intro.3
  ++ @103 /* What's this about? */ + intro.3
  ++ @104 /* I don't have the time for this. */ + intro.2
END

IF ~~ intro.1
  SAY @105 /* My apologies. "Prime" is the name given to creatures like you who are native to the Prime Material plane. */
  ++ @102 /* Who are you? */ + intro.3
  ++ @103 /* What's this about? */ + intro.3
END

IF ~~ intro.2
  SAY @106 /* You will take the time to deal with us. */
  IF ~~ + intro.3
END

IF ~~ intro.3
  SAY @107 /* I am Sorcien the Fair, first Mover of the Harmonium in Sigil. And these are my subordinates, all of them notaries of third rank or higher. */
  = @108 /* We are on a mission to retrieve lost or stolen relics of great importance to the Harmonium. */
  = @109 /* For some time we have been searching for a set of personal armor and weapons that belonged to Factol Sarin, the head of our faction. They had been stolen by members of the Revolutionary League years ago and were thought to be lost forever. */
  = @110 /* Not long ago we were able to divine the whereabouts of the pieces, here on the prime world of Toril. It took us some time and effort, but we are certain that the items we seek are currently in your possession. */
  ++ @111 /* Yes, I do have the items you speak of. */ + admit.1
  + ~OR(12)
      HasItemEquiped("a7-pl01",Player1)
      HasItemEquiped("a7-pl01",Player2)
      HasItemEquiped("a7-pl01",Player3)
      HasItemEquiped("a7-pl01",Player4)
      HasItemEquiped("a7-pl01",Player5)
      HasItemEquiped("a7-pl01",Player6)
      HasItemEquipedReal("a7-sw08",Player1)
      HasItemEquipedReal("a7-sw08",Player2)
      HasItemEquipedReal("a7-sw08",Player3)
      HasItemEquipedReal("a7-sw08",Player4)
      HasItemEquipedReal("a7-sw08",Player5)
      HasItemEquipedReal("a7-sw08",Player6)~ + @112 /* I don't know what you're talking about. */ + deny.fail.1
  + ~!HasItemEquiped("a7-pl01",Player1)
     !HasItemEquiped("a7-pl01",Player2)
     !HasItemEquiped("a7-pl01",Player3)
     !HasItemEquiped("a7-pl01",Player4)
     !HasItemEquiped("a7-pl01",Player5)
     !HasItemEquiped("a7-pl01",Player6)
     !HasItemEquipedReal("a7-sw08",Player1)
     !HasItemEquipedReal("a7-sw08",Player2)
     !HasItemEquipedReal("a7-sw08",Player3)
     !HasItemEquipedReal("a7-sw08",Player4)
     !HasItemEquipedReal("a7-sw08",Player5)
     !HasItemEquipedReal("a7-sw08",Player6)~ + @112 /* I don't know what you're talking about. */ + deny.attempt.1
END

IF ~~ deny.attempt.1
  SAY @113 /* Our divinations are beyond any doubt. However, planar interference can sometimes distort the results. Let me take a closer look. */
  IF ~~ + deny.fail.2
  IF ~CheckStatGT(LastTalkedToBy,15,CHR)~ + deny.success.1
  IF ~OR(4)
        HasItemEquiped("a7-br08",LastTalkedToBy)
        HasItemEquiped("a7-he01",LastTalkedToBy)
        HasItemEquiped("a7-sh01",LastTalkedToBy)
        HasItemEquipedReal("a7-sw09",LastTalkedToBy)~ + deny.fail.1
END

IF ~~ deny.fail.1
  SAY @114 /* You have some gall to deny our claim while openly wearing the equipment in question. */
  IF ~CheckStatGT(LastTalkedToBy,15,CHR)~ + deny.fail.1.good
  IF ~!CheckStatGT(LastTalkedToBy,15,CHR)~ + deny.fail.1.bad
END

IF ~~ deny.fail.1.good
  SAY @115 /* But I acknowledge your boldness in the attempt. */
  IF ~~ + admit.1
END

IF ~~ deny.fail.1.bad
  SAY @116 /* Don't think you can get away with such a blatant lie. */
  = @117 /* You will return the items to us. Do you surrender them freely? */
  ++ @118 /* Very well. You can have them. */ + surrender.1
  ++ @119 /* No, they now belong to us. */ + hostile.1
END

IF ~~ deny.fail.2
  SAY @120 /* You might deny our claim, but your face tells me all that I need to know. */
  IF ~~ + admit.1
END

IF ~~ deny.success.1
  SAY @121 /* I can't find any evidence that the equipment in question is actually in your possession. And my honor demands to respect your answer, for now. */
  = @122 /* We will take our leave and focus on our task once more. Farewell, prime. May we not meet again. */
  IF ~~ DO ~AddexperienceParty(18000) StartCutSceneMode() StartCutScene("a7-hmctx")~ JOURNAL @1000 EXIT
END

IF ~~ surrender.1
  SAY @123 /* I am glad that you've come to your senses in time. */
  IF ~CheckStatGT(LastTalkedToBy,17,CHR)~ + surrender.2
  IF ~!CheckStatGT(LastTalkedToBy,17,CHR)~ + surrender.3
END

IF ~~ surrender.2
  SAY @124 /* Despite your attempts to deceive us, I think a small compensation is appropriate. */
  IF ~~ DO ~TakePartyItem("a7-pl01")
            DestroyItem("a7-pl01")
            TakePartyItem("a7-br08")
            DestroyItem("a7-br08")
            TakePartyItem("a7-he01")
            DestroyItem("a7-he01")
            TakePartyItem("a7-sw08")
            DestroyItem("a7-sw08")
            TakePartyItem("a7-sh01")
            DestroyItem("a7-sh01")
            TakePartyItem("a7-sw09")
            DestroyItem("a7-sw09")
            GiveGoldForce(5000)
            AddexperienceParty(18000) StartCutSceneMode() StartCutScene("a7-hmctx")~ JOURNAL @1001 EXIT
END

IF ~~ surrender.3
  SAY @125 /* Don't expect any further gratitude, however. These items rightfully belonged to us in the first place. */
  IF ~~ DO ~TakePartyItem("a7-pl01")
            DestroyItem("a7-pl01")
            TakePartyItem("a7-br08")
            DestroyItem("a7-br08")
            TakePartyItem("a7-he01")
            DestroyItem("a7-he01")
            TakePartyItem("a7-sw08")
            DestroyItem("a7-sw08")
            TakePartyItem("a7-sh01")
            DestroyItem("a7-sh01")
            TakePartyItem("a7-sw09")
            DestroyItem("a7-sw09")
            AddexperienceParty(18000) StartCutSceneMode() StartCutScene("a7-hmctx")~ JOURNAL @1002 EXIT
END

IF ~~ hostile.1
  SAY @126 /* That is not acceptable. If you won't surrender them peacefully then we'll have to take them without your consent. */
  = @127 /* To arms! */
  IF ~~ DO ~SetGlobal("A7-HarmoniumQuest","GLOBAL",10) Enemy()~ JOURNAL @1003 EXIT
END

IF ~~ admit.1
  SAY @128 /* Since the items rightfully belong to us, I can offer you another sacred relic of our faction as a sign of respect, if you are willing to surrender them freely to us. */
  ++ @129 /* That sounds acceptable. I agree. */ + accept.1
  + ~!CheckStatGT(LastTalkedToBy,15,CHR)~ + @130 /* I think a greater reward is in order. The pieces were quite expensive after all. */ + demand.1
  + ~CheckStatGT(LastTalkedToBy,15,CHR)~ + @130 /* I think a greater reward is in order. The pieces were quite expensive after all. */ + accept.2
  ++ @131 /* No, I won't hand them over. */ + refuse.1
END

IF ~~ demand.1
  SAY @132 /* You are trying my patience, prime. I've made my offer. What is your answer? */
  ++ @133 /* Then I have no other choice. I agree. */ + accept.1
  ++ @134 /* That's not acceptable. I refuse. */ + refuse.1
END

IF ~~ accept.1
  SAY @135 /* You've made a wise choice. As promised I bestow upon you the Peace Ribbon. Now we can finally return home. Farewell, prime. */
  IF ~~ DO ~TakePartyItem("a7-pl01")
            DestroyItem("a7-pl01")
            TakePartyItem("a7-br08")
            DestroyItem("a7-br08")
            TakePartyItem("a7-he01")
            DestroyItem("a7-he01")
            TakePartyItem("a7-sw08")
            DestroyItem("a7-sw08")
            TakePartyItem("a7-sh01")
            DestroyItem("a7-sh01")
            TakePartyItem("a7-sw09")
            DestroyItem("a7-sw09")
            GiveItem("a7-bl02",LastTalkedToBy)
            AddexperienceParty(18000) SetGlobal("A7-HarmoniumQuest","GLOBAL",9) StartCutSceneMode() StartCutScene("a7-hmctx")~ JOURNAL @1004 EXIT
END

IF ~~ accept.2
  SAY @136 /* You've made a wise choice. As promised I bestow upon you the Peace Ribbon and some spending money. Now we can finally return home. Farewell, prime. */
  IF ~~ DO ~TakePartyItem("a7-pl01")
            DestroyItem("a7-pl01")
            TakePartyItem("a7-br08")
            DestroyItem("a7-br08")
            TakePartyItem("a7-he01")
            DestroyItem("a7-he01")
            TakePartyItem("a7-sw08")
            DestroyItem("a7-sw08")
            TakePartyItem("a7-sh01")
            DestroyItem("a7-sh01")
            TakePartyItem("a7-sw09")
            DestroyItem("a7-sw09")
            GiveItem("a7-bl02",LastTalkedToBy)
            GiveGoldForce(5000)
            AddexperienceParty(18000) SetGlobal("A7-HarmoniumQuest","GLOBAL",9) StartCutSceneMode() StartCutScene("a7-hmctx")~ JOURNAL @1005 EXIT
END

IF ~~ refuse.1
  SAY @137 /* A word of warning. We won't leave this place empty-handed. Do you comply peacefully? */
  ++ @138 /* Alright, alright. You can have them. */ + accept.1
  ++ @139 /* Don't make me repeat myself. */ + refuse.2
END

IF ~~ refuse.2
  SAY @140 /* You leave us no choice. We are battle-hardened planewalkers in the service of the Harmonium for decades. You can't possibly win against us. */
  IF ~~ DO ~SetGlobal("A7-HarmoniumQuest","GLOBAL",10) Enemy()~ JOURNAL @1003 EXIT
END


///////////////////////////////////////////////////////////////////////////////


BEGIN ~a7-hrm~

IF ~True()~ default
  SAY @200 /* Direct all you inquiries to Sir Sorcien. */
  IF ~!Detect("a7-hrm_leader")~ EXIT
  IF ~Detect("a7-hrm_leader")~ EXTERN ~a7-hrmp~ intro
END
