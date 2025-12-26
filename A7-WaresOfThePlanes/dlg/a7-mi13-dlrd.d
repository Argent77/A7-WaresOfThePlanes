// Demon Lord Anarazel dialog and party interjections

// Demon Lord Anarazel
BEGIN ~a7-deman~

IF ~NumTimesTalkedTo(0)~ anarazel.declaration
  SAY @700 /* ** YOUR OFFERING IS ADEQUATE. IN RETURN I WILL WREAK HAVOC UPON YOUR FOES UNTIL I AM SATISFIED. ** */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Viconia") IfValidForPartyDialogue("Viconia")~ EXTERN ~vicon25j~ viconia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Hexxat") IfValidForPartyDialogue("Hexxat")~ EXTERN ~hexxa25j~ hexxat.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Dorn") IfValidForPartyDialogue("Dorn")~ EXTERN ~dorn25j~ dorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_EVIL)~ EXTERN ~sarev25j~ sarevok.anarazel.evil.1
  IF ~!AreaCheck("AR6200") InParty("Korgan") IfValidForPartyDialogue("Korgan")~ EXTERN ~korga25j~ korgan.anarazel.1
END

IF ~InPartySlot(LastTalkedToBy,0)~ anarazel.order
  SAY @704 /* ** STATE YOUR REQUEST! ** */
  ++ @705 /* I challenge you to a duel, fiend! */ + anarazel.order.duel
  ++ @706 /* Return to the Abyss, demon! */ + anarazel.order.return
  ++ @707 /* I changed my mind. */ + anarazel.order.bye
END

IF ~!InPartySlot(LastTalkedToBy,0)~ anarazel.ignore
  SAY @708 /* ** DARE NOT TO BOTHER A LORD OF THE ABYSS WITH MEANINGLESS PRATTLE, MORTAL! ** */
  IF ~~ EXIT
END

IF ~~ anarazel.order.duel
  SAY @709 /* ** HAHAHAHA, SO BE IT. MAY YOU TREMBLE IN MY PRESENCE AND FEEL ETERNAL PAIN! ** */
  IF ~~ DO ~Enemy()~ EXIT
END

IF ~~ anarazel.order.return
  SAY @710 /* ** SO BE IT! MY PART OF THE PACT HAS BEEN FULFILLED. I SHALL DEPART. ** */
  IF ~~ DO ~SetGlobal("depart","LOCALS",1) SetGlobal("A7-DarknessDemonGone","GLOBAL",1) ApplySpellRES("a7-dspx",Myself)~ EXIT
END

IF ~~ anarazel.order.bye
  SAY @711 /* ** DO NOT TesT MY PATIENCE, MORTAL! ** */
  IF ~~ EXIT
END


// NPC interjections for Demon Lord Anarazel
APPEND ~korga25j~
IF ~~ korgan.anarazel.1
  SAY @800 /* So, th' fool's dead, eh? Betrayed as I once was, har! Let's hope this be worth all th' hassle. Let's be movin' before we give all o' this more thought than it's worth! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Viconia") IfValidForPartyDialogue("Viconia")~ EXTERN ~vicon25j~ viconia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Hexxat") IfValidForPartyDialogue("Hexxat")~ EXTERN ~hexxa25j~ hexxat.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Dorn") IfValidForPartyDialogue("Dorn")~ EXTERN ~dorn25j~ dorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_EVIL)~ EXTERN ~sarev25j~ sarevok.anarazel.evil.1
END
END


APPEND ~sarev25j~
IF ~~ sarevok.anarazel.good.1
  SAY @810 /* You disappoint me, <CHARNAME>. For all your talk about doing good deeds you still don't seem averse to following the principle that "the end justifies the means." */
  = @811 /* I killed others on a whim, too. And all it ultimately brought me was a great deal of trouble and losing everything that mattered to me. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
END

IF ~~ sarevok.anarazel.evil.1
  SAY @812 /* An impressive display of your ruthlessness, <CHARNAME>. I know how it feels to make a fine deal. It can be intoxicating, just like Sembian wine, or killing a fool that stands on your way to victory. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Viconia") IfValidForPartyDialogue("Viconia")~ EXTERN ~vicon25j~ viconia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Hexxat") IfValidForPartyDialogue("Hexxat")~ EXTERN ~hexxa25j~ hexxat.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Dorn") IfValidForPartyDialogue("Dorn")~ EXTERN ~dorn25j~ dorn.anarazel.1
END
END


APPEND ~dorn25j~
IF ~~ dorn.anarazel.1
  SAY @821 /* You made a fine choice, <CHARNAME>. I am no stranger to bloody deals, and some of them are even worth it. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Viconia") IfValidForPartyDialogue("Viconia")~ EXTERN ~vicon25j~ viconia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Hexxat") IfValidForPartyDialogue("Hexxat")~ EXTERN ~hexxa25j~ hexxat.anarazel.1
END
END


APPEND ~hexxa25j~
IF ~~ hexxat.anarazel.1
  SAY @830 /* Death comes for both those that expect it, and those that never saw it coming. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Viconia") IfValidForPartyDialogue("Viconia")~ EXTERN ~vicon25j~ viconia.anarazel.1
END
END


APPEND ~vicon25j~
IF ~~ viconia.anarazel.1
  SAY @840 /* Well, abbil, it looks like you have finally found a way to gain some powerful boon without paying too much in return. */
  = @841 /* Let us be blunt. It is your companion that paid the decisive share of the price. Lu'oh yutri. It almost feels as if I were again in Menzoberranzan! */
  IF ~!Global("ViconiaRomanceActive","GLOBAL",2)~ + viconia.anarazel.2
  IF ~Global("ViconiaRomanceActive","GLOBAL",2)~ + viconia.anarazel.romance.1
