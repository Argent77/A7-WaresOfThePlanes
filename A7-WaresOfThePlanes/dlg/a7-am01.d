// Conversable item: Astral Claw Necklace

BEGIN ~a7-am01~

IF ~!PartyHasItemIdentified("a7-am01")~ Intro.Unidentified
  SAY @1000 /* The necklace is made from bones, teeth and claws of various animals. */
  ++ @1001 /* Put the necklace away. */ EXIT
END

IF ~PartyHasItemIdentified("a7-am01") CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~ Intro.Identified.Low
  SAY @1002 /* The necklace is made from bones, teeth and claws of various animals. You can make out wolf and bear claws, boar tusks, as well as several other bones you can't identify. */
  IF ~~ + Intro.2
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~ + Necklace.Dissolve.2
END

IF ~PartyHasItemIdentified("a7-am01") OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~ Intro.Identified.High
  SAY @1003 /* The necklace is made from bones, teeth and claws of various animals. You can make out claws from wolves, bears, panthers, and lions, but also teeth from boars and several other animals. */
  IF ~~ + Intro.2
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~ + Necklace.Dissolve.2
END

IF ~~ Intro.2
  SAY @1004 /* Upon closer examination you notice a faint afterglow when touching certain pieces of the necklace. */
  + ~Global("A7-AM01-Wolf","GLOBAL",0) LevelLT(LastTalkedToBy,18)~ + @1005 /* Try to remove the wolf claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Wolf","GLOBAL",0) !LevelLT(LastTalkedToBy,18)~ + @1005 /* Try to remove the wolf claw from the necklace. */ + Piece.Wolf.Granted

  + ~Global("A7-AM01-Panther","GLOBAL",0) LevelLT(LastTalkedToBy,20) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1006 /* Try to remove a smaller dangerous-looking claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Panther","GLOBAL",0) !LevelLT(LastTalkedToBy,20) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1006 /* Try to remove a smaller dangerous-looking claw from the necklace. */ + Piece.Panther.Granted

  + ~Global("A7-AM01-Panther","GLOBAL",0) LevelLT(LastTalkedToBy,20) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1007 /* Try to remove the panther claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Panther","GLOBAL",0) !LevelLT(LastTalkedToBy,20) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1007 /* Try to remove the panther claw from the necklace. */ + Piece.Panther.Granted

  + ~Global("A7-AM01-Lion","GLOBAL",0) LevelLT(LastTalkedToBy,22) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1008 /* Try to remove a bigger dangerous-looking claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Lion","GLOBAL",0) !LevelLT(LastTalkedToBy,22) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1008 /* Try to remove a bigger dangerous-looking claw from the necklace. */ + Piece.Lion.Granted

  + ~Global("A7-AM01-Lion","GLOBAL",0) LevelLT(LastTalkedToBy,22) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1009 /* Try to remove the lion claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Lion","GLOBAL",0) !LevelLT(LastTalkedToBy,22) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1009 /* Try to remove the lion claw from the necklace. */ + Piece.Lion.Granted

  + ~Global("A7-AM01-Boar","GLOBAL",0) LevelLT(LastTalkedToBy,24)~ + @1010 /* Try to remove the boar tusk from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Boar","GLOBAL",0) !LevelLT(LastTalkedToBy,24)~ + @1010 /* Try to remove the boar tusk from the necklace. */ + Piece.Boar.Granted

  + ~Global("A7-AM01-Bear","GLOBAL",0) LevelLT(LastTalkedToBy,26)~ + @1011 /* Try to remove the bear claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Bear","GLOBAL",0) !LevelLT(LastTalkedToBy,26)~ + @1011 /* Try to remove the bear claw from the necklace. */ + Piece.Bear.Granted

  ++ @1001 /* Put the necklace away. */ EXIT
END

