// Lim-Lim creature
BEGIN ~a7-plimc~

IF ~Global("A7-LimLimFlee","GLOBAL",0)~ limc
  SAY @100 /* This is your pet Lim-Lim. Noticing it has your attention, it chirps up at you lovingly. "Piyo!" */
  ++ @101 /* Examine your Lim-Lim. */ + limc.1
  ++ @102 /* Pick your Lim-Lim back up. */ DO ~GiveItemCreate("a7-plim",LastTalkedToBy,1,0,0) DestroySelf()~ EXIT
  ++ @103 /* Pet your Lim-Lim. */ + limc.2
  + ~Global("A7-LimLimKicked","GLOBAL",0)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limc.3
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",0) GlobalLT("A7-LimLimKicked","GLOBAL",10)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limc.4
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",9)~ + @104 /* Kick your Lim-Lim. */ + limc.5
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~!Global("A7-LimLimFlee","GLOBAL",0)~ limc.flee
  SAY @106 /* Your pet Lim-Lim is still upset by your recent aggressive behavior and quickly hops out of your reach. */
  IF ~~ EXIT
END

IF ~~ limc.1
  SAY @107 /* Your Lim-Lim appears both insect and animal in origin. Its legs are oversized, but its arms are small, nearly vestigial, and a brightly speckled half-shell runs down its back. It sports twin pairs of insect-like wings, and has tiny black eyes and a mouth that always appears to be smiling gleefully. */
  ++ @102 /* Pick your Lim-Lim back up.*/ DO ~GiveItemCreate("a7-plim",LastTalkedToBy,1,0,0) DestroySelf()~ EXIT
  ++ @103 /* Pet your Lim-Lim. */ + limc.2
  + ~Global("A7-LimLimKicked","GLOBAL",0)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limc.3
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",0) GlobalLT("A7-LimLimKicked","GLOBAL",10)~ + @104 /* Kick your Lim-Lim. */ DO ~IncrementGlobal("A7-LimLimKicked","GLOBAL",1)~ + limc.4
  + ~GlobalGT("A7-LimLimKicked","GLOBAL",9)~ + @104 /* Kick your Lim-Lim. */ + limc.5
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~~ limc.2
  SAY @108 /* "Piyo! Piyo!" The Lim-Lim bounces about merrily, its wings buzzing. It seems to enjoy the affection immensely. */
  ++ @102 /* Pick your Lim-Lim back up. */ DO ~GiveItemCreate("a7-plim",LastTalkedToBy,1,0,0) DestroySelf()~ EXIT
  ++ @109 /* Pet your Lim-Lim some more. */ + limc.2
  ++ @104 /* Kick your Lim-Lim. */ + limc.3
  ++ @105 /* Stop playing with your Lim-Lim for now. */ EXIT
END

IF ~~ limc.3
  SAY @110 /* You attempt to land a swift kick to your Lim-Lim, but it hops nimbly out of the way. "Piyo!" It turns and flees for a while, wings buzzing. */
  IF ~~ DO ~SetGlobal("A7-LimLimFlee","GLOBAL",1) SetGlobalTimer("A7-LimLimFleeTimer","GLOBAL",18)~ EXIT
END

IF ~~ limc.4
  SAY @111 /* You attempt to land a swift kick to your Lim-Lim again, but it hops nimbly out of the way. "Piyo!" It turns and flees for a while, wings buzzing. */
  IF ~~ DO ~SetGlobal("A7-LimLimFlee","GLOBAL",1) SetGlobalTimer("A7-LimLimFleeTimer","GLOBAL",18)~ EXIT
END

IF ~~ limc.5
  SAY @112 /* You attempt to land a swift kick to your Lim-Lim again, but to your surprise it lets out a shrieking chirp and glares at you menacingly. */
  ++ @113 /* What the... */ DO ~SetGlobal("A7-LimLimBerserk","GLOBAL",1)~ EXIT
END
