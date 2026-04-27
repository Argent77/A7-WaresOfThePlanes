// Eyes of Mask: Voice of the Trial

BEGIN ~A7-VOICE~

IF ~True()~ Challenge.Intro
  SAY @400 /* You have entered the Trials of Mask, supplicant. Overcome my challenges to unlock my powers. */
  IF ~~ + Challenge.None
  IF ~Global("A7-MaskChallenge","GLOBAL",3)~ + Challenge3.1
  IF ~Global("A7-MaskChallenge","GLOBAL",2)~ + Challenge2.1
  IF ~Global("A7-MaskChallenge","GLOBAL",1)~ + Challenge1.1
END

IF ~~ Challenge1.1
  SAY @401 /* For the first challenge I have prepared a one-on-one duel with one of my Chosen. Defeat him to win your prize. */
  IF ~~ DO ~SetGlobal("a7-ch1_start","MYAREA",1) ApplySpellRES("a7-ch1px",Player1) DestroySelf()~ UNSOLVED_JOURNAL @1000 EXIT
END

IF ~~ Challenge2.1
  SAY @402 /* The second challenge tests your reflexes. Find three parts of a key to win my prize. But take care! One of my Chosen will try to snatch them from you if you are not careful. */
  IF ~~ DO ~SetGlobal("a7-ch2_start","MYAREA",1) EraseJournalEntry(@1001) DestroySelf()~ UNSOLVED_JOURNAL @1010 EXIT
END

IF ~~ Challenge3.1
  SAY @403 /* The third and final challenge tests your observation skills, wits, and persistence. The Nine are the key if you hit them all in the right order. Talk to them to gather clues about their position in the order. */
  IF ~~ DO ~SetGlobal("a7-ch3_start","MYAREA",1) EraseJournalEntry(@1012) DestroySelf()~ UNSOLVED_JOURNAL @1020 EXIT
END

IF ~~ Challenge.None
  SAY @404 /* There are no more challenges available to you. */
  IF ~~ DO ~SetGlobal("a7-challenge-won","MYAREA",1) DestroySelf()~ EXIT
END
