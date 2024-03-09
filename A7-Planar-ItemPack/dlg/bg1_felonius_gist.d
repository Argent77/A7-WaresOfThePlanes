// Dialog additions for Felonius Gist in Baldur's Gate

APPEND ~feloni~

IF ~~ feloni.offer.1
  SAY @201 /* Well, let me see it. */
  IF ~CheckStatGT(LastTalkedToBy(Myself),15,CHR)~ + feloni.offer.chr.high
  IF ~CheckStatGT(LastTalkedToBy(Myself),8,CHR) CheckStatLT(LastTalkedToBy(Myself),16,CHR)~ + feloni.offer.chr.mid
  IF ~CheckStatLT(LastTalkedToBy(Myself),9,CHR)~ + feloni.offer.chr.low
END

IF ~~ feloni.offer.chr.high
  SAY @202 /* The statue is indeed masterfully crafted, with so much care put into every detail. I can offer you a thousand gold pieces for it. Are you agreeable? */
  ++ @203 /* Yes, I am. */ + feloni.paid.high
  ++ @204 /* No. I don't want to part with it. */ + feloni.refused
END

IF ~~ feloni.offer.chr.mid
  SAY @205 /* The statue appears to be authentic indeed. I doubt a ruffian like you acquired it by any legal means. But I suppose there is no harm in doing business with you. I can offer you 400 gold for it. Are you agreeable? */
  ++ @203 /* Yes, I am. */ + feloni.paid.low
  ++ @204 /* No. I don't want to part with it. */ + feloni.refused
END

IF ~~ feloni.offer.chr.low
  SAY @206 /* It's doubtful that a ruffian like you has anything *authentic* to offer. This statue has more likely been robbed from a burial site or some barbarian camp. I don't want to have anything to do with it. I kindly ask you to leave now. */
  IF ~~ EXIT
END

IF ~~ feloni.paid.high
  SAY @207 /* It was a pleasure doing business with you. If you will excuse me now, I have to take care of my new acquisition. */
  IF ~~ DO ~TakePartyItem("a7-pplim") DestroyItem("a7-pplim") GiveGoldForce(1000)~ EXIT
END

IF ~~ feloni.paid.low
  SAY @208 /* Fine. Our business is concluded. If you will excuse me now, I have to take care of my new acquisition. */
  IF ~~ DO ~TakePartyItem("a7-pplim") DestroyItem("a7-pplim") GiveGoldForce(400)~ EXIT
END

IF ~~ feloni.refused
  SAY @209 /* That is unfortunate. If you have no more business with me then I kindly ask you to leave now. */
  IF ~~ EXIT
END

END


EXTEND_BOTTOM ~feloni~ 0
  + ~PartyHasItem("a7-pplim")~ + @200 /* I've heard you are a collector of art and antiques. I'd like to offer you this authentic Lim-Lim stone statue. */ + feloni.offer.1
END
