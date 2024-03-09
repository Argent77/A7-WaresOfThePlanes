// Lim-Lim inventory item
BEGIN ~a7-plimi~

IF ~True()~ limi
  SAY @100 /* This is your pet Lim-Lim. Noticing it has your attention, it chirps up at you lovingly. "Piyo!" */
  ++ @101 /* Examine your Lim-Lim. */ + limi.1
  ++ @114 /* Put your Lim-Lim down to run around a bit. */ DO ~DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
  ++ @103 /* Pet your Lim-Lim. */ + limi.2
  + ~Global("A7-LimLimKicked","GLOBAL",0)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limi.3
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",0) GlobalLT("A7-LimLimKicked","GLOBAL",10)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limi.4
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",9)~ + @104 /* Kick your Lim-Lim. */ + limi.5
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~~ limi.1
  SAY @107 /* Your Lim-Lim appears both insect and animal in origin. Its legs are oversized, but its arms are small, nearly vestigial, and a brightly speckled half-shell runs down its back. It sports twin pairs of insect-like wings, and has tiny black eyes and a mouth that always appears to be smiling gleefully. */
  ++ @114 /* Put your Lim-Lim down to run around a bit. */ DO ~DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
  ++ @103 /* Pet your Lim-Lim. */ + limi.2
  + ~Global("A7-LimLimKicked","GLOBAL",0)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limi.3
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",0) GlobalLT("A7-LimLimKicked","GLOBAL",10)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limi.4
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",9)~ + @104 /* Kick your Lim-Lim. */ + limi.5
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~~ limi.2
  SAY @115 /* "Piyo! Piyo!" The Lim-Lim squirms about merrily, its wings buzzing. It seems to enjoy the affection immensely. */
  ++ @114 /* Put your Lim-Lim down to run around a bit. */ DO ~DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
  ++ @109 /* Pet your Lim-Lim some more. */ + limi.2
  ++ @104 /* Kick your Lim-Lim. */ + limi.3
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~~ limi.3
  SAY @116 /* You attempt to drop-kick the Lim-Lim, but it squirms out of your grasp and flies to the ground! */
  ++ @117 /* "Whoops..." */ DO ~DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
END

IF ~~ limi.4
  SAY @118 /* You attempt to drop-kick the Lim-Lim again, but it squirms out of your grasp and flies to the ground! */
  ++ @117 /* "Whoops..." */ DO ~DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
END

IF ~~ limi.5
  SAY @119 /* You attempt to drop-kick the Lim-Lim again. To your surprise it lets out a shrieking chirp and glares at you menacingly before it squirms out of your grasp and flies to the ground. */
  ++ @113 /* What the... */ DO ~SetGlobal("A7-LimLimBerserk","GLOBAL",1) DestroyItem("a7-plim") CreateCreatureObject("a7-plim",Myself,0,0,0)~ EXIT
END
