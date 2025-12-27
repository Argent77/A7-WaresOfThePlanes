// Book of Vile Darkness
BEGIN ~a7-mi13~

IF ~Class(LastTalkedToBy,PALADIN) !Alignment(LastTalkedToBy,MASK_EVIL)~ tome.denied
  SAY @205 /* As you turn your attention to the tome a powerful force urges you to keep away from it. All your senses tell you that the tome would corrupt your soul just by examining it. */
  IF ~~ EXIT
END

IF ~True()~ tome.intro
  SAY @210 /* The book is surrounded by a sinister aura of unnatural darkness that makes you feel uneasy just by holding it in your hands. Speaking the command word written on the book's cover allows you to open it. */
  // Perform "Abyssal Pact"
  + ~CheckStatGT(LastTalkedToBy,8,INT) !InPartySlot(LastTalkedToBy,0) !Name("Imoen2",LastTalkedToBy) !Name("Sarevok",LastTalkedToBy)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.npc.1
  + ~CheckStatGT(LastTalkedToBy,8,INT)  !InPartySlot(LastTalkedToBy,0) Name("Imoen2",LastTalkedToBy)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.imoen.1
  + ~CheckStatGT(LastTalkedToBy,8,INT)  !InPartySlot(LastTalkedToBy,0) Name("Sarevok",LastTalkedToBy)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.sarevok.1
  + ~CheckStatGT(LastTalkedToBy,8,INT) InPartySlot(LastTalkedToBy,0) Alignment(LastTalkedToBy,MASK_EVIL)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.1
  + ~CheckStatGT(LastTalkedToBy,8,INT) InPartySlot(LastTalkedToBy,0) !Alignment(LastTalkedToBy,MASK_EVIL) CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.1
  + ~CheckStatGT(LastTalkedToBy,8,INT) InPartySlot(LastTalkedToBy,0) !Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~
    + @211 /* Perform the demonic ritual "Abyssal Pact." */ + tome.pact.evil.1

  // Gain unique ability and experience
  + ~CheckStatGT(LastTalkedToBy,15,INT) Alignment(LastTalkedToBy,MASK_EVIL) Global("A7-DarknessWisdom","GLOBAL",0)~
    + @212 /* Scour the book for secret knowledge. */ + tome.knowledge.1
  + ~CheckStatGT(LastTalkedToBy,15,INT) !Alignment(LastTalkedToBy,MASK_EVIL) CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL) Global("A7-DarknessWisdom","GLOBAL",0)~
    + @212 /* Scour the book for secret knowledge. */ + tome.knowledge.1
  + ~CheckStatGT(LastTalkedToBy,15,INT) !Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL) Global("A7-DarknessWisdom","GLOBAL",0)~
    + @212 /* Scour the book for secret knowledge. */ + tome.knowledge.evil.1
  + ~CheckStatGT(LastTalkedToBy,8,INT) !CheckStatGT(LastTalkedToBy,15,INT) Global("A7-DarknessWisdom","GLOBAL",0)~ + @212 /* Scour the book for secret knowledge. */ + tome.knowledge.int.1
  + ~!CheckStatGT(LastTalkedToBy,8,INT) Global("A7-DarknessWisdom","GLOBAL",0)~ + @212 /* Scour the book for secret knowledge. */ + tome.knowledge.illiterate.1

  ++ @213 /* Put the book away. */ EXIT
END

IF ~~ tome.knowledge.illiterate.1
  SAY @247 /* The content of the tome looks alien to you. You can spot several funny-looking drawings but they don't make any sense. */
  ++ @213 /* Put the book away. */ EXIT
END

IF ~~ tome.knowledge.int.1
  SAY @246 /* As you browse through the tome, it quickly becomes apparent that the complexity of the ideas and theories exceeds your mental capacities. */
  ++ @213 /* Put the book away. */ EXIT
END

IF ~~ tome.knowledge.evil.1
  SAY @214 /* Handling the book may have dire consequences if the reader is not properly protected from its evil. */
  ++ @215 /* Continue despite the dangers. */ + tome.knowledge.1
  ++ @209 /* Put the book away for now. */ EXIT
END