IF ~~ Intro.3
  SAY @1012 /* What else do you want to do? */
  + ~Global("A7-AM01-Wolf","GLOBAL",0) LevelLT(LastTalkedToBy,18)~ + @1005 /* Try to remove the wolf claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Wolf","GLOBAL",0) !LevelLT(LastTalkedToBy,18)~ + @1005 /* Try to remove the wolf claw from the necklace. */ + Piece.Wolf.Granted

  + ~Global("A7-AM01-Panther","GLOBAL",0) LevelLT(LastTalkedToBy,20) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1006 /* Try to remove a smaller dangerous-looking claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Panther","GLOBAL",0) !LevelLT(LastTalkedToBy,20) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1006 /* Try to remove a smaller dangerous-looking claw from the necklace. */ + Piece.Panther.Granted

  + ~Global("A7-AM01-Panther","GLOBAL",0) LevelLT(LastTalkedToBy,20) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1007 /* Try to remove the panther claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Panther","GLOBAL",0) !LevelLT(LastTalkedToBy,20) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1007 /* Try to remove the panther claw from the necklace. */ + Piece.Panther.Granted

  + ~Global("A7-AM01-Lion","GLOBAL",0) LevelLT(LastTalkedToBy,22) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1008 /* Try to remove a bigger dangerous-looking claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Lion","GLOBAL",0) !LevelLT(LastTalkedToBy,22) CheckStatLT(LastTalkedToBy,14,WIS) CheckStatLT(LastTalkedToBy,14,INT)~
    + @1008 /* Try to remove a bigger dangerous-looking claw from the necklace. */ + Piece.Lion.Granted

  + ~Global("A7-AM01-Lion","GLOBAL",0) LevelLT(LastTalkedToBy,22) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1009 /* Try to remove the lion claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Lion","GLOBAL",0) !LevelLT(LastTalkedToBy,22) OR(2) !CheckStatLT(LastTalkedToBy,14,WIS) !CheckStatLT(LastTalkedToBy,14,INT)~
    + @1009 /* Try to remove the lion claw from the necklace. */ + Piece.Lion.Granted

  + ~Global("A7-AM01-Boar","GLOBAL",0) LevelLT(LastTalkedToBy,24)~ + @1010 /* Try to remove the boar tusk from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Boar","GLOBAL",0) !LevelLT(LastTalkedToBy,24)~ + @1010 /* Try to remove the boar tusk from the necklace. */ + Piece.Boar.Granted

  + ~Global("A7-AM01-Bear","GLOBAL",0) LevelLT(LastTalkedToBy,26)~ + @1011 /* Try to remove the bear claw from the necklace. */ + Piece.Denied
  + ~Global("A7-AM01-Bear","GLOBAL",0) !LevelLT(LastTalkedToBy,26)~ + @1011 /* Try to remove the bear claw from the necklace. */ + Piece.Bear.Granted

  ++ @1001 /* Put the necklace away. */ EXIT
END

IF ~~ Piece.Denied
  SAY @1013 /* You carefully attempt to loosen the piece from the necklace but an unknown force keeps it in place no matter how much effort you put into it. */
  IF ~~ + Intro.3
END

IF ~~ Piece.Wolf.Granted
  SAY @1014 /* You carefully attempt to loosen the piece from the necklace. At first it doesn't appear to yield. After a while, however, you feel a dormant magic awakening, and the piece literally slips into your hands. */
  IF ~!Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Wolf","GLOBAL",1) GiveItemCreate("a7-wa03",LastTalkedToBy,5,0,0)~ + Necklace.Dissolve
  IF ~OR(4) Global("A7-AM01-Panther","GLOBAL",0) Global("A7-AM01-Lion","GLOBAL",0) Global("A7-AM01-Boar","GLOBAL",0) Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Wolf","GLOBAL",1) GiveItemCreate("a7-wa03",LastTalkedToBy,5,0,0)~ EXIT
END

