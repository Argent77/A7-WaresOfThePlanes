// Upgrade dialogs for Soul Mirror

// Jegg Hillcarver (BDJEGG.DLG)
EXTEND_BOTTOM ~bdjegg~ 4 12 14 85
  + ~PartyHasItem("a7-ha06a")~ + @100 /* I've purchased this war hammer recently. Since it's obviously of dwarven design I wondered whether you could make it better? */ + bdjegg.ask.1
END

EXTEND_BOTTOM ~bdjegg~ 5 49
  + ~PartyHasItem("a7-ha06a")~ + @100 /* I've purchased this war hammer recently. Since it's obviously of dwarven design I wondered whether you could make it better? */ DO ~SetGlobal("bd_pc_met_jegg","GLOBAL",1)~ + bdjegg.ask.1
END

EXTEND_BOTTOM ~bdjegg~ 90
  IF ~Global("a7_upgrade_soul_mirror","GLOBAL",1)~ DO ~GiveItemCreate("a7-ha06b",LastTalkedToBy,0,0,0) SetGlobal("a7_upgrade_soul_mirror","GLOBAL",2) SetGlobal("bd_jegg_forge","MYAREA",0) AddJournalEntry(@500,INFO)~ + 92
END


APPEND ~bdjegg~

IF ~~ bdjegg.ask.1
  SAY @101 /* Oh, that's a design I haven't seen in a long while. From our outsider kin, I'd say? Let me take a look. Maybe there is something I can do. */
  ++ @102 /* Here you go. */ DO ~TakePartyItem("a7-ha06a") DestroyItem("a7-ha06a") SetGlobalTimer("a7_upgrade_soul_mirror_timer","GLOBAL",ONE_DAY) SetGlobal("a7_upgrade_soul_mirror","GLOBAL",1)~ + 52
  ++ @103 /* I've changed my mind. The weapon is good as it is. */ + 59
END

IF WEIGHT #7 ~Global("bd_jegg_forge","BD2100",1) Global("a7_upgrade_soul_mirror","GLOBAL",1)~ bdjegg.deliver
  SAY @104 /* It is done. I was able to restore the base enchantment of the hammer. It should hit more accurately now. Here, take it! */
  IF ~~ DO ~GiveItemCreate("a7-ha06b",LastTalkedToBy,0,0,0) SetGlobal("a7_upgrade_soul_mirror","GLOBAL",2) SetGlobal("bd_jegg_forge","MYAREA",0) AddJournalEntry(@500,INFO)~ EXIT
END

END