IF ~~ tome.knowledge.1
  SAY @216 /* You spend some time pouring over the secrets written down by some of the most notorious practitioners of the dark arts in history. */
  IF ~!Alignment(LastTalkedToBy,MASK_EVIL) CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + tome.knowledge.2
  IF ~OR(2) Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + tome.knowledge.3
END

IF ~~ tome.knowledge.2
  SAY @248 /* Some of the theories described in the tome reveal secrets so dark and evil that your conscious mind cannot grasp them. */
  IF ~~ DO ~SetGlobal("A7-DarknessWisdom","GLOBAL",1) AddXPObject(LastTalkedToBy,100000)~ EXIT
END

IF ~~ tome.knowledge.3
  SAY @217 /* One essay from an anonymous scholar catches your eye as it has been preserved in its entirety. Its insight into the nature of the necromantic arts is considerable. */
  IF ~Alignment(LastTalkedToBy,MASK_EVIL)~
    DO ~SetGlobal("A7-DarknessWisdom","GLOBAL",1)
        AddXPObject(LastTalkedToBy,100000)
        ActionOverride(LastTalkedToBy,AddSpecialAbility("%itm_resref%b"))~ EXIT
  IF ~!Alignment(LastTalkedToBy,MASK_EVIL)~
    DO ~SetGlobal("A7-DarknessWisdom","GLOBAL",1)
        AddXPObject(LastTalkedToBy,100000)
        ActionOverride(LastTalkedToBy,AddSpecialAbility("%itm_resref%b"))~ + tome.knowledge.changed.1
END

IF ~~ tome.knowledge.changed.1
  SAY @218 /* The vast amount of dark knowledge absorbed from the book left its mark on your soul and forces you to reconsider your own perspective on the concepts of good and evil. */
  IF ~Alignment(LastTalkedToBy,MASK_LAWFUL) Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,LAWFUL_EVIL)
        DisplayString(LastTalkedToBy,%align_le_strref%)
        RemoveRangerHood()~ EXIT
  IF ~Alignment(LastTalkedToBy,MASK_LAWFUL) !Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,LAWFUL_EVIL)
        DisplayString(LastTalkedToBy,%align_le_strref%)~ EXIT

  IF ~Alignment(LastTalkedToBy,MASK_LCNEUTRAL) Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,NEUTRAL_EVIL)
        DisplayString(LastTalkedToBy,%align_ne_strref%)
        RemoveRangerHood()~ EXIT
  IF ~Alignment(LastTalkedToBy,MASK_LCNEUTRAL) !Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,NEUTRAL_EVIL)
        DisplayString(LastTalkedToBy,%align_ne_strref%)~ EXIT

  IF ~Alignment(LastTalkedToBy,MASK_CHAOTIC) Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,CHAOTIC_EVIL)
        DisplayString(LastTalkedToBy,%align_ce_strref%)
        RemoveRangerHood()~ EXIT
  IF ~Alignment(LastTalkedToBy,MASK_CHAOTIC) !Class(LastTalkedToBy,RANGER)~
    DO ~ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_corrupted","LOCALS",1))
        ChangeAlignment(LastTalkedToBy,CHAOTIC_EVIL)
        DisplayString(LastTalkedToBy,%align_ce_strref%)~ EXIT
END


// Anyone EXCEPT Charname: ritual cannot be performed
IF ~~ tome.pact.npc.1
  SAY @219 /* Reading the introductory passage about the ritual makes it clear very quickly that the practitioner must either provide or contain a strong link to supernatural forces. You can't meet either of the requirements. */
  IF ~~ EXIT
END

// Imoen's reaction to the "Abyssal Pact" ritual
IF ~~ tome.pact.imoen.1
  SAY @221 /* Oh no, there is no way in hell I'd even consider it. Having odd dreams about Bhaal is bad enough. */
  IF ~~ EXIT
END

// Sarevok's reaction to the "Abyssal Pact" ritual
IF ~~ tome.pact.sarevok.1
  SAY @249 /* Ha, it's ironic that I'm only getting my hands on this book now that it has become useless to me. */
  = @250 /* Find another fool to use its powers, <CHARNAME>. Looking at it just puts me into a foul mood. */
  IF ~~ EXIT
