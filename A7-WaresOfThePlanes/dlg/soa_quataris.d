// Dialog additions for the art merchant Quataris in Athkatla: Waukeen's Promenade
// Required variables:
// bye_false:  Trigger to suppress display of the "Farewell" response

APPEND ~haquat~

IF ~~ haquat.offer.1
  SAY @302 /* This is indeed an exquisite statue. */
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ + haquat.offer.chr.high
  IF ~CheckStatLT(LastTalkedToBy(Myself),16,CHR)~ + haquat.offer.chr.low
END

IF ~~ haquat.offer.2
  SAY @303 /* Please forgive my hasty judgment, I'm always happy to cater to potential customers. This statue appears to be in exquisite condition indeed. */
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ + haquat.offer.chr.high
  IF ~CheckStatLT(LastTalkedToBy(Myself),16,CHR)~ + haquat.offer.chr.low
END

IF ~~ haquat.offer.chr.high
  SAY @304 /* The extraordinary level of detail that has been worked into the statue is breathtaking. I have never heard of the artist "Lim-Lim" before, but the statue will certainly fetch a good price at the next auction anyway. */
  = @305 /* For a work of that quality I will gladly pay you 4,000 gold pieces. Are you interested? */
  ++ @306 /* Yes, I am. */ + haquat.paid.high
  ++ @307 /* No, I don't want to part with it yet. */ + haquat.refused
END

IF ~~ haquat.offer.chr.low
  SAY @308 /* Unfortunately Athkatla's nobility values paintings higher than sculptures and statues these days. I'm not familiar with an artist called "Lim-Lim", but a statue of that quality is sure to find a new owner nonetheless. */
  = @309 /* I can offer you 2,000 gold pieces for it. Are you interested? */
  ++ @306 /* Yes, I am. */ + haquat.paid.low
  ++ @307 /* No, I don't want to part with it yet. */ + haquat.refused
END

IF ~~ haquat.paid.high
  SAY @310 /* It was a pleasure doing business with you. */
  IF ~~ DO ~TakePartyItem("a7-pplim") DestroyItem("a7-pplim") GiveGoldForce(4000)~ EXIT
END

IF ~~ haquat.paid.low
  SAY @310 /* It was a pleasure doing business with you. */
  IF ~~ DO ~TakePartyItem("a7-pplim") DestroyItem("a7-pplim") GiveGoldForce(2000)~ EXIT
END

IF ~~ haquat.refused
  SAY @311 /* That's a pity. My offer still stands if you ever change your mind. Good business to you, my <LADYLORD>. */
  IF ~~ EXIT
END

END

ADD_TRANS_TRIGGER ~haquat~ 2 ~False()~ DO 0 UNLESS ~False()~

EXTEND_BOTTOM ~haquat~ 0
  + ~PartyHasItem("a7-pplim")~ + @300 /* I'd like to offer you this authentic Lim-Lim stone statue. */ + haquat.offer.1
END

EXTEND_BOTTOM ~haquat~ 2
  + ~PartyHasItem("a7-pplim")~ + @300 /* I'd like to offer you this authentic Lim-Lim stone statue. */ + haquat.offer.2
  + ~%bye_false%~ + @301 /* Never mind, I'll be on my way. */ EXIT
END
