// Cespenar's item upgrade dialog

EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-mi07")~ + bothsmith.hourglass
END

APPEND ~botsmith~
  IF ~~ bothsmith.hourglass
    SAY @100 /* Oh, an hourglass. You need to boil eggs? */
    IF ~!PartyHasItem("misc5c") !PartyHasItem("misc5z")~ + bothsmith.hourglass.need
    IF ~PartyHasItem("misc5c")~ + bothsmith.hourglass.want.1
    IF ~PartyHasItem("misc5z")~ + bothsmith.hourglass.want.2
  END

  IF ~~ bothsmith.hourglass.need
    SAY @101 /* Combine with Rift Device to boil many eggs at same time. But anger of the gods you risk by keeping it. Do you dare? */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.hourglass.want.1
    SAY @102 /* Combine with Rift Device to boil many eggs at same time. That and 10,000 gp and I will do it for you. Is good deal? */
    + ~PartyGoldLT(10000)~ + #66594 /* I don't have that much money. */ + 10
    + ~PartyGoldGT(9999)~ + #66595 /* Sure... put them together. */
      DO ~SetGlobal("A7-ImprovedHourglass","GLOBAL",1)
          TakePartyGold(10000)
          TakePartyItemNum("a7-mi07",1)
          DestroyItem("a7-mi07")
          TakePartyItemNum("misc5c",1)
          DestroyItem("misc5c")
          DestroyGold(10000)~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.hourglass.stall
  END

  IF ~~ bothsmith.hourglass.want.2
    SAY @102 /* Combine with Rift Device to boil many eggs at same time. That and 10,000 gp and I will do it for you. Is good deal? */
    + ~PartyGoldLT(10000)~ + #66594 /* I don't have that much money. */ + 10
    + ~PartyGoldGT(9999)~ + #66595 /* Sure... put them together. */
      DO ~SetGlobal("A7-ImprovedHourglass","GLOBAL",1)
          TakePartyGold(10000)
          TakePartyItemNum("a7-mi07",1)
          DestroyItem("a7-mi07")
          TakePartyItemNum("misc5z",1)
          DestroyItem("misc5z")
          DestroyGold(10000)~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.hourglass.stall
  END

  IF ~~ bothsmith.hourglass.stall
    SAY @103 /* Let me see what else you have. */
    COPY_TRANS ~botsmith~ 4
  END
END