END

// Unprotected non-evil Charname: can theoretically perform the ritual but will be corrupted by the act
IF ~~ tome.pact.evil.1
  SAY @214 /* Handling the book may have dire consequences if the reader is not properly protected from its evil. */
  ++ @215 /* Continue despite the dangers. */ + tome.pact.1
  ++ @209 /* Put the book away for now. */ EXIT
END

// Charname (any condition): can theoretically perform the ritual
IF ~~ tome.pact.1
  SAY @220 /* ~As you read the introductory passage about the ritual, it quickly becomes apparent that the practitioner must either provide or contain a strong link to supernatural forces. As a child of Bhaal you would apparently meet that requirement. */
  IF ~NumInParty(1)~ + tome.pact.failed.npc.1
  IF ~NumInPartyGT(1)~ + tome.pact.2
END

IF ~~ tome.pact.failed.npc.1
  SAY @222 /* The preparatory paragraph goes into more detail what is required to successfully perform the ritual. The practitioner must surrender a good portion of their spiritual essence to ensure the aid of the demon. */
  = @241 /* Furthermore, another powerful soul is required as a sacrifice to get the attention of the abyssal lord in the first place. Unfortunately, there is no one nearby for this purpose at the moment. */
  ++ @223 /* Stop the preparations and put the book away. */ EXIT
END

IF ~~ tome.pact.2
  SAY @222 /* The preparatory paragraph goes into more detail what is required to successfully perform the ritual. The practitioner must surrender a good portion of their spiritual essence to ensure the aid of the demon. */
  IF ~~ + tome.pact.2a
  IF ~OR(3) !InParty(Player2) !Detect(Player2) !Range(Player2,15)
      OR(3) !InParty(Player3) !Detect(Player3) !Range(Player3,15)
      OR(3) !InParty(Player4) !Detect(Player4) !Range(Player4,15)
      OR(3) !InParty(Player5) !Detect(Player5) !Range(Player5,15)
      OR(3) !InParty(Player6) !Detect(Player6) !Range(Player6,15)~ + tome.pact.2b
END

IF ~~ tome.pact.2a
  SAY @242 /* Furthermore, another powerful soul is required as a sacrifice to get the attention of the abyssal lord in the first place. One of your companions would fill that role nicely. */
  // Charname is not experienced enough
  + ~XPLT(LastTalkedToBy,%min_charname_xp%)~ + @225 /* Begin with the preparations. */ + tome.pact.failed.xp.1

  // Choose a party member to sacrifice
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player2) Detect(Player2) Range(Player2,15) !XPLT(Player2,%min_npc_xp%)~
    + @226 /* Begin with the preparations and choose <PLAYER2> as your sacrifice. */ + tome.pact.p2.1
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player2) Detect(Player2) Range(Player2,15) XPLT(Player2,%min_npc_xp%)~
    + @226 /* Begin with the preparations and choose <PLAYER2> as your sacrifice. */ + tome.pact.failed.sacrifice.1

  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player3) Detect(Player3) Range(Player3,15) !XPLT(Player3,%min_npc_xp%)~
    + @227 /* Begin with the preparations and choose <PLAYER3> as your sacrifice. */ + tome.pact.p3.1
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player3) Detect(Player3) Range(Player3,15) XPLT(Player3,%min_npc_xp%)~
    + @227 /* Begin with the preparations and choose <PLAYER3> as your sacrifice. */ + tome.pact.failed.sacrifice.1

  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player4) Detect(Player4) Range(Player4,15) !XPLT(Player4,%min_npc_xp%)~
    + @228 /* Begin with the preparations and choose <PLAYER4> as your sacrifice. */ + tome.pact.p4.1
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player4) Detect(Player4) Range(Player4,15) XPLT(Player4,%min_npc_xp%)~
    + @228 /* Begin with the preparations and choose <PLAYER4> as your sacrifice. */ + tome.pact.failed.sacrifice.1

  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player5) Detect(Player5) Range(Player5,15) !XPLT(Player5,%min_npc_xp%)~
    + @229 /* Begin with the preparations and choose <PLAYER5> as your sacrifice. */ + tome.pact.p5.1
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player5) Detect(Player5) Range(Player5,15) XPLT(Player5,%min_npc_xp%)~
    + @229 /* Begin with the preparations and choose <PLAYER5> as your sacrifice. */ + tome.pact.failed.sacrifice.1

  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player6) Detect(Player6) Range(Player6,15) !XPLT(Player6,%min_npc_xp%)~
    + @230 /* Begin with the preparations and choose <PLAYER6> as your sacrifice. */ + tome.pact.p6.1
  + ~!XPLT(LastTalkedToBy,%min_charname_xp%) InParty(Player6) Detect(Player6) Range(Player6,15) XPLT(Player6,%min_npc_xp%)~
    + @230 /* Begin with the preparations and choose <PLAYER6> as your sacrifice. */ + tome.pact.failed.sacrifice.1

  ++ @223 /* Stop the preparations and put the book away. */ EXIT