END

IF ~~ viconia.anarazel.2
  SAY @842 /* As a drow you would have certainly aroused the matron mother's attention by now, colnbluth. If not with your impertinence, then with your guts. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
END

IF ~~ viconia.anarazel.romance.1
  SAY @843 /* It makes me wonder, <CHARNAME>, would you exchange me for a boon, considering it was tempting enough? */
  + ~Alignment("Viconia",MASK_EVIL)~ + @844 /* What? No! Of course not! */ + viconia.anarazel.romance.evil.1
  + ~!Alignment("Viconia",MASK_EVIL)~ + @844 /* What? No! Of course not! */ + viconia.anarazel.romance.neutral.1
  ++ @845 /* If the reward was big enough… */ DO ~SetGlobal("ViconiaRomanceActive","GLOBAL",3)~ + viconia.anarazel.romance.break.1
END

IF ~~ viconia.anarazel.romance.evil.1
  SAY @846 /* Mhm. Well, know that drow rarely forget such offense. And if we find a way to endure, we return it with all we've got. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
END

IF ~~ viconia.anarazel.romance.neutral.1
  SAY @847 /* I'm… glad to hear that, ussta ku'nal. I was betrayed far too many times already, and I think I finally deserve some genuine comfort! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
END

IF ~~ viconia.anarazel.romance.break.1
  SAY @848 /* I've suspected that. Leave me then, og'elend. You do not deserve my attention! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Edwin") IfValidForPartyDialogue("Edwin")~ EXTERN ~edwin25j~ edwin.anarazel.1
END
END


APPEND ~edwin25j~
IF ~~ edwin.anarazel.1
  SAY @860 /* So, this is how you thank those that agreed to help you with your fatuous endeavors. That is good to know. (At least it wasn't me, Edwin Odesseiron, who had to face such ridiculous untimely death.) */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
  IF ~!AreaCheck("AR6200") InParty("Haerdalis") IfValidForPartyDialogue("Haerdalis")~ EXTERN ~haerd25j~ haerdalis.anarazel.1
END
END


APPEND ~haerd25j~
IF ~~ haerdalis.anarazel.1
  SAY @870 /* How bold, my raven. 'Tis quite a crime you have committed, a murderous act. I wonder if this decision shall haunt you in your sleep, or will you just accept that you aren't as different from your father as it may have seemed? */
  = @871 /* We'd best have a care now. The denizens of the nether planes are seldom if ever as generous as they appear. They twist their words back and forth to make even this sparrow's head ache like after a round tour of Sigil's ale houses. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_CHAOTIC)~ EXTERN ~anome25j~ anomen.anarazel.chaotic.1
END
END


APPEND ~anome25j~
IF ~~ anomen.anarazel.lawful.1
  SAY @1050 /* As a member of the Order of the Radiant Heart, I cannot tolerate this most evil of crimes of making an unholy pact with a demon from the Abyss. */
  IF ~!Global("AnomenRomanceActive","GLOBAL",2)~ DO ~LeaveParty() ReallyForceSpellRES("OHSMODE3",Myself) Enemy()~ + anomen.anarazel.lawful.attack.1
  IF ~Global("AnomenRomanceActive","GLOBAL",2)~ + anomen.anarazel.romance.lawful.1
END

IF ~~ anomen.anarazel.lawful.attack.1
  SAY @1051 /* My righteous wrath will smite you, <CHARNAME>! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
END

IF ~~ anomen.anarazel.chaotic.1
  SAY @1052 /* Honestly, <CHARNAME>, it doesn't really surprise me that you would stoop so low and even consort with demons. */
  IF ~!Global("AnomenRomanceActive","GLOBAL",2)~ + anomen.anarazel.chaotic.stay.1
  IF ~Global("AnomenRomanceActive","GLOBAL",2)~ + anomen.anarazel.romance.chaotic.1
END

