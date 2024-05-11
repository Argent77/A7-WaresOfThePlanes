// Cespenar's item upgrade dialog

EXTEND_BOTTOM ~botsmith~ 4
  IF ~PartyHasItem("a7-sw05")~ + bothsmith.sword
END

APPEND ~botsmith~
  IF ~~ bothsmith.sword
    SAY @100 /* A sword that steal memories? Martha threw me into river Styx once. Water taste reeeal bad, eww. Anyway, took me years to remember way home. Even Bhaal notice gone I was. */
    IF ~OR(3) !PartyHasItem("scrl6m") !PartyHasItem("scrl9w") !PartyHasItem("restore")~ + bothsmith.sword.need
    IF ~PartyHasItem("scrl6m") PartyHasItem("scrl9w") PartyHasItem("restore")~ + bothsmith.sword.want
  END

  IF ~~ bothsmith.sword.need
    SAY @101 /* I can make stolen memories go right into your head, so you not forget your own spells. Needs scrolls of Enchanted Weapon, Energy Drain, and Restoration for enchanting. You not got all that. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.sword.want
    SAY @102 /* I can make stolen memories go right into your head, so you not forget your own spells. Needs scrolls of Enchanted Weapon, Energy Drain, and Restoration. Also needs 10,000 gp for forging and stuff. You wants? */
    + ~PartyGoldLT(10000)~ + #66594 /* I don't have that much money. */ + 10
    + ~PartyGoldGT(9999)~ + #66595 /* Sure... put them together. */
      DO ~SetGlobal("A7-Thanatos","GLOBAL",1)
          TakePartyGold(10000)
          TakePartyItemNum("a7-sw05",1)
          DestroyItem("a7-sw05")
          TakePartyItemNum("scrl6m",1)
          DestroyItem("scrl6m")
          TakePartyItemNum("scrl9w",1)
          DestroyItem("scrl9w")
          TakePartyItemNum("restore",1)
          DestroyItem("restore")
          DestroyGold(10000)~ + 11
    ++ #66597 /* No, not really. Is there anything else? */ + bothsmith.sword.stall
  END

  IF ~~ bothsmith.sword.stall
    SAY @103 /* Well, I keep on lookin'. */
    COPY_TRANS ~botsmith~ 4
  END
END
