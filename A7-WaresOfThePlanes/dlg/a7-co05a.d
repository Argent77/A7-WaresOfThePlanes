// Conversable item: Sealed Pocket Singularity

BEGIN ~a7-co05a~

IF ~!PartyHasItemIdentified("a7-co05a")~ bag.unidentified
  SAY @200 /* At first glance this orb seems to be composed of some kind of black material. At a closer look you notice that it actually absorbs the surrounding light, which makes it look much darker than it really is. */
  ++ @201 /* Put the item away. */ EXIT
END

IF ~PartyHasItemIdentified("a7-co05a")~ bag.identified
  SAY @202 /* What looks like a black orb from afar is actually a transportable portal into a nondimensional space. The portal appears to be dormant or sealed, however. No matter how hard you try, you can't find a way to open the black orb. */
  + ~!CheckStatGT(LastTalkedToBy,14,INT) HasItem("a7-co05a",LastTalkedToBy)~ + @203 /* Examine the orb. */ + bag.examine.failure.1
  + ~CheckStatGT(LastTalkedToBy,14,INT) !CheckStatGT(LastTalkedToBy,18,INT) HasItem("a7-co05a",LastTalkedToBy)~ + @203 /* Examine the orb. */ + bag.examine.failure.2
  + ~CheckStatGT(LastTalkedToBy,18,INT) HasItem("a7-co05a",LastTalkedToBy)~ + @203 /* Examine the orb. */ + bag.examine.success.1
  ++ @201 /* Put the item away. */ EXIT
END

IF ~~ bag.examine.failure.1
  SAY @204 /* You stare intently at the orb and try to make out any hints about its nature. But no matter how hard you try, the orb stays black and featureless as always. */
  IF ~~ EXIT
  IF ~Global("A7-SingularityIdentified","GLOBAL",0)~ DO ~SetGlobal("A7-SingularityIdentified","GLOBAL",1)~ UNSOLVED_JOURNAL @300 EXIT
END

IF ~~ bag.examine.failure.2
  SAY @205 /* You stare intently at the orb and try to make out any hints about its nature. Now and then you notice minute changes on the orb's surface whenever you look at it from the corner of your eye, but have no clue whether it means something. */
  IF ~~ EXIT
  IF ~GlobalLT("A7-SingularityIdentified","GLOBAL",2)~ DO ~SetGlobal("A7-SingularityIdentified","GLOBAL",2) EraseJournalEntry(@300)~ UNSOLVED_JOURNAL @301 EXIT
END

IF ~~ bag.examine.success.1
  SAY @206 /* You take a closer look at the orb. At first the surface of the item looks black and featureless. When you relax your eyes a bit you can see some kind of after-image which changes in intensity depending on how you move your left hand. After trying out different gestures the orb flashes briefly and produces a faint permanent halo around it. You can effortless reach into what seems to be an alternate space. */
  IF ~~ DO ~SetGlobal("A7-SingularityIdentified","GLOBAL",9) AddXPObject(LastTalkedToBy,10000) TransformItem("a7-co05a","a7-co05") EraseJournalEntry(@300) EraseJournalEntry(@301)~ SOLVED_JOURNAL @310 EXIT
END
