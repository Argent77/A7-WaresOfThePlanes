// Book of Vile Darkness (unidentified)

BEGIN ~a7-mi13x~

IF ~Class(LastTalkedToBy,PALADIN) !Alignment(LastTalkedToBy,MASK_EVIL)~ tome.denied
  SAY @205 /* As you turn your attention to the tome a powerful force urges you to keep away from it. All your senses tell you that the tome would corrupt your soul just by examining it. */
  IF ~~ EXIT
END

IF ~PartyHasItem("a7-mi14")~ tome.unknown.translation.1
  SAY @207 /* With the Primer on Abyssal Languages in your possession you would be able to translate the content of the tome. */
  + ~!Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + @208 /* Translate the tome. */ + tome.unknown.translation.evil
  + ~OR(2) Alignment(LastTalkedToBy,MASK_EVIL) CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + @208 /* Translate the tome. */ + tome.unknown.translation.2
  ++ @209 /* Put the book away for now. */ EXIT
END

IF ~True()~ tome.unknown
  SAY @200 /* This black-bound tome is unpleasant to the touch and radiates a foul smell that stirs an uneasy feeling in your mind. */
  + ~GlobalGT("A7-DarknessQuest","GLOBAL",3) !Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + @245 /* Examine it more closely. */ + tome.unknown.nonevil.warn
  + ~!GlobalGT("A7-DarknessQuest","GLOBAL",3) !Alignment(LastTalkedToBy,MASK_EVIL) !CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + @245 /* Examine it more closely. */ + tome.unknown.nonevil
  + ~OR(2) Alignment(LastTalkedToBy,MASK_EVIL) CheckStat(LastTalkedToBy,1,PROTECTION_FROM_EVIL)~ + @245 /* Examine it more closely. */ + tome.unknown.evil
  ++ @213 /* Put the book away. */ EXIT
END

IF ~~ tome.unknown.translation.evil
  SAY @214 /* Handling the book may have dire consequences if the reader is not properly protected from its evil. */
  ++ @215 /* Continue despite the dangers. */ + tome.unknown.translation.2
  ++ @209 /* Put the book away for now. */ EXIT
END

IF ~~ tome.unknown.translation.2
  SAY @206 /* Using the notes on abyssal languages as reference you are able to decipher most of the tome's content. */
  IF ~~ DO ~EraseJournalEntry(@3213)
            AddXP2DA("a7-dark4")
            ActionOverride(LastTalkedToBy,TransformItem("a7-mi13x","a7-mi13"))~ SOLVED_JOURNAL @3252 EXIT
  IF ~!Alignment(LastTalkedToBy,MASK_EVIL) NextTriggerObject(LastTalkedToBy) GlobalLT("a7-mi13_taintlevel","LOCALS",2)~
    DO ~EraseJournalEntry(@3213)
        AddXP2DA("a7-dark4")
        ActionOverride(LastTalkedToBy,TransformItem("a7-mi13x","a7-mi13"))
        ActionOverride(LastTalkedToBy,IncrementGlobal("a7-mi13_taintlevel","LOCALS",2))~ SOLVED_JOURNAL @3252 EXIT
  IF ~!Alignment(LastTalkedToBy,MASK_EVIL) NextTriggerObject(LastTalkedToBy) !GlobalLT("a7-mi13_taintlevel","LOCALS",2)~
    DO ~EraseJournalEntry(@3213)
        AddXP2DA("a7-dark4")
        ActionOverride(LastTalkedToBy,TransformItem("a7-mi13x","a7-mi13"))
        ActionOverride(LastTalkedToBy,SetGlobal("a7-mi13_taintlevel","LOCALS",4))~ SOLVED_JOURNAL @3252 + tome.unknown.change
END

IF ~~ tome.unknown.nonevil.warn
  SAY @214 /* Handling the book may have dire consequences if the reader is not properly protected from its evil. */
  ++ @215 /* Continue despite the dangers. */ + tome.unknown.nonevil
  ++ @209 /* Put the book away for now. */ EXIT
END

IF ~~ tome.unknown.nonevil
  SAY @201 /* The tome is written in unknown runes and covered in strange arcane symbols that trigger a feeling of dread and something even more terrifying that leaves a strange sensation in your mind. It does not open no matter how much you try. */
  IF ~~ DO ~ActionOverride(LastTalkedToBy,IncrementGlobal("a7-mi13_taintlevel","LOCALS",1))~ EXIT
  IF ~NextTriggerObject(LastTalkedToBy) Global("a7-mi13_taintlevel","LOCALS",3)~
    DO ~ActionOverride(LastTalkedToBy,IncrementGlobal("a7-mi13_taintlevel","LOCALS",1))~ + tome.unknown.warnchange
  IF ~NextTriggerObject(LastTalkedToBy) !GlobalLT("a7-mi13_taintlevel","LOCALS",4)~ + tome.unknown.change
END

IF ~~ tome.unknown.evil
  SAY @202 /* The tome is written in unknown runes and covered in strange arcane symbols that trigger a feeling of dread. It does not open no matter how much you try. */
  IF ~~ EXIT
END

IF ~~ tome.unknown.warnchange
  SAY @203 /* Even after turning the tome away you can't do much but think of the tome for a while. */
  IF ~~ EXIT
END

IF ~~ tome.unknown.change
  SAY @204 /* As you're about to turn the tome away an irresistable feeling of malicious satisfaction overwhelms you. You know that something changed deep inside you. */
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
