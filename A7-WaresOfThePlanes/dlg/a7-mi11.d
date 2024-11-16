// Cromwell comments on the Holy Ward of Amaunator

APPEND ~WSMITH01~
	IF ~~ WSMITH01.1
    SAY @200 /* Eh? Ye've gotten hold of a relic of long forgotten Amaunator? Looks like it lost much of its potency o'er the ages. */
    = @201 /* That does nae fall within my area of work, though. Ye could ask one of the Lathanderites over in th' Temple District about it. */
    IF ~~ DO ~SetGlobal("a7-mi11-upgrade","GLOBAL",1)~ UNSOLVED_JOURNAL @300 + WSMITH01.2
	END

	IF ~~ WSMITH01.2
    SAY @202 /* Well, let's see what else ye got. */
		COPY_TRANS WSMITH01 13
	END

END

EXTEND_BOTTOM ~WSMITH01~ 13
	IF ~Global("a7-mi11-upgrade","GLOBAL",0) PartyHasItem("a7-mi11")~ + WSMITH01.1
END


// Dawnmaster Kreel comments on the Holy Ward of Amaunator

APPEND ~DAWNMAS~
  IF ~~ DAWNMAS.1
    SAY @211 /* It's an ancient relic to combat undead. You are brave adventurers indeed to battle Lathander's most hated enemies. Unfortunately much knowledge was lost when the temples of Amaunator were abandoned or taken over by his enemies. */
    IF ~~ + DAWNMAS.3
  END

  IF ~~ DAWNMAS.2
    SAY @212 /* It's an ancient relic to combat undead. You are a brave adventurer indeed to battle Lathander's most hated enemies. Unfortunately much knowledge was lost when the temples of Amaunator were abandoned or taken over by his enemies. */
    IF ~~ + DAWNMAS.3
  END

  IF ~~ DAWNMAS.3
    SAY @213 /* I can only advise you to make a journey to one of these sites yourself. Rumors have it that the residents of Imnesvale in the Umar Hills still know the location of an old temple dedicated to Amaunator. */
    IF ~~ DO ~SetGlobal("a7-mi11-upgrade","GLOBAL",2) RevealAreaOnMap("AR1100")~ UNSOLVED_JOURNAL @301 EXIT
  END
END

EXTEND_BOTTOM ~DAWNMAS~ 0
  + ~GlobalLT("a7-mi11-upgrade","GLOBAL",2) PartyHasItem("a7-mi11") !NumInParty(1)~ + @210 /* I have an artifact of Amaunator in my possession. Can you do something to make it more potent? */ + DAWNMAS.1
  + ~GlobalLT("a7-mi11-upgrade","GLOBAL",2) PartyHasItem("a7-mi11") NumInParty(1)~ + @210 /* I have an artifact of Amaunator in my possession. Can you do something to make it more potent? */ + DAWNMAS.2
END


// Statue in Amaunator's temple hints at the Holy Ward of Amaunator

APPEND ~SHAAVA01~
  IF ~~ SHAAVA01.1
    SAY @221 /* The Statue of Amaunator has been restored once again. Present the Symbol of Amaunator and your offerings to receive His gifts. */
    COPY_TRANS SHAAVA01 19
  END
END

EXTEND_BOTTOM ~SHAAVA01~ 19
  IF ~GlobalLT("a7-mi11-upgrade","GLOBAL",4) PartyHasItem("a7-mi11")~ DO ~SetGlobal("a7-mi11-upgrade","GLOBAL",4)~ UNSOLVED_JOURNAL @303 + SHAAVA01.1
END
