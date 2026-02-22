// Upgrade dialog for Final Judgment

EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-ax09")~ + bothsmith.check.1
  IF ~PartyHasItem("a7-ax09b")~ + bothsmith.check.2
END

APPEND ~botsmith~
  IF ~~ bothsmith.check.1
    SAY @1000 /* Oh no, you has axe from executioner! Cespenar got caught after all? */
    = @1001 /* Ah, Final Judgment it is. Curse from axe I can take with scroll of Remove Curse. But only for a while. Curse is pretty strong because stubborn spirit lives in axe. It come back any time. */
    IF ~True()~ + bothsmith.check.failed.1
    IF ~OR(2) PartyHasItem("scrl5g") PartyHasItem("scrlak")~ + bothsmith.check.met.1
  END

  IF ~~ bothsmith.check.2
    SAY @1002 /* Ah, axe is cursed again? With scroll of Remove Curse I can puts it to sleep once more. */
    IF ~True()~ + bothsmith.check.failed.1
    IF ~OR(2) PartyHasItem("scrl5g") PartyHasItem("scrlak")~ + bothsmith.check.met.1
  END

  IF ~~ bothsmith.check.failed.1
    SAY @1003 /* You no have scroll, so curse must remain. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.met.1
    SAY @1004 /* You have scroll of Remove Curse. For 2,000 gold I can get to work. */
    + ~PartyGoldLT(2000)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(2000) PartyHasItem("scrl5g") !PartyHasItem("scrlak")~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-FinalJudgmentUpgrade","AR4500",1)
          TakePartyGold(2000)
          DestroyGold(2000)
          TakePartyItemNum("scrl5g",1)
          DestroyItem("scrl5g")
          TakePartyItem("a7-ax09")
          DestroyItem("a7-ax09")
          TakePartyItem("a7-ax09b")
          DestroyItem("a7-ax09b")~ + 11
    + ~!PartyGoldLT(2000) PartyHasItem("scrlak")~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-FinalJudgmentUpgrade","AR4500",1)
          TakePartyGold(2000)
          DestroyGold(2000)
          TakePartyItemNum("scrlak",1)
          DestroyItem("scrlak")
          TakePartyItem("a7-ax09")
          DestroyItem("a7-ax09")
          TakePartyItem("a7-ax09b")
          DestroyItem("a7-ax09b")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.stall
  END

  IF ~~ bothsmith.stall
    SAY @1005 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END
END
