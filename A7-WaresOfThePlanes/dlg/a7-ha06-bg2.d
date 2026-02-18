// Upgrade dialogs for Soul Mirror

// Cromwell (WSMITH01.DLG)
EXTEND_BOTTOM ~wsmith01~ 13
  IF ~PartyHasItem("a7-ha06b") Global("A7WOTP-SoulMirrorUpgrade1","AR0334",0)~ + wsmith01.check.v2.1
  IF ~PartyHasItem("a7-ha06b") !Global("A7WOTP-SoulMirrorUpgrade1","AR0334",0)~ + wsmith01.check.v2.2
  IF ~PartyHasItem("a7-ha06a")~ + wsmith01.check.v1
END

APPEND ~wsmith01~
  // Upgrade to +2
  IF ~~ wsmith01.check.v1
    SAY @200 /* Aye now… ne'er thought to see the work of our outsider kin. It's Soul Mirror—a mighty weapon indeed. */
    = @201 /* Hmm, the enchantments on that weapon seem to have weakened o'er time. I could restore them to their original state. It would cost ye 2,000 gold though. */
    + ~PartyGoldLT(2000)~ + #66662 /* I don't have that much gold. */ + wsmith01.v1.refuse
    + ~!PartyGoldLT(2000)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-SoulMirrorUpgrade1","AR0334",1)
          SetGlobal("ForgeStuff","GLOBAL",1)
          TakePartyGold(2000)
          DestroyGold(2000)
          TakePartyItem("a7-ha06a")
          DestroyItem("a7-ha06a")~ + 56
    ++ #66770 /* No. What else? */ + wsmith01.v1.refuse
  END

  IF ~~ wsmith01.v1.refuse
    SAY @202 /* Well, let's see what else ye got. */
    COPY_TRANS ~wsmith01~ 13
  END

  // Upgrade to +3 (if +2 was done in SoD)
  IF ~~ wsmith01.check.v2.1
    SAY @200 /* Aye now… ne'er thought to see the work of our outsider kin. It's Soul Mirror—a mighty weapon indeed. */
    IF ~PartyHasItem("scrl7x") PartyHasItem("scrl7y") PartyHasItem("scrl7z")~ + wsmith01.check.v2.3
    IF ~OR(3) !PartyHasItem("scrl7x") !PartyHasItem("scrl7y") !PartyHasItem("scrl7z")~ + wsmith01.check.v2.4
  END

  // Upgrade to +3 (if +2 was done by Cromwell)
  IF ~~ wsmith01.check.v2.2
    SAY @203 /* Well… with the original enchantment restored I could improve Soul Mirror even further. */
    IF ~PartyHasItem("scrl7x") PartyHasItem("scrl7y") PartyHasItem("scrl7z")~ + wsmith01.check.v2.3
    IF ~OR(3) !PartyHasItem("scrl7x") !PartyHasItem("scrl7y") !PartyHasItem("scrl7z")~ + wsmith01.check.v2.4
  END

  IF ~~ wsmith01.check.v2.3
    SAY @204 /* Ye've scrolls of conjuring fire, air, and earth elementals. If ye like, I could add their wrath to the weapon. */
    ++ #59747 /* What's involved in that? */ + wsmith01.check.v2.5
    ++ #59748 /* No, I don't think so. Do I have anything else of use? */ + wsmith01.v2.refuse
  END

  IF ~~ wsmith01.check.v2.4
    SAY @205 /* If ye had scrolls of conjuring fire, air, and earth elementals with ye I could make it even more deadly. */
    IF ~~ + wsmith01.v2.refuse
  END

  IF ~~ wsmith01.check.v2.5
    SAY #59784 /* Two things, me friend. It will cost ye 7,500 gp for the work, no less, and without an apprentice, ye'll have to stay here a full day and help me run the forge. */
    + ~PartyGoldLT(7500)~ + #66662 /* I don't have that much gold. */ + wsmith01.v2.refuse
    + ~!PartyGoldLT(7500)~ + #59785 /* That sounds fine. Let's do it. */
      DO ~SetGlobal("A7WOTP-SoulMirrorUpgrade2","AR0334",1)
          SetGlobal("ForgeStuff","GLOBAL",1)
          TakePartyGold(7500)
          DestroyGold(7500)
          TakePartyItemNum("scrl7x",1)
          DestroyItem("scrl7x")
          TakePartyItemNum("scrl7y",1)
          DestroyItem("scrl7y")
          TakePartyItemNum("scrl7z",1)
          DestroyItem("scrl7z")
          TakePartyItem("a7-ha06b")
          DestroyItem("a7-ha06b")~ + 56
    ++ #66770 /* No. What else? */ + wsmith01.v2.refuse
  END

  IF ~~ wsmith01.v2.refuse
    SAY @202 /* Well, let's see what else ye got. */
    COPY_TRANS ~wsmith01~ 13
  END