IF ~~ anomen.anarazel.chaotic.stay.1
  SAY @1053 /* I'm not sure I can even say that you disappoint me by doing all of this. That thought occurred to me, at first, but perhaps it's not disappointment that I feel. It's more like a realization that you aren't as much of a hero as some would expect you to be. */
  = @1054 /* What is done is done. I have nothing more to say to you, <CHARNAME>. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
END

IF ~~ anomen.anarazel.romance.lawful.1
  SAY @1055 /* But it breaks my heart that the woman I love could deceive me all this time. I… I cannot look at you now, or I would go mad. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + anomen.anarazel.romance.lawful.leave.1
END

IF ~~ anomen.anarazel.romance.lawful.leave.1
  SAY @1056 /* Farewell, my former love. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
END

IF ~~ anomen.anarazel.romance.chaotic.1
  SAY @1057 /* It almost breaks my heart that a person I love could deceive me all this time. Make me see you as trustworthy. But the keyword here is "almost". I want you to look at me. */
  = @1058 /* Let me ask you one question. Were your feelings for me genuine? Or was it always a game to you? */
  + ~CheckStatGT(Player1,12,CHR)~ + @1059 /* I do love you, Anomen. */ + anomen.anarazel.romance.chaotic.confirm.1
  + ~!CheckStatGT(Player1,12,CHR)~ + @1059 /* I do love you, Anomen. */ + anomen.anarazel.romance.chaotic.deceived.1
  ++ @1060 /* I'm sorry, Anomen. I cannot answer that question. */ + anomen.anarazel.romance.chaotic.rejected.1
END

IF ~~ anomen.anarazel.romance.chaotic.confirm.1
  SAY @1061 /* I see. I was secretly hoping for this answer, even if that does not erase everything you have done. In the scope of your mission, however, it… does make sense. You do play with chaos. You are somewhat of a wild card. */
  = @1062 /* I choose to believe you. But before we can talk again, I may need a moment to calm down. We should move on. The sooner we do so, the better. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
END

IF ~~ anomen.anarazel.romance.chaotic.deceived.1
  SAY @1063 /* I see. Even now I am unsure if your words hold any truth or if you are toying with me. Either way, staying with you would only make me doubt my ability to see through the mask you wear every now and then, thus I see no choice but to leave. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + anomen.anarazel.romance.chaotic.leave.1
END

IF ~~ anomen.anarazel.romance.chaotic.rejected.1
  SAY @1064 /* I see. I was a fool to trust you. To love you, even. But it won't happen again. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + anomen.anarazel.romance.chaotic.leave.1
END

IF ~~ anomen.anarazel.romance.chaotic.leave.1
  SAY @1056 /* Farewell, my former love. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Jan") IfValidForPartyDialogue("Jan")~ EXTERN ~jan25j~ jan.anarazel.1
END
END


APPEND ~jan25j~
IF ~~ jan.anarazel.1
  SAY @880 /* You know, I can't help but think back to the time when I helped out Uncle Gerhardt in our kitchen garden. It was an especially good year for our vegetables. The mix of sun and rain did wonders, but I digress. */
  = @881 /* Anyway, we were also constantly battling these pesky parasites on our potato plants. They were a real nuisance. I have never seen one that is human-sized, though. But now that I see you before me with Mr. Demon roaring in the background, I'm not so sure anymore. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Neera") IfValidForPartyDialogue("Neera")~ EXTERN ~neera25j~ neera.anarazel.1
END
END


APPEND ~neera25j~
IF ~~ neera.anarazel.1
  SAY @890 /* You just did WHAT? How could you? I'm just— NO. I won't even think about it. I did summon demons by accident before, but never at that price. */
  = @891 /* Let's—let's just pretend that was a spell that went awry, like the time before. Or I will have nightmares for the rest of my life. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Wilson") IfValidForPartyDialogue("Wilson")~ EXTERN ~wilsonj~ wilson.anarazel.1
END
END


APPEND ~wilsonj~
IF ~~ wilson.anarazel.1
  SAY @900 /* Grr! Roar! Snort growl! */
  ++ @901 /* Have you just compared me to some sort of disappointment? A scar that almost became the doom of a lion's pride?! Seriously?! */ + wilson.anarazel.2
END

IF ~~ wilson.anarazel.2
  SAY @902 /* ROAR! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Cernd") IfValidForPartyDialogue("Cernd")~ EXTERN ~cernd25j~ cernd.anarazel.1
END
END


APPEND ~cernd25j~
IF ~~ cernd.anarazel.1
  SAY @910 /* I have seen people fear me as I became a monster covered in fur, but what I have seen now—it is much more terrifying than any transformation I have ever seen before. */
  = @911 /* Your decision to bring chaos and destruction to these lands worries me greatly. I can already hear the earth scream in pain under the touch of the demon's corruption wherever it treads. */
  = @912 /* I need to think long and hard about this catastrophic turn of events and my own association with you. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
  IF ~!AreaCheck("AR6200") InParty("Jaheira") IfValidForPartyDialogue("Jaheira")~ EXTERN ~jahei25j~ jaheira.anarazel.1
END
END


APPEND ~jahei25j~
IF ~~ jaheira.anarazel.1
  SAY @920 /* <CHARNAME>, I can't believe what you just did! */
  IF ~!Global("JaheiraRomanceActive","GLOBAL",2)~ + jaheira.anarazel.2
  IF ~Global("JaheiraRomanceActive","GLOBAL",2)~ + jaheira.anarazel.romance.1
END