END

IF ~~ tome.pact.2b
  SAY @242 /* Moreover, another powerful soul is required as a sacrifice to get the attention of the abyssal lord to begin with. One of your companions would fill the role nicely. */
  ++ @231 /* No suitable companions are currently within reach to incorporate them in the ritual. */ EXIT
END

IF ~~ tome.pact.p2.1
  SAY @232 /* You prepare the ritual with utmost care so as not to arouse any suspicion among your companions. */
  IF ~~ DO ~SetGlobal("A7-DarknessRitualSacrifice","GLOBAL",2)~ + tome.pact.p2.2
  IF ~Class(Player2,PALADIN_ALL) !Alignment(Player2,MASK_EVIL)~ + tome.pact.paladin.1
  IF ~AreaCheck("OH5500")~ + tome.pact.holyground.1
END

IF ~~ tome.pact.p2.2
  SAY @233 /* You perform the necessary rites to attune your soul to the ritual. Then you turn your attention to <PLAYER2> and spin the magical web as carefully as possible. After making sure that everything was done exactly as described in the book you begin the second and final stage of the ritual. */
  IF ~~ DO ~ClearAllActions()
            StartCutSceneMode()
            StartCutSceneEx("a7-dct4a",TRUE)~ EXIT
END

IF ~~ tome.pact.p3.1
  SAY @232 /* You prepare the ritual with utmost care so as not to arouse any suspicion among your companions. */
  IF ~~ DO ~SetGlobal("A7-DarknessRitualSacrifice","GLOBAL",3)~ + tome.pact.p3.2
  IF ~Class(Player3,PALADIN_ALL) !Alignment(Player3,MASK_EVIL)~ + tome.pact.paladin.1
  IF ~AreaCheck("OH5500")~ + tome.pact.holyground.1
END

IF ~~ tome.pact.p3.2
  SAY @234 /* You perform the necessary rites to attune your soul to the ritual. Then you turn your attention to <PLAYER3> and spin the magical web as carefully as possible. After making sure that everything was done exactly as described in the book you begin the second and final stage of the ritual. */
  IF ~~ DO ~ClearAllActions()
            StartCutSceneMode()
            StartCutSceneEx("a7-dct4a",TRUE)~ EXIT
END

IF ~~ tome.pact.p4.1
  SAY @232 /* You prepare the ritual with utmost care so as not to arouse any suspicion among your companions. */
  IF ~~ DO ~SetGlobal("A7-DarknessRitualSacrifice","GLOBAL",4)~ + tome.pact.p4.2
  IF ~Class(Player4,PALADIN_ALL) !Alignment(Player4,MASK_EVIL)~ + tome.pact.paladin.1
  IF ~AreaCheck("OH5500")~ + tome.pact.holyground.1
END

IF ~~ tome.pact.p4.2
  SAY @235 /* You perform the necessary rites to attune your soul to the ritual. Then you turn your attention to <PLAYER4> and spin the magical web as carefully as possible. After making sure that everything was done exactly as described in the book you begin the second and final stage of the ritual. */
  IF ~~ DO ~ClearAllActions()
            StartCutSceneMode()
            StartCutSceneEx("a7-dct4a",TRUE)~ EXIT
