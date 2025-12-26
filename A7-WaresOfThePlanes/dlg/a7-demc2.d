// Lure of Darkness: Cultist (ambush)

BEGIN ~a7-demc2~

IF ~True()~ cultist.intro
  SAY @366  /* Greetings. Our leader wants to talk to you about a certain item that came into your possession recently. */
  IF ~~ EXTERN ~a7-demc1~ leader.intro.1
END
