// Upgrade dialogs for Magus Guard

// Cromwell
EXTEND_BOTTOM ~wsmith01~ 13
  IF ~PartyHasItem("a7-br03")~ + wsmith01.check.1
END

APPEND ~wsmith01~
  IF ~~ wsmith01.check.1
    SAY @1000 /* Hmm, ye've got a nice enough bracelet there. */
    IF ~OR(2) !PartyHasItem("scrl67") !PartyHasItem("misc42")~ + wsmith01.check.failed.1
    IF ~PartyHasItem("scrl67") PartyHasItem("misc42")~ + wsmith01.check.met.1
  END

  IF ~~ wsmith01.check.failed.1
    SAY @1001 /* If ye had a scroll of Armor and a diamond I could reinforce the enchantments on the Magus Guard. */
    IF ~~ + wsmith01.refuse
  END

  IF ~~ wsmith01.check.met.1
    SAY @1002 /* Ye've got a scroll of Armor and a diamond. With it I could reinforce the enchantments on the Magus Guard. */
    ++ #59747 /* What's involved in that? */ + wsmith01.check.met.2
    ++ #59748 /* No, I don't think so. Do I have anything else of use? */ + wsmith01.refuse
  END

  IF ~~ wsmith01.check.met.2
    SAY @1003 /* Two things, me friend. It will cost ye 3,000 gp for the work, no less, and without an apprentice, ye'll have to stay here a full day and help me run the forge. */
    + ~PartyGoldLT(3000)~ + #66662 /* I don't have that much gold. */ + wsmith01.refuse
    + ~!PartyGoldLT(3000)~ + #59785 /* That sounds fine. Let's do it. */
      DO ~SetGlobal("A7WOTP-MagusGuardUpgrade","AR0334",1)
          SetGlobal("ForgeStuff","GLOBAL",1)
          TakePartyGold(3000)
          DestroyGold(3000)
          TakePartyItemNum("scrl67",1)
          DestroyItem("scrl67")
          TakePartyItemNum("misc42",1)
          DestroyItem("misc42")
          TakePartyItem("a7-br03")
          DestroyItem("a7-br03")~ + 56
    ++ #66770 /* No. What else? */ + wsmith01.refuse
  END

  IF ~~ wsmith01.refuse
    SAY @1004 /* Well, let's see what else ye got. */
    COPY_TRANS ~wsmith01~ 13
  END
END


// Cespenar
EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-br03")~ + bothsmith.check.1
END

APPEND ~botsmith~
  IF ~~ bothsmith.check.1
    SAY @1100 /* Oh, shiny bracelet? Making Magus Guard better can I with diamond and scroll of Armor. A bargain it is, isn't it? */
    IF ~True()~ + bothsmith.check.failed.3
    IF ~PartyHasItem("scrl67") !PartyHasItem("misc42")~ + bothsmith.check.failed.2
    IF ~!PartyHasItem("scrl67") PartyHasItem("misc42")~ + bothsmith.check.failed.1
    IF ~PartyHasItem("scrl67") PartyHasItem("misc42")~ + bothsmith.check.met.1
  END

  IF ~~ bothsmith.check.failed.1
    SAY @1101 /* You not have scroll of Armor? You even poorer than Cespenar. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.failed.2
    SAY @1102 /* You not have diamond? You even poorer than Cespenar. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.failed.3
    SAY @1103 /* You not got all that, though. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.met.1
    SAY @1104 /* You got all that. Just needs 3,000 gold to put all together. */
    + ~PartyGoldLT(3000)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(3000)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-MagusGuardUpgrade","AR4500",1)
          TakePartyGold(3000)
          DestroyGold(3000)
          TakePartyItemNum("scrl67",1)
          DestroyItem("scrl67")
          TakePartyItemNum("misc42",1)
          DestroyItem("misc42")
          TakePartyItem("a7-br03")
          DestroyItem("a7-br03")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.stall
  END

  IF ~~ bothsmith.stall
    SAY @1105 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END
END