END

IF ~~ tome.pact.p5.1
  SAY @232 /* You prepare the ritual with utmost care so as not to arouse any suspicion among your companions. */
  IF ~~ DO ~SetGlobal("A7-DarknessRitualSacrifice","GLOBAL",5)~ + tome.pact.p5.2
  IF ~Class(Player5,PALADIN_ALL) !Alignment(Player5,MASK_EVIL)~ + tome.pact.paladin.1
  IF ~AreaCheck("OH5500")~ + tome.pact.holyground.1
END

IF ~~ tome.pact.p5.2
  SAY @236 /* You perform the necessary rites to attune your soul to the ritual. Then you turn your attention to <PLAYER5> and spin the magical web as carefully as possible. After making sure that everything was done exactly as described in the book you begin the second and final stage of the ritual. */
  IF ~~ DO ~ClearAllActions()
            StartCutSceneMode()
            StartCutSceneEx("a7-dct4a",TRUE)~ EXIT
END

IF ~~ tome.pact.p6.1
  SAY @232 /* You prepare the ritual with utmost care so as not to arouse any suspicion among your companions. */
  IF ~~ DO ~SetGlobal("A7-DarknessRitualSacrifice","GLOBAL",6)~ + tome.pact.p6.2
  IF ~Class(Player6,PALADIN_ALL) !Alignment(Player6,MASK_EVIL)~ + tome.pact.paladin.1
  IF ~AreaCheck("OH5500")~ + tome.pact.holyground.1
END

IF ~~ tome.pact.p6.2
  SAY @237 /* You perform the necessary rites to attune your soul to the ritual. Then you turn your attention to <PLAYER6> and spin the magical web as carefully as possible. After making sure that everything was done exactly as described in the book you begin the second and final stage of the ritual. */
  IF ~~ DO ~ClearAllActions()
            StartCutSceneMode()
            StartCutSceneEx("a7-dct4a",TRUE)~ EXIT
END

IF ~~ tome.pact.failed.xp.1
  SAY @238 /* As you prepare the required spells you quickly realize that you lack the experience to fully grasp all the intricacies of the ritual. Since even the smallest mistake could have disastrous consequences, you decide to put off the preparations until you've gained more experience. */
  IF ~~ EXIT
END

IF ~~ tome.pact.failed.sacrifice.1
  SAY @243 /* Upon closer inspection, you become increasingly uncertain whether the chosen companion would be a worthy sacrifice to get the attention of the demon lord. Finally, you decide to look for a more powerful candidate. */
  IF ~~ EXIT
END

IF ~~ tome.pact.paladin.1
  SAY @239 /* When you turn your attention to the intended sacrifice you notice that the preparations don't work as planned. */
  = @240 /* You are unable to attune a crucial spell of the ritual to the soul of your companion. It appears as if some kind of divine intervention prevents you from proceeding. You have no choice but to put all preparations for the whole ritual on hold. */
  IF ~~ EXIT
END

IF ~~ tome.pact.holyground.1
  SAY @244 /* You try to perform the necessary rites to attune your soul to the ritual, but it seems to fail no matter what you do. The righteous energies of this place prevent any attempts to reach the lower planes. You have no choice but to put all preparations for the ritual on hold. */
  IF ~~ EXIT
END