IF ~~ jaheira.anarazel.2
  SAY @921 /* Not only are you associating with demons, but you've also committed the worst crime of all by betraying our companion! By Silvanus, I can't stand by and let you continue on this path of madness. What would Gorion say were he with us! */
  ++ @922 /* He's not. He's dead, Jaheira. */ + jaheira.anarazel.stay.1
  ++ @923 /* Jaheira, please… */ + jaheira.anarazel.stay.3
END

IF ~~ jaheira.anarazel.stay.1
  SAY @924 /* I know. But—you clearly don't get it. */
  IF ~~ DO ~BitSet("A7-DarknessRetribution","GLOBAL",BIT2) SetGlobalTimer("A7-DarknessRetributionTimer","GLOBAL",SIX_DAYS)~ + jaheira.anarazel.stay.2
END

IF ~~ jaheira.anarazel.stay.2
  SAY @925 /* Those Who Harp will find out about this. I will stay with you, but only because Gorion wanted me to watch over you, and for the sake of Toril. Know, however, that I thought you were better than this! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
END

IF ~~ jaheira.anarazel.stay.3
  SAY @926 /* Don't say anything else, <CHARNAME>. */
  IF ~~ DO ~BitSet("A7-DarknessRetribution","GLOBAL",BIT2) SetGlobalTimer("A7-DarknessRetributionTimer","GLOBAL",SIX_DAYS)~ + jaheira.anarazel.stay.4
END

IF ~~ jaheira.anarazel.stay.4
  SAY @927 /* Those Who Harp will find out about this eventually. I will stay as part of this group, but only because Gorion wanted me to watch over you, and for the sake of Toril. But—know that I thought you were better than this. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
END

IF ~~ jaheira.anarazel.romance.1
  SAY @928 /* You sacrificed our companion in cold blood? This is the worst of crimes! I thought you were better than this! But—what you did reminds me of your murderous father. This is what Bhaal would expect his <PRO_SONDAUGHTER> to do. */
  ++ @929 /* That was really low of you. */ + jaheira.anarazel.romance.2
  ++ @930 /* Jaheira, please… I was scared! I had to do this! I need all the aid I can get. All the power—or I may lose this war. */ + jaheira.anarazel.romance.3
END

IF ~~ jaheira.anarazel.romance.2
  SAY @931 /* I am sorry, <CHARNAME>, but I think you needed to hear this. What else was this if not murder? */
  IF ~~ + jaheira.anarazel.romance.4
END

IF ~~ jaheira.anarazel.romance.3
  SAY @932 /* And does any of this feel like a win to you? */
  IF ~~ + jaheira.anarazel.romance.4
END

IF ~~ jaheira.anarazel.romance.4
  SAY @933 /* To think that I wanted to spend my life with you. But now I see more and more of the monster in you that took and killed my husband once. */
  ++ @934 /* With the challenges before us our list of options grows short. I had no choice but to take desperate measures. */ + jaheira.anarazel.romance.leave.1
  ++ @935 /* I confess that my actions were rash and reckless. But I can no longer undo this decision, Jaheira… */ DO ~SetGlobal("JaheiraRomanceActive","GLOBAL",3)~ + jaheira.anarazel.romance.stay.1
END

IF ~~ jaheira.anarazel.romance.leave.1
  SAY @936 /* That's all you have to say? This is too much to bear. I… I can no longer stay by your side, <CHARNAME>. I was supposed to watch over you. I wanted to do this for Gorion, but this is my limit. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + jaheira.anarazel.romance.leave.2
END

IF ~~ jaheira.anarazel.romance.leave.2
  SAY @937 /* I hope you will defeat your enemies, help others, and I will watch you from a distance, but I cannot stay with someone whom I can no longer trust. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
END

IF ~~ jaheira.anarazel.romance.stay.1
  SAY @938 /* Sadly, that realization comes too late. I will stay as part of this group, but only because Gorion wanted me to watch over you, and for the sake of Toril. But—know that this changes things between us. I would rather die than admit that I still love you. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Nalia") IfValidForPartyDialogue("Nalia")~ EXTERN ~nalia25j~ nalia.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Sarevok") IfValidForPartyDialogue("Sarevok") Alignment("Sarevok",MASK_GOOD)~ EXTERN ~sarev25j~ sarevok.anarazel.good.1
END
END


APPEND ~nalia25j~
IF ~~ nalia.anarazel.1
  SAY @950 /* By all the gods! What did you do, <CHARNAME>? This is far worse than what nobles like the Roenalls would ever be capable of doing. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + nalia.anarazel.2
END

IF ~~ nalia.anarazel.2
  SAY @951 /* I don't want to imagine what you might be capable of next time. I have to leave now. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Imoen2") IfValidForPartyDialogue("Imoen2")~ EXTERN ~imoen25j~ imoen.anarazel.1
END
END


APPEND ~imoen25j~
IF ~~ imoen.anarazel.1
  SAY @960 /* No, <CHARNAME>! Why did you do this to <A7_SACRIFICE>? Gorion would never have approved of that, even under the direst of circumstances. */
  = @961 /* When I was in the custody of Irenicus I had witnessed many horrible things in the course of his experiments. They still plague me in my sleep. I'm pretty sure what you've done will haunt you in your dreams. If not today, then in the future. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Minsc") IfValidForPartyDialogue("Minsc")~ EXTERN ~minsc25j~ minsc.anarazel.1
END
END


APPEND ~minsc25j~
IF ~~ minsc.anarazel.1
  SAY @970 /* Boo's shaking like he's never shaken before. Even Minsc is puzzled as to what happened to our companion <A7_SACRIFICE>. */
  ++ @971 /* I had to make a decision that wasn't easy to me. But it was necessary. Have you always understood Dynaheir and the witches of Rashemen? Aren't paths to glory paved with difficult decisions? */ + minsc.anarazel.2
  ++ @972 /* Sometimes we have to break an egg, or skull, to achieve our goals. I'm certain that our companion would have understood the necessary sacrifice. */ + minsc.anarazel.3
