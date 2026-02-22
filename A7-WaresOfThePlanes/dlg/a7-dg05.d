// Upgrade dialog for Entropic Blade

EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-dg05")~ + bothsmith.check.1
END

APPEND ~botsmith~
  IF ~~ bothsmith.check.1
    SAY @1000 /* Ooh, Entropic Blade? Is nice dagger. But can be even nicer if weapon heals you when hitting enemies. Just needs scrolls of Energy Drain and Larloch's Minor Drain for that. */
    IF ~True()~ + bothsmith.check.failed.1
    IF ~PartyHasItem("scrl84") PartyHasItem("scrl9w")~ + bothsmith.check.met.1
  END

  IF ~~ bothsmith.check.failed.1
    SAY @1001 /* You not have all scrolls though, so no free healing from poking. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.check.met.1
    SAY @1002 /* You have scrolls already? Then add them I can for just 5,000 gold. */
    + ~PartyGoldLT(5000)~ + #66594 /* I don't have that much money. */ + 10
    + ~!PartyGoldLT(5000)~ + #66664 /* Sure, do it. */
      DO ~SetGlobal("A7WOTP-EntropicBladeUpgrade","AR4500",1)
          TakePartyGold(5000)
          DestroyGold(5000)
          TakePartyItemNum("scrl84",1)
          DestroyItem("scrl84")
          TakePartyItemNum("scrl9w",1)
          DestroyItem("scrl9w")
          TakePartyItem("a7-dg05")
          DestroyItem("a7-dg05")~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.stall
  END

  IF ~~ bothsmith.stall
    SAY @1003 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END
END