// Lazarus Librarus
APPEND ~25spell~
  IF WEIGHT #-1 ~!Global("A7-DarknessQuest","GLOBAL",9) Global("A7-TomeDestroyed","LOCALS",1)~ 25spell.lock.done
    SAY @521 /* It is done. The tome rests now in a safe location. At least for a while. Artifacts like that have a tendency to reappear eventually. */
    IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
              SetGlobal("A7-DarknessQuest","GLOBAL",9)
              EraseJournalEntry(@3201)
              EraseJournalEntry(@3202)
              EraseJournalEntry(@3203)
              EraseJournalEntry(@3204)
              EraseJournalEntry(@3205)
              EraseJournalEntry(@3206)
              EraseJournalEntry(@3207)
              EraseJournalEntry(@3208)
              EraseJournalEntry(@3209)
              EraseJournalEntry(@3210)
              AddXP2DA("a7-dark3")
              ReputationInc(1)~
              SOLVED_JOURNAL @3251 EXIT
    IF ~InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.lazarus.1
    IF ~InParty("Dorn") IfValidForPartyDialogue("Dorn")~ EXTERN ~dorn25j~ dorn.lazarus.1
  END

  IF WEIGHT #-1 ~Global("A7-DarknessQuest","GLOBAL",9) Global("A7-TomeDestroyed","LOCALS",1)~ 25spell.lock.again.done
    SAY @521 /* It is done. The tome rests now in a safe location. At least for a while. Artifacts like that have a tendency to be found eventually. */
    IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
              EraseJournalEntry(@3252)
              AddXP2DA("a7-dark3")
              ReputationInc(1)~
              SOLVED_JOURNAL @3251 EXIT
    IF ~InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.lazarus.again.1
    IF ~InParty("Dorn") IfValidForPartyDialogue("Dorn")~ EXTERN ~dorn25j~ dorn.lazarus.again.1
  END

  IF ~~ 25spell.try.1
    SAY @501 /* I can certainly try. Let me take a look. */
    = @502 /* Ah, by all the powers! Please cover it immediately! The tome is written in abyssal runes and probably heavily enchanted. Even glancing at it could have a profound effect on the reader. */
    = @503 /* I cannot possibly fulfill your request. The tome should be destroyed or lock away as quickly as possible. */
    ++ @504 /* What are you so afraid of? */ + 25spell.afraid.1
    ++ @515 /* You won't dissuade me from it. Can't you help me at all? */ + 25spell.force.1
  END

  IF ~~ 25spell.afraid.1
    SAY @505 /* In case you're not aware, these kinds of runes always carry a bit of the abyssal powers with them. Simply reading the runes may corrupt the minds of unwitting readers who didn't take the necessary precautions. */
    ++ @506 /* Maybe you are right. What exactly do you suggest? */ + 25spell.suggest.1
    ++ @515 /* You won't dissuade me from it. Can't you help me at all? */ + 25spell.force.1
  END

  IF ~~ 25spell.suggest.1
    SAY @507 /* I could cast a powerful spell that will transport the tome to a miniature pocket dimension, similar to the Imprisonment spell, where it hopefully won't be discovered for a long time. */
    = @508 /* Since it poses a considerable threat to everyone, I would even do it for free. */
    ++ @509 /* Alright, please cast your spell. */ + 25spell.lock.1
    ++ @510 /* On second thought, I'd like to take the risk. Can you please tell me a way how to translate it myself? */ + 25spell.force.1
  END

  IF ~~ 25spell.force.1
    SAY @511 /* Absolutely not. I don't want to be responsible for guiding someone to their certain doom. */
    = @512 /* However, since your very being is already touched by supernatural forces I can give you the advice to seek out members of the demonic races, namely the denizens of the Abyss or the Nine Hells. */
    = @520 /* They possess the necessary knowledge to help you, provided you can pay their services. */
    ++ @513 /* Thank you for your help. */ + 25spell.force.2
  END

  IF ~~ 25spell.force.2
    SAY @514 /* No, don't thank me for that. If you value your life then lock the tome away and never touch it again. */
    IF ~~ DO ~SetGlobal("A7-DarknessQuest","GLOBAL",5)~ UNSOLVED_JOURNAL @3211 EXIT
  END

  IF ~~ 25spell.lock.1
    SAY @516 /* Let me prepare the spell. */
    IF ~PartyHasItem("a7-mi13x")~
      DO ~SetGlobal("A7-TomeDestroyed","LOCALS",1)
          SetGlobal("A7-DarknessTomeSealed","MYAREA",1)
          ClearAllActions()
          StartCutSceneMode()
          StartCutScene("a7-dct2")~ EXIT
    IF ~PartyHasItem("a7-mi13")~
      DO ~SetGlobal("A7-TomeDestroyed","LOCALS",1)
          SetGlobal("A7-DarknessTomeSealed","MYAREA",2)
          ClearAllActions()
          StartCutSceneMode()
          StartCutScene("a7-dct2")~ EXIT
  END

  IF ~~ 25spell.lock.again.1
    SAY @518 /* I'm relieved that you changed your mind. Yes, I can do that, and gladly so. Please hand me the tome. */
    ++ @519 /* Here you are. */ + 25spell.lock.again.2
  END

  IF ~~ 25spell.lock.again.2
    SAY @516 /* Let me prepare the spell. */
    IF ~PartyHasItem("a7-mi13x")~
      DO ~SetGlobal("A7-TomeDestroyed","LOCALS",1)
          SetGlobal("A7-DarknessTomeSealed","MYAREA",1)
          ClearAllActions()
          StartCutSceneMode()
          StartCutScene("a7-dct2")~ EXIT
    IF ~PartyHasItem("a7-mi13")~
      DO ~SetGlobal("A7-TomeDestroyed","LOCALS",1)
          SetGlobal("A7-DarknessTomeSealed","MYAREA",2)
          ClearAllActions()
          StartCutSceneMode()
          StartCutScene("a7-dct2")~ EXIT
  END