END

IF ~~ minsc.anarazel.2
  SAY @973 /* I feel ashamed and angry. But neither Minsc nor Boo do not really understand what's truly on your mind. We shall keep an eye on you. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
END

IF ~~ minsc.anarazel.3
  SAY @974 /* A warrior breaks skulls, and eggs, with their own weapon in hand. Even Boo agrees wholeheartedly. We will keep a watchful eye on you, <CHARNAME>. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Valygar") IfValidForPartyDialogue("Valygar")~ EXTERN ~valyg25j~ valygar.anarazel.1
END
END


APPEND ~valyg25j~
IF ~~ valygar.anarazel.1
  SAY @980 /* You fool! You sacrificed a trusted companion for that abomination? This is worse than Lavok would have ever done. */
  IF ~~ DO ~LeaveParty() ReallyForceSpellRES("OHSMODE3",Myself) Enemy()~ + valygar.anarazel.enemy.1
END

IF ~~ valygar.anarazel.enemy.1
  SAY @981 /* Even with the demon on your side I will not stand for this! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Rasaad") IfValidForPartyDialogue("Rasaad")~ EXTERN ~rasaa25j~ rasaad.anarazel.1
END
END


APPEND ~rasaa25j~
IF ~~ rasaad.anarazel.1
  SAY @990 /* <CHARNAME>, with this sacrifice, you have invited the darkness into your heart. */
  IF ~!Global("RasaadRomanceActive","GLOBAL",2)~ + rasaad.anarazel.2
  IF ~Global("RasaadRomanceActive","GLOBAL",2)~ + rasaad.anarazel.romance.1
END

IF ~~ rasaad.anarazel.2
  SAY @991 /* It will spread further and throw your soul off balance. I implore you to take time and reflect on what you did today, before the shadows extinguish the remaining light in your soul. */
  = @992 /* I considered leaving you, as I do not want to invite such darkness into my own heart, but I also know that we need to save the realms from the cruel fate that threatens them. But I cannot ignore what you did; now I know that you aren't just a hero, but also a beast that may kill those on your way. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
END

IF ~~ rasaad.anarazel.romance.1
  SAY @993 /* I do not understand how you could even consider such an act? I thought you were better than that, that you want to spread peace and hope, but what you have done—it has nothing to do with any of these. */
  ++ @994 /* To survive the challenges before us, we are sometimes forced to make difficult decisions. */ + rasaad.anarazel.romance.2
  ++ @995 /* You are being overly dramatic, Rasaad. */ DO ~LeaveParty() EscapeArea()~ + rasaad.anarazel.romance.leave.1
END

IF ~~ rasaad.anarazel.romance.2
  SAY @996 /* I thought I understood you, <CHARNAME>. I really did. Now I'm not so sure anymore. */
  + ~!CheckStatGT(Player1,13,CHR)~ + @997 /* You must believe me that I didn't make this decision lightly. */ + rasaad.anarazel.romance.leave.2
  + ~CheckStatGT(Player1,13,CHR)~ + @998 /* You must believe me that I didn't make this decision lightly. The sacrifice of our companion will probably haunt me for the rest of my life. */ + rasaad.anarazel.romance.stay.1
  ++ @999 /* Seriously? Fine then. Leave. I know where this is heading. */ DO ~LeaveParty() EscapeArea()~ + rasaad.anarazel.romance.leave.4
END

