// Dialogs for "Eyes of Mask"

// Dialog placeholder for "Challenge 3" rogues
BEGIN ~a7-ch3r~


// Conversable items: Eyes of Mask

// Dormant Eyes of Mask
BEGIN ~a7-am02~

IF ~!PartyHasItemIdentified("a7-am02")~ Inspect.Unknown.1
  SAY @305 /* The mask is light, yet very sturdy. You feel a slight tingle when you run your fingers over the surface of the artifact. */
  IF ~~ EXIT
END

IF ~!HasItemEquiped("a7-am02",LastTalkedToBy)~ Inspect.Basic.1
  SAY @306 /* As you focus your thoughts on the mask it emits a faint glow and you can sense a distant murmur in your head. */
  IF ~~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ Unlock.Basic.1
  SAY @300 /* A voice resonates in your head: Face my trials to unlock my powers. */
  + ~!AreaCheck("a7wp04") OR(2) XPLT(Player1,20000) !Global("A7-Rogue-Init","GLOBAL",2)~ + @301 /* I am ready. */ + Unlock.Basic.Denied
  + ~!AreaCheck("a7wp04") !XPLT(Player1,20000) Global("A7-Rogue-Init","GLOBAL",2)~ + @301 /* I am ready. */
    DO ~SetGlobal("A7-MaskChallenge","GLOBAL",1) ClearAllActions() StartCutSceneMode() StartCutScene("a7-emct1")~ EXIT
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~True()~ Unlock.Basic.2
  SAY @303 /* A voice resonates in your head: You are not worthy of my powers. */
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~~ Unlock.Basic.Denied
  SAY @304 /* You are not yet strong enough to challenge me. */
  IF ~~ DO ~DisplayString(LastTalkedToBy,@108)~ EXIT
END


// Eyes of Mask
BEGIN ~a7-am02a~

IF ~!HasItemEquiped("a7-am02a",LastTalkedToBy)~ Inspect.Improved.1
  SAY @306 /* As you focus your thoughts on the mask it emits a faint glow and you can sense a distant murmur in your head. */
  IF ~~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ Unlock.Improved.1
  SAY @300 /* A voice resonates in your head: Face my trials to unlock my powers. */
  + ~!AreaCheck("a7wp04") XPLT(Player1,440000)~ + @301 /* I am ready. */ + Unlock.Improved.Denied
  + ~!AreaCheck("a7wp04") !XPLT(Player1,440000)~ + @301 /* I am ready. */
    DO ~SetGlobal("A7-MaskChallenge","GLOBAL",2) ClearAllActions() StartCutSceneMode() StartCutScene("a7-emct1")~ EXIT
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~True()~ Unlock.Improved.2
  SAY @303 /* A voice resonates in your head: You are not worthy of my powers. */
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~~ Unlock.Improved.Denied
  SAY @304 /* You are not yet strong enough to challenge me. */
  IF ~~ DO ~DisplayString(LastTalkedToBy,@109)~ EXIT
END


// Improved Eyes of Mask
BEGIN ~a7-am02b~

IF ~!HasItemEquiped("a7-am02b",LastTalkedToBy)~ Inspect.Perfect.1
  SAY @306 /* As you focus your thoughts on the mask it emits a faint glow and you can sense a distant murmur in your head. */
  IF ~~ EXIT
END

IF ~InPartySlot(LastTalkedToBy,0)~ Unlock.Perfect.1
  SAY @300 /* A voice resonates in your head: Face my trials to unlock my powers. */
  + ~!AreaCheck("a7wp04") XPLT(Player1,1760000)~ + @301 /* I am ready. */ + Unlock.Perfect.Denied
  + ~!AreaCheck("a7wp04") !XPLT(Player1,1760000)~ + @301 /* I am ready. */
    DO ~SetGlobal("A7-MaskChallenge","GLOBAL",3) ClearAllActions() StartCutSceneMode() StartCutScene("a7-emct1")~ EXIT
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~True()~ Unlock.Perfect.2
  SAY @303 /* A voice resonates in your head: You are not worthy of my powers. */
  ++ @302 /* Put the mask away. */ EXIT
END

IF ~~ Unlock.Perfect.Denied
  SAY @304 /* You are not yet strong enough to challenge me. */
  IF ~~ DO ~DisplayString(LastTalkedToBy,@110)~ EXIT
END