IF ~~ Piece.Panther.Granted
  SAY @1014 /* You carefully attempt to loosen the piece from the necklace. At first it doesn't appear to yield. After a while, however, you feel a dormant magic awakening, and the piece literally slips into your hands. */
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Panther","GLOBAL",1) GiveItemCreate("a7-wa04",LastTalkedToBy,5,0,0)~ + Necklace.Dissolve
  IF ~OR(4) Global("A7-AM01-Wolf","GLOBAL",0) Global("A7-AM01-Lion","GLOBAL",0) Global("A7-AM01-Boar","GLOBAL",0) Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Panther","GLOBAL",1) GiveItemCreate("a7-wa04",LastTalkedToBy,5,0,0)~ EXIT
END

IF ~~ Piece.Lion.Granted
  SAY @1014 /* You carefully attempt to loosen the piece from the necklace. At first it doesn't appear to yield. After a while, however, you feel a dormant magic awakening, and the piece literally slips into your hands. */
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Lion","GLOBAL",1) GiveItemCreate("a7-wa05",LastTalkedToBy,5,0,0)~ + Necklace.Dissolve
  IF ~OR(4) Global("A7-AM01-Wolf","GLOBAL",0) Global("A7-AM01-Panther","GLOBAL",0) Global("A7-AM01-Boar","GLOBAL",0) Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Lion","GLOBAL",1) GiveItemCreate("a7-wa05",LastTalkedToBy,5,0,0)~ EXIT
END

IF ~~ Piece.Boar.Granted
  SAY @1014 /* You carefully attempt to loosen the piece from the necklace. At first it doesn't appear to yield. After a while, however, you feel a dormant magic awakening, and the piece literally slips into your hands. */
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Boar","GLOBAL",1) GiveItemCreate("a7-wa06",LastTalkedToBy,5,0,0)~ + Necklace.Dissolve
  IF ~OR(4) Global("A7-AM01-Wolf","GLOBAL",0) Global("A7-AM01-Panther","GLOBAL",0) Global("A7-AM01-Lion","GLOBAL",0) Global("A7-AM01-Bear","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Boar","GLOBAL",1) GiveItemCreate("a7-wa06",LastTalkedToBy,5,0,0)~ EXIT
END

IF ~~ Piece.Bear.Granted
  SAY @1014 /* You carefully attempt to loosen the piece from the necklace. At first it doesn't appear to yield. After a while, however, you feel a dormant magic awakening, and the piece literally slips into your hands. */
  IF ~!Global("A7-AM01-Wolf","GLOBAL",0) !Global("A7-AM01-Panther","GLOBAL",0) !Global("A7-AM01-Lion","GLOBAL",0) !Global("A7-AM01-Boar","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Bear","GLOBAL",1) GiveItemCreate("a7-wa07",LastTalkedToBy,5,0,0)~ + Necklace.Dissolve
  IF ~OR(4) Global("A7-AM01-Wolf","GLOBAL",0) Global("A7-AM01-Panther","GLOBAL",0) Global("A7-AM01-Lion","GLOBAL",0) Global("A7-AM01-Boar","GLOBAL",0)~
    DO ~SetGlobal("A7-AM01-Bear","GLOBAL",1) GiveItemCreate("a7-wa07",LastTalkedToBy,5,0,0)~ EXIT
END


IF ~~ Necklace.Dissolve
  SAY @1015 /* After removing the last piece with a special afterglow, the necklace suddenly breaks into many pieces which almost instantly turn into a handful of dirt and dust. */
  IF ~~ + Necklace.Dissolve.3
END

IF ~~ Necklace.Dissolve.2
  SAY @1016 /* The necklace suddenly breaks into many pieces which almost instantly turn into a handful of dirt and dust. */
  IF ~~ + Necklace.Dissolve.3
END

IF ~~ Necklace.Dissolve.3
  SAY @1017 /* It seems the magic that held the necklace together has been spent and the ravages of time finally caught up with it. */
  IF ~~ DO ~DestroyItem("a7-am01")~ EXIT
END