IF ~~ rasaad.anarazel.romance.stay.1
  SAY @1000 /* I won't pretend to understand your decision, <CHARNAME>. But as long as I can see the light in your eyes, I will do everything in my power to help you ease the weight of your guilt about what happened today. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
END

IF ~~ rasaad.anarazel.romance.leave.1
  SAY @1001 /* Truly? I am sorry, <CHARNAME>, I truly am, but I'm starting to feel like I do not know you. I am no longer sure if you truly care about the balance: nor the one around us, nor the one in your heart. I think it's best if I leave. I hope that one day you'll understand that this was a mistake. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
END

IF ~~ rasaad.anarazel.romance.leave.2
  SAY @1002 /* How can I believe what you said is true? The light I once saw in your eyes is gone. I do not think I can go on like that. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + rasaad.anarazel.romance.leave.3
END

IF ~~ rasaad.anarazel.romance.leave.3
  SAY @1003 /* Thank you for everything you have given me. But seeing you as you are now is too painful for me to stay by your side. Goodbye. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
END

IF ~~ rasaad.anarazel.romance.leave.4
  SAY @1004 /* I am sorry, <CHARNAME>, I truly am, but I'm starting to feel like I do not know you. I am no longer sure if you truly care about the balance: nor the one around us, nor the one in your heart. I hope that one day you'll understand that this was a mistake. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Mazzy") IfValidForPartyDialogue("Mazzy")~ EXTERN ~mazzy25j~ mazzy.anarazel.1
END
END


APPEND ~mazzy25j~
IF ~~ mazzy.anarazel.1
  SAY @1010 /* You have just performed the most atrocious act possible by sacrificing your companion, <CHARNAME>! */
  IF ~!Alignment(Player1,MASK_EVIL)~ + mazzy.anarazel.notevil.1
  IF ~Alignment(Player1,MASK_EVIL)~ + mazzy.anarazel.evil.1
END

IF ~~ mazzy.anarazel.notevil.1
  SAY @1011 /* How could I've been so blind and not notice the darkness festering in your soul? That is something I have to ponder on. */
  IF ~~ DO ~LeaveParty() EscapeArea()~ + mazzy.anarazel.notevil.2
END

IF ~~ mazzy.anarazel.notevil.2
  SAY @1012 /* I cannot, in good conscience, remain with your group anymore. I shall pray for your soul, <CHARNAME>. May we meet never again. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
END

IF ~~ mazzy.anarazel.evil.1
  SAY @1013 /* I should have acted long before it came to this. Now, I am just as responsible as you are, <CHARNAME>, for having this poor soul sent to the Abyss. */
  IF ~~ DO ~LeaveParty() ReallyForceSpellRES("OHSMODE3",Myself) Enemy()~ + mazzy.anarazel.evil.2
END

IF ~~ mazzy.anarazel.evil.2
  SAY @1014 /* I cannot, and will not, tolerate these activities any longer. Even if I fall in the face of such overwhelming adversaries, I know that my soul will be redeemed for my inaction in this matter. For Arvoreen! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
  IF ~!AreaCheck("AR6200") InParty("Aerie") IfValidForPartyDialogue("Aerie")~ EXTERN ~aerie25j~ aerie.anarazel.1
END
END


APPEND ~aerie25j~
IF ~~ aerie.anarazel.1
  SAY @1020 /* <CHARNAME>? How could… how could you so casually sacrifice one of our companions?! There are no circumstances under which that could be considered just…! */
  IF ~!Global("AerieRomanceActive","GLOBAL",2)~ + aerie.anarazel.2
  IF ~Global("AerieRomanceActive","GLOBAL",2)~ + aerie.anarazel.romance.1
END

IF ~~ aerie.anarazel.2
  SAY @1021 /* And to summon a demon from hell, no less? You frighten me in more than one way. */
  + ~!CheckStatGT(Player1,15,CHR)~ + @1022 /* Sometimes drastic actions are required to survive. Aerie, we are fighting gods and fate itself! I saw little other choice in this matter. */
    DO ~LeaveParty() ApplySpellRES("a7-dc04a",Myself)~ + aerie.anarazel.manipulate.fail.1
  + ~CheckStatGT(Player1,15,CHR)~ + @1022 /* Sometimes drastic actions are required to survive. Aerie, we are fighting gods and fate itself! I saw little other choice in this matter. */ + aerie.anarazel.manipulate.success.1
END

IF ~~ aerie.anarazel.manipulate.fail.1
  SAY @1023 /* Did you really? What else is going to happen? Later? Will I be the next victim in your plans? There are things one should never justify, no matter what. I… I can't stay anymore. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END

IF ~~ aerie.anarazel.manipulate.success.1
  SAY @1024 /* No, there is always a choice. There must be. Please tell me it was just a reckless decision. Tell me that this isn't you. This CANNOT be you…! */
  ++ @1025 /* You are right. I didn't think of all the consequences when I performed the ritual. A mistake like that won't happen again. */ + aerie.anarazel.manipulate.success.stay.1
  ++ @1026 /* There may be other choices. But none of those would have achieved what I needed. I stand by my decision with all their consequences. */
    DO ~LeaveParty() ApplySpellRES("a7-dc04a",Myself)~ + aerie.anarazel.manipulate.success.leave.1
END