END

EXTEND_BOTTOM ~25spell~ 1
  + ~GlobalLT("A7-DarknessQuest","GLOBAL",5) PartyHasItem("a7-mi13x") InPartySlot(LastTalkedToBy,0)~ + @500 /* I have an unusual request. We have found a tome written in unknown runes that resists any attempts of magical identification. Would you be willing to translate it? */ + 25spell.try.1
  + ~!GlobalLT("A7-DarknessQuest","GLOBAL",5) OR(2) PartyHasItem("a7-mi13") PartyHasItem("a7-mi13x") InPartySlot(LastTalkedToBy,0)~ + @517 /* I reconsidered and want to have the demonic tome locked away. Can you do it? */ + 25spell.lock.again.1
END

// NPC interjections for Lazarus Librarus
APPEND ~dorn25j~
IF ~~ dorn.lazarus.1
  SAY @820 /* You are a coward and a fool to give an artifact of such great power up so lightly, <CHARNAME>. Just think of all the possibilities it would have offered us if used properly. */
  IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
            SetGlobal("A7-DarknessQuest","GLOBAL",9)
            EraseJournalEntry(@3201)
            EraseJournalEntry(@3202)
            EraseJournalEntry(@3203)
            EraseJournalEntry(@3204)
            EraseJournalEntry(@3205)
            EraseJournalEntry(@3206)
            EraseJournalEntry(@3207)
            EraseJournalEntry(@3208)
            EraseJournalEntry(@3209)
            EraseJournalEntry(@3210)
            AddXP2DA("a7-dark3")
            ReputationInc(1)~
            SOLVED_JOURNAL @3251 EXIT
  IF ~InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.lazarus.1
END

IF ~~ dorn.lazarus.again.1
  SAY @820 /* You are a coward and a fool to give an artifact of such great power up so lightly, <CHARNAME>. Just think of all the possibilities it would have offered us if used properly. */
  IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
            EraseJournalEntry(@3252)
            AddXP2DA("a7-dark3")
            ReputationInc(1)~
            SOLVED_JOURNAL @3251 EXIT
  IF ~InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.lazarus.again.1
END
END

APPEND ~keldo25j~
IF ~~ keldorn.lazarus.1
  SAY @1070 /* The evil has been sealed away and won't do any further harm. For that I am glad. But we must always remain vigilant. Many artifacts corrupt the minds of their owners in more subtle ways than this tome. */
  IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
              SetGlobal("A7-DarknessQuest","GLOBAL",9)
              EraseJournalEntry(@3201)
              EraseJournalEntry(@3202)
              EraseJournalEntry(@3203)
              EraseJournalEntry(@3204)
              EraseJournalEntry(@3205)
              EraseJournalEntry(@3206)
              EraseJournalEntry(@3207)
              EraseJournalEntry(@3208)
              EraseJournalEntry(@3209)
              EraseJournalEntry(@3210)
              AddXP2DA("a7-dark3")
              ReputationInc(1)~
              SOLVED_JOURNAL @3251 EXIT
END