END


// Cespenar (BOTSMITH.DLG)
EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-ha06c") Global("A7WOTP-SoulMirrorUpgrade2","AR4500",0)~ + bothsmith.check.v3.1
  IF ~PartyHasItem("a7-ha06c") !Global("A7WOTP-SoulMirrorUpgrade2","AR4500",0) Global("A7WOTP-SoulMirrorUpgrade1","AR4500",0)~ + bothsmith.check.v3.2
  IF ~PartyHasItem("a7-ha06c") !Global("A7WOTP-SoulMirrorUpgrade2","AR4500",0) !Global("A7WOTP-SoulMirrorUpgrade1","AR4500",0)~ + bothsmith.check.v3.3
  IF ~PartyHasItem("a7-ha06b") Global("A7WOTP-SoulMirrorUpgrade1","AR4500",0)~ + bothsmith.check.v2.1
  IF ~PartyHasItem("a7-ha06b") !Global("A7WOTP-SoulMirrorUpgrade1","AR4500",0)~ + bothsmith.check.v2.2
  IF ~PartyHasItem("a7-ha06a")~ + bothsmith.check.v1
END

APPEND ~botsmith~
  // Upgrade to +2
  IF ~~ bothsmith.check.v1
    SAY @300 /* Ooh, what this? Big hammer? Ah, Soul Mirror! Hammer for peoples with brainpower. For 3,000 gp I could remove dust to make it hit better. You wants me to do that? */
    + ~PartyGoldLT(3000)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(3000)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-SoulMirrorUpgrade1","AR4500",1)
          TakePartyGold(3000)
          DestroyGold(3000)
          TakePartyItem("a7-ha06a")
          DestroyItem("a7-ha06a")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.v1.stall
  END

  IF ~~ bothsmith.v1.stall
    SAY @301 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END


  // Upgrade to +3 (first upgrade NOT done by Cespenar)
  IF ~~ bothsmith.check.v2.1
    SAY @302 /* Ooh, what this? Big hammer? Ah, Soul Mirror! Hammer for peoples with brainpower. Maybe you needs help with that? Tee-hee! */
    IF ~OR(3) !PartyHasItem("scrl7x") !PartyHasItem("scrl7y") !PartyHasItem("scrl7z")~ + bothsmith.check.v2.3
    IF ~PartyHasItem("scrl7x") PartyHasItem("scrl7y") PartyHasItem("scrl7z")~ + bothsmith.check.v2.4
  END

  // Upgrade to +3 (first upgrade done by Cespenar)
  IF ~~ bothsmith.check.v2.2
    SAY @303 /* Oh, big hammer Soul Mirror again? You not happy enough with cleaning? */
    IF ~OR(3) !PartyHasItem("scrl7x") !PartyHasItem("scrl7y") !PartyHasItem("scrl7z")~ + bothsmith.check.v2.3
    IF ~PartyHasItem("scrl7x") PartyHasItem("scrl7y") PartyHasItem("scrl7z")~ + bothsmith.check.v2.4
  END

  IF ~~ bothsmith.check.v2.3
    SAY @304 /* If you had scrolls to summon elementals of fire, air, and earth I could makes it hit even harder. But you don't. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.v2.4
    SAY @305 /* With scrolls to summon elementals of fire, air, and earth I could makes it hit even harder. Only for smart peoples though. Forging cost 7,500 gold, too. You wants? */
    + ~PartyGoldLT(7500)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(7500)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-SoulMirrorUpgrade2","AR4500",1)
          TakePartyGold(7500)
          DestroyGold(7500)
          TakePartyItemNum("scrl7x",1)
          DestroyItem("scrl7x")
          TakePartyItemNum("scrl7y",1)
          DestroyItem("scrl7y")
          TakePartyItemNum("scrl7z",1)
          DestroyItem("scrl7z")
          TakePartyItem("a7-ha06b")
          DestroyItem("a7-ha06b")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.v2.stall
  END

  IF ~~ bothsmith.v2.stall
    SAY @301 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END


  // Upgrade to +4 (previous upgrades NOT done by Cespenar)
  IF ~~ bothsmith.check.v3.1
    SAY @302 /* Ooh, what this? Big hammer? Ah, Soul Mirror! Hammer for peoples with brainpower. Maybe you needs help with that? Tee-hee! */
    IF ~PartyHasItem("scrl71") PartyHasItem("scrl90") PartyHasItem("scrl93") PartyHasItem("scrla2") PartyHasItem("scrl1o") PartyHasItem("scrl1u")~ + bothsmith.check.v3.4
    IF ~OR(6) !PartyHasItem("scrl71") !PartyHasItem("scrl90") !PartyHasItem("scrl93") !PartyHasItem("scrla2") !PartyHasItem("scrl1o") !PartyHasItem("scrl1u")~ + bothsmith.check.v3.5
  END

  // Upgrade to +4 (only last upgrade done by Cespenar)
  IF ~~ bothsmith.check.v3.2
    SAY @306 /* Oh, big hammer Soul Mirror again? Maybe you not smart enough? */
    IF ~PartyHasItem("scrl71") PartyHasItem("scrl90") PartyHasItem("scrl93") PartyHasItem("scrla2") PartyHasItem("scrl1o") PartyHasItem("scrl1u")~ + bothsmith.check.v3.4
    IF ~OR(6) !PartyHasItem("scrl71") !PartyHasItem("scrl90") !PartyHasItem("scrl93") !PartyHasItem("scrla2") !PartyHasItem("scrl1o") !PartyHasItem("scrl1u")~ + bothsmith.check.v3.5
  END

  // Upgrade to +4 (all upgrades done by Cespenar)
  IF ~~ bothsmith.check.v3.3
    SAY @307 /* Oh, Soul Mirror again? Hammer like bad penny. Always comes back even if you not wants. */
    IF ~PartyHasItem("scrl71") PartyHasItem("scrl90") PartyHasItem("scrl93") PartyHasItem("scrla2") PartyHasItem("scrl1o") PartyHasItem("scrl1u")~ + bothsmith.check.v3.4
    IF ~OR(6) !PartyHasItem("scrl71") !PartyHasItem("scrl90") !PartyHasItem("scrl93") !PartyHasItem("scrla2") !PartyHasItem("scrl1o") !PartyHasItem("scrl1u")~ + bothsmith.check.v3.5
  END

  IF ~~ bothsmith.check.v3.4
    SAY @308 /* With a pile of scrolls it could make extra damage even if your brain not working right. You have scrolls of Blindness, Deafness, Slow, Confusion, Invisibility, and Luck. Just needs 10,000 gp for casting job. You wants? */
    + ~PartyGoldLT(10000)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(10000)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-SoulMirrorUpgrade3","AR4500",1)
          TakePartyGold(10000)
          DestroyGold(10000)
          TakePartyItemNum("scrl71",1)
          DestroyItem("scrl71")
          TakePartyItemNum("scrl90",1)
          DestroyItem("scrl90")
          TakePartyItemNum("scrl93",1)
          DestroyItem("scrl93")
          TakePartyItemNum("scrla2",1)
          DestroyItem("scrla2")
          TakePartyItemNum("scrl1o",1)
          DestroyItem("scrl1o")
          TakePartyItemNum("scrl1u",1)
          DestroyItem("scrl1u")
          TakePartyItem("a7-ha06c")
          DestroyItem("a7-ha06c")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.v3.stall
    IF ~~ EXIT
  END

  IF ~~ bothsmith.check.v3.5
    SAY @309 /* Anyway, I have recipe to have hammer make extra damage even if your brain not works right. I needs scrolls of Blindness, Deafness, Slow, Confusion, Invisibility, and Luck for that. You not have, so I can not use recipe. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.v3.stall
    SAY @301 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END
END