IF ~~ aerie.anarazel.manipulate.success.stay.1
  SAY @1027 /* I… I don't like it. Not at all. But I try to cope with the situation. But I need some time now. Leave me. Please. I need some space. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END

IF ~~ aerie.anarazel.manipulate.success.leave.1
  SAY @1028 /* I didn't want to believe it. But I see now what you really are. I… I can't stay anymore. Now, when I look you in the eyes, I see the abyss, and I can't stand it. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END

IF ~~ aerie.anarazel.romance.1
  SAY @1029 /* I… I thought that I knew you. But to think you were capable of doing such a horrible thing? I can't… believe it. Were you always like this? Or has something inside you just… broke? */
  ++ @1030 /* I saw no other option without losing you or anyone else. I'm truly sorry for what I had to do, but I would do ANYTHING so you and me could stay together. Even if that meant killing someone else! I love you, Aerie. */ + aerie.anarazel.romance.manipulate.1
  ++ @1031 /* Sometimes bold actions are required to survive. I had little choice in this matter. */
    DO ~LeaveParty() TakePartyItem("aeriebab") ApplySpellRES("a7-dc04a",Myself)~ + aerie.anarazel.romance.leave.1
END

IF ~~ aerie.anarazel.romance.manipulate.1
  SAY @1032 /* How can you even say such a thing? And combine it with such a confession…! <A7_SACRIFICE> died at your own hands! */
  + ~!CheckStatGT(Player1,15,CHR)~ + @1033 /* I never meant to hurt you, Aerie. I swear, but—we are facing gods, monsters and fate itself! I cannot protect us with just normal shields and tricks, not anymore. I had to do this. */
    DO ~LeaveParty() TakePartyItem("aeriebab") ApplySpellRES("a7-dc04a",Myself)~ + aerie.anarazel.romance.manipulate.leave.1
  + ~CheckStatGT(Player1,15,CHR)~ + @1034 /* I never meant to hurt you, Aerie. I swear, but—we are facing gods, monsters and fate itself! I cannot protect us with just normal shields and tricks, not anymore. Know, however, that what I did for us will probably haunt me for the rest of my life. */ + aerie.anarazel.romance.manipulate.stay.1
END

IF ~~ aerie.anarazel.romance.manipulate.leave.1
  SAY @1035 /* I… I wished with all my heart that I could believe you. But I don't. I sense a malevolent darkness in your words that frightens me, <CHARNAME>. I… I have to get away from you. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END

IF ~~ aerie.anarazel.romance.manipulate.stay.1
  SAY @1036 /* I don't like it. Is that really the way to save anyone…? No. I don't think that is right. I can accept that you are afraid, because I am afraid too, but this…? */
  IF ~~ DO ~SetGlobal("AerieRomanceActive","GLOBAL",3)~ + aerie.anarazel.romance.manipulate.stay.2
END

IF ~~ aerie.anarazel.romance.manipulate.stay.2
  SAY @1037 /* I'll stay with you, <CHARNAME>, but what you did—I can't forget it—nor I can forgive you. It's just… too much. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END

IF ~~ aerie.anarazel.romance.leave.1
  SAY @1038 /* Did you really? I hear your words but they are cold and distant. More like that of a monster than a man. You frighten me, <CHARNAME>. I… I have to get away from you. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  IF ~!AreaCheck("AR6200") InParty("Keldorn") IfValidForPartyDialogue("Keldorn")~ EXTERN ~keldo25j~ keldorn.anarazel.1
  IF ~!AreaCheck("AR6200") InParty("Anomen") IfValidForPartyDialogue("Anomen") Alignment("Anomen",MASK_LAWFUL)~ EXTERN ~anome25j~ anomen.anarazel.lawful.1
END
END


APPEND ~keldo25j~
IF ~~ keldorn.anarazel.1
  SAY @1071 /* I cannot believe that you made a pact with a force of such unfathomable evil. Explain yourself immediately, <CHARNAME>! */
  + ~!Alignment(Player1,MASK_EVIL) CheckStatGT(Player1,16,CHR) Global("A7-DarknessRitualSacrificeEvil","GLOBAL",1) !Global("A7-DarknessRitualSacrificeFemale","GLOBAL",1)~
    + @1072 /* In the face of increasingly powerful adversaries I had little choice but to take drastic measures. I truly regret the sacrifice of our companion, but I think it was justified. <A7_SACRIFICE> made no secret of his evil intent. */ + keldorn.anarazel.evilvictim.truth.1
  + ~!Alignment(Player1,MASK_EVIL) CheckStatGT(Player1,16,CHR) Global("A7-DarknessRitualSacrificeEvil","GLOBAL",1) Global("A7-DarknessRitualSacrificeFemale","GLOBAL",1)~
    + @1073 /* In the face of increasingly powerful adversaries I had little choice but to take drastic measures. I truly regret the sacrifice of our companion, but I think it was justified. <A7_SACRIFICE> made no secret of her evil intent. */ + keldorn.anarazel.evilvictim.truth.1

  + ~OR(2) Alignment(Player1,MASK_EVIL) !CheckStatGT(Player1,16,CHR) Global("A7-DarknessRitualSacrificeEvil","GLOBAL",1) !Global("A7-DarknessRitualSacrificeFemale","GLOBAL",1)~
    + @1072 /* In the face of increasingly powerful adversaries I had little choice but to take drastic measures. I truly regret the sacrifice of our companion, but I think it was justified. <A7_SACRIFICE> made no secret of his evil intent. */ + keldorn.anarazel.evilvictim.lie.1
  + ~OR(2) Alignment(Player1,MASK_EVIL) !CheckStatGT(Player1,16,CHR) Global("A7-DarknessRitualSacrificeEvil","GLOBAL",1) Global("A7-DarknessRitualSacrificeFemale","GLOBAL",1)~
    + @1073 /* In the face of increasingly powerful adversaries I had little choice but to take drastic measures. I truly regret the sacrifice of our companion, but I think it was justified. <A7_SACRIFICE> made no secret of her evil intent. */ + keldorn.anarazel.evilvictim.lie.1

  + ~!Alignment(Player1,MASK_EVIL)~ + @1074 /* In hindsight, that decision was probably reckless and stupid. With the incredible powers of the tome in my hands I didn't fully realize all the consequences. */ + keldorn.anarazel.reckless.truth.1
  + ~Alignment(Player1,MASK_EVIL)~ + @1074 /* In hindsight, that decision was probably reckless and stupid. With the incredible powers of the tome in my hands I didn't fully realize all the consequences. */ + keldorn.anarazel.reckless.lie.1

  ++ @1075 /* You have no right to judge me. I stand by my decision and their consequences. */ + keldorn.anarazel.attack.1