IF ~~ keldorn.lazarus.again.1
  SAY @1070 /* The evil has been sealed away and won't do any further harm. For that I am glad. But we must always remain vigilant. Many artifacts corrupt the minds of their owners in more subtle ways than this tome. */
    IF ~~ DO ~SetGlobal("A7-TomeDestroyed","LOCALS",9)
              EraseJournalEntry(@3252)
              AddXP2DA("a7-dark3")
              ReputationInc(1)~
              SOLVED_JOURNAL @3251 EXIT
END
END


// Cespenar
APPEND ~botsmith~
  IF ~~ botsmith.translate.request
    SAY @601 /* Yech! Written in Abyssal it is. Ugly language. Yous really want to read it? I could sell you language guide for black opal and 1,000 gold. You wants? */
    + ~OR(2) !PartyHasItem("misc38") PartyGoldLT(1000)~ + @602 /* I can't afford it right now. */ UNSOLVED_JOURNAL @3212 + botsmith.translate.refuse
    + ~PartyHasItem("misc38") PartyGoldGT(999)~ + @604 /* Yes, I do. */
      DO ~SetGlobal("A7-DarknessQuest","GLOBAL",9)
          SetGlobal("A7-AbyssalPrimer","GLOBAL",1)
          EraseJournalEntry(@3201)
          EraseJournalEntry(@3202)
          EraseJournalEntry(@3203)
          EraseJournalEntry(@3204)
          EraseJournalEntry(@3205)
          EraseJournalEntry(@3206)
          EraseJournalEntry(@3207)
          EraseJournalEntry(@3208)
          EraseJournalEntry(@3209)
          EraseJournalEntry(@3210)
          EraseJournalEntry(@3211)
          EraseJournalEntry(@3212)
          EraseJournalEntry(@3214)
          TakePartyGold(1000)
          TakePartyItemNum("misc38",1)
          DestroyItem("misc38")
          DestroyGold(1000)~ UNSOLVED_JOURNAL @3213 + 11
    ++ @607 /* Not right now. */ UNSOLVED_JOURNAL @3212 + botsmith.translate.refuse
  END

  IF ~~ botsmith.translate.request.again
    SAY @606 /* Yes, I could. You have black opal and 1,000 gold? */
    + ~OR(2) !PartyHasItem("misc38") PartyGoldLT(1000)~ + @602 /* I can't afford it right now. */ + botsmith.translate.refuse
    + ~PartyHasItem("misc38") PartyGoldGT(999)~ + @608 /* Sure, go ahead. */
      DO ~SetGlobal("A7-DarknessQuest","GLOBAL",9)
          SetGlobal("A7-AbyssalPrimer","GLOBAL",1)
          EraseJournalEntry(@3201)
          EraseJournalEntry(@3202)
          EraseJournalEntry(@3203)
          EraseJournalEntry(@3204)
          EraseJournalEntry(@3205)
          EraseJournalEntry(@3206)
          EraseJournalEntry(@3207)
          EraseJournalEntry(@3208)
          EraseJournalEntry(@3209)
          EraseJournalEntry(@3210)
          EraseJournalEntry(@3211)
          EraseJournalEntry(@3212)
          EraseJournalEntry(@3214)
          TakePartyGold(1000)
          TakePartyItemNum("misc38",1)
          DestroyItem("misc38")
          DestroyGold(1000)~ UNSOLVED_JOURNAL @3213 + 11
    ++ @607 /* Not right now. */ + botsmith.translate.refuse
  END

  IF ~~ botsmith.translate.refuse
    SAY @603 /* Oh well, come back when ready you are. */
    IF ~~ EXIT
  END
END

EXTEND_BOTTOM ~botsmith~ 2
  + ~Global("A7-DarknessQuest","GLOBAL",5) PartyHasItem("a7-mi13x")~ + @600 /* Could you translate this book for us? */ DO ~SetGlobal("A7-DarknessQuest","GLOBAL",6)~ + botsmith.translate.request
  + ~Global("A7-DarknessQuest","GLOBAL",6) PartyHasItem("a7-mi13x")~ + @605 /* Could you sell me your Abyssal language guide? */ + botsmith.translate.request.again
END