END

IF ~~ keldorn.anarazel.evilvictim.truth.1
  SAY @1076 /* Destroying one evil can never justify the act of another evil, <CHARNAME>. You performed an atrocious act of pure evil today, even if you may not be aware of the full extent of your actions. */
  IF ~!ReputationGT(Player1,17)~ + keldorn.anarazel.leave.1
  IF ~ReputationGT(Player1,17)~ + keldorn.anarazel.stay.1
END

IF ~~ keldorn.anarazel.evilvictim.lie.1
  SAY @1077 /* I wish I could believe you, but I don't. */
  IF ~!ReputationGT(Player1,17)~ + keldorn.anarazel.evilvictim.lie.2
  IF ~ReputationGT(Player1,17)~ + keldorn.anarazel.leave.1
END

IF ~~ keldorn.anarazel.evilvictim.lie.2
  SAY @1078 /* Your attempts to justify your actions sound insincere and self-serving. */
  IF ~~ + keldorn.anarazel.attack.1
END

IF ~~ keldorn.anarazel.reckless.truth.1
  SAY @1079 /* Your intentions may not be truly evil, but the damage has been done nonetheless. */
  IF ~!ReputationGT(Player1,17)~ + keldorn.anarazel.leave.1
  IF ~ReputationGT(Player1,17)~ + keldorn.anarazel.stay.1
END

IF ~~ keldorn.anarazel.reckless.lie.1
  SAY @1080 /* You have a way with pretty words, <CHARNAME>, but I can see through them well enough. With your half-hearted attempt to justify this atrocity you are merely adding insult to injury. */
  IF ~~ + keldorn.anarazel.attack.1
END

IF ~~ keldorn.anarazel.stay.1
  SAY @1081 /* However, I must also admit that your actions in the past were honorable. */
  IF ~~ + keldorn.anarazel.stay.2
END

IF ~~ keldorn.anarazel.stay.2
  SAY @1082 /* Even though I take a great risk I still believe that you can be redeemed. The road will be a long and hard one, but I am willing to guide you through the trials if you accept me on your side. */
  ++ @1083 /* I accept your offer and thank you for your mercy. */ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
  ++ @1084 /* No, I don't think this is worth it. I have to refuse. */ + keldorn.anarazel.stay.3
END

IF ~~ keldorn.anarazel.stay.3
  SAY @1085 /* I truly regret your decision, <CHARNAME>. But one cannot be forced against their will to become a better <PRO_MANWOMAN>. I will take my leave now. */
  IF ~~ DO ~BitSet("A7-DarknessRetribution","GLOBAL",BIT1) SetGlobalTimer("A7-DarknessRetributionTimer","GLOBAL",THREE_DAYS) EscapeArea()~ + keldorn.anarazel.leave.2
END

IF ~~ keldorn.anarazel.leave.1
  SAY @1086 /* I cannot, in conscience, remain with you any longer. */
  IF ~~ DO ~BitSet("A7-DarknessRetribution","GLOBAL",BIT1) SetGlobalTimer("A7-DarknessRetributionTimer","GLOBAL",THREE_DAYS) EscapeArea()~ + keldorn.anarazel.leave.2
END

IF ~~ keldorn.anarazel.leave.2
  SAY @1087 /* The Order will be made aware of your misdeeds and act appropriately. */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
END

IF ~~ keldorn.anarazel.attack.1
  SAY @1088 /* Even if I should fall in the line of duty, I cannot, in good conscience, stand idly by and let you get away with this. */
  IF ~~ DO ~LeaveParty() ReallyForceSpellRES("OHSMODE3",Myself) Enemy()~ + keldorn.anarazel.attack.2
END

IF ~~ keldorn.anarazel.attack.2
  SAY @1089 /* For Torm and the Order! */
  IF ~~ DO ~StartCutSceneMode() StartCutSceneEx("a7-rep",TRUE)~ EXIT
END
END
