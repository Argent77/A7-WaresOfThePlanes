BEGIN ~a7-merc~

// Talking to Ebb for the first time
IF ~NumTimesTalkedTo(0)~ Intro
  SAY @0 /* Ah, hello there. You've come to the right place. */
  = @1 /* Ebb Creakknees is my name. Third Measure of the Harmonium, as if that means something here in this far-off place. I'm retired now, semi-retired actually, and spend my time and money travelling the planes. */
  // Clearing "StoreUpdated" as safety measure if a store upgrade happened before the introduction
  IF ~~ DO ~SetGlobal("StoreUpdated","LOCALS",0) SetName(%ebb_name_strref%)~ JOURNAL @3000 FLAGS 512 + Intro.1
END

IF ~~ Intro.1
  SAY @2 /* I've also collected lots of treasures over the years on my travels across the planes. You're welcome to buy anything you like. Keeps my purse filled. */
  + ~Global("TalkHarmonium","LOCALS",0)~ + @3 /* Third Measure of the Harmonium? */ DO ~SetGlobal("TalkHarmonium","LOCALS",1)~ FLAGS 512 + Intro.Harmonium.1
  + ~Global("TalkHarmonium","LOCALS",1)~ + @4 /* What can you tell me about Sigil? */ DO ~SetGlobal("TalkHarmonium","LOCALS",2)~ FLAGS 512 + Intro.Sigil.1
  + ~Global("CustomerScene","LOCALS",2) Global("TalkCustomer","LOCALS",0)~ + @5 /* What happened to the customer you've talked to before? */ DO ~SetGlobal("TalkCustomer","LOCALS",1)~ FLAGS 512 + Intro.Customer.1
  ++ @6 /* What do you have for sale? */ DO ~SetGlobal("TalkStore","LOCALS",1)~ + Store.1

  // Variable "A7-Campaign" is set in his creature script
  + ~Global("A7-Campaign","GLOBAL",1) Global("TalkByeBG1","LOCALS",0)~ + @7 /* Never mind. Farewell. */ DO ~SetGlobal("TalkByeBG1","LOCALS",1)~ + Bye.BG1.1
  + ~Global("A7-Campaign","GLOBAL",1) !Global("TalkByeBG1","LOCALS",0)~ + @7 /* Never mind. Farewell. */ EXIT
  + ~Global("A7-Campaign","GLOBAL",3) Global("TalkByeSoA","LOCALS",0)~ + @7 /* Never mind. Farewell. */ DO ~SetGlobal("TalkByeSoA","LOCALS",1)~ + Bye.SoA.1
  + ~Global("A7-Campaign","GLOBAL",3) !Global("TalkByeSoA","LOCALS",0)~ + @7 /* Never mind. Farewell. */ EXIT
  + ~!Global("A7-Campaign","GLOBAL",1) !Global("A7-Campaign","GLOBAL",3)~ + @7 /* Never mind. Farewell. */ EXIT
END

IF ~~ Intro.2
  SAY @8 /* Anything else you'd like to know? */
  + ~Global("TalkHarmonium","LOCALS",0)~ + @9 /* You mentioned the Harmonium earlier. Who are they? */ DO ~SetGlobal("TalkHarmonium","LOCALS",1)~ FLAGS 512 + Intro.Harmonium.1
  + ~Global("TalkHarmonium","LOCALS",1)~ + @4 /* What can you tell me about Sigil? */ DO ~SetGlobal("TalkHarmonium","LOCALS",2)~ FLAGS 512 + Intro.Sigil.1
  + ~Global("CustomerScene","LOCALS",2) Global("TalkCustomer","LOCALS",0)~ + @5 /* What happened to the customer you've talked to before? */ DO ~SetGlobal("TalkCustomer","LOCALS",1)~ FLAGS 512 + Intro.Customer.1
  ++ @6 /* What do you have for sale? */ DO ~SetGlobal("TalkStore","LOCALS",1)~ + Store.1

  // Variable "A7-Campaign" is set in his creature script
  + ~Global("A7-Campaign","GLOBAL",1) Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeBG1","LOCALS",1)~ + Bye.BG1.1
  + ~Global("A7-Campaign","GLOBAL",1) !Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~Global("A7-Campaign","GLOBAL",3) Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeSoA","LOCALS",1)~ + Bye.SoA.1
  + ~Global("A7-Campaign","GLOBAL",3) !Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~!Global("A7-Campaign","GLOBAL",1) !Global("A7-Campaign","GLOBAL",3)~ + @10 /* Nothing. Farewell. */ EXIT
END


// Triggers quest "Lure of Darkness"
IF ~Global("A7-Campaign","GLOBAL",4) GlobalGT("Chapter","GLOBAL",%bg2_chapter_7%) Global("A7-DiscOffered","LOCALS",0)~ DarknessQuest.Intro
  SAY @200 /* You come back at the right time. I have recently acquired a strange metal disc as payment for one of my items. */
  IF ~~ + DarknessQuest.Disc.1
END


// Default state for talking to Ebb
IF ~True()~ Default
  SAY @11 /* Good t'see ye again, <LADGAL>. Back for more, eh? */
  IF ~!Global("StoreUpdated","LOCALS",1)~ + Default.1
  // Phazor quest is triggered in ToB chapter 9
  IF ~Global("A7-Campaign","GLOBAL",4) Global("Chapter","GLOBAL",%bg2_chapter_9%) Global("A7-PhazorQuest","GLOBAL",0)~ DO ~SetGlobal("A7-PhazorQuest","GLOBAL",1)~ FLAGS 512 + PhazorQuest.1
  // Phazor quest is completed
  IF ~Global("A7-PhazorQuest","GLOBAL",5)~ DO ~SetGlobal("A7-PhazorQuest","GLOBAL",9)~ + PhazorQuest.5
  // Ebb informs you about his store upgrade (triggered every time a store upgrade has been performed; variable "StoreUpdated" is set in his creature script.)
  IF ~Global("StoreUpdated","LOCALS",1)~ DO ~SetGlobal("StoreUpdated","LOCALS",0)~ + StoreUpdated.1
END

IF ~~ Default.1
  SAY @12 /* What can ol' Ebb do for you on this fine day? */
  + ~Global("TalkHarmonium","LOCALS",0)~ + @9 /* You mentioned the Harmonium earlier. Who are they? */ DO ~SetGlobal("TalkHarmonium","LOCALS",1)~ FLAGS 512 + Harmonium.1
  + ~Global("TalkHarmonium","LOCALS",1)~ + @4 /* What can you tell me about Sigil? */ DO ~SetGlobal("TalkHarmonium","LOCALS",2)~ FLAGS 512 + Sigil.1
  + ~Global("TalkStore","LOCALS",1) Global("StoreNoLabels","LOCALS",0)~ + @13 /* Why are all your wares unlabeled? It feels like a gamble to buy something from you. */ DO ~SetGlobal("StoreNoLabels","LOCALS",1)~ FLAGS 512 + NoLabels.1

  + ~Global("A7-PhazorQuest","GLOBAL",1)~ + @14 /* Can you tell me more about the broken artifact? */ DO ~SetGlobal("A7-PhazorQuest","GLOBAL",2)~ FLAGS 512 + PhazorQuest.2
  + ~Global("A7-PhazorQuest","GLOBAL",2) OR(3) !PartyHasItem("MISC6Z") !PartyHasItem("SCRL7J") !PartyHasItem("SCRL7T")~ + @15 /* Can you tell me about the broken artifact again? */ + PhazorQuest.3
  + ~Global("A7-PhazorQuest","GLOBAL",2) PartyHasItem("MISC6Z") PartyHasItem("SCRL7J") PartyHasItem("SCRL7T")~ + @16 /* I have found the items required to repair the broken artifact. */ + PhazorQuest.4

  + ~Global("A7-DiscOffered","LOCALS",1)~ + @218 /* I'd like to talk about the Green Steel Disc again. */ + DarknessQuest.Disc.Query.1
  + ~Global("A7-DarknessQuest","GLOBAL",3) PartyHasItem("a7-mi13x")~ + @250 /* With the help of the metal disc we have discovered a tome written in an unknown language. Do you know how to translate it? */ + DarknessQuest.Translate.1

  + ~Global("TalkStore","LOCALS",0)~ + @6 /* What do you have for sale? */ DO ~SetGlobal("TalkStore","LOCALS",1)~ + Store.1
  + ~!Global("TalkStore","LOCALS",0)~ + @17 /* Please show me your wares. */ DO ~StartStore("a7-merc",LastTalkedToBy(Myself))~ EXIT

  // Variable "A7-Campaign" is set in his creature script
  + ~Global("A7-Campaign","GLOBAL",1) Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeBG1","LOCALS",1)~ + Bye.BG1.1
  + ~Global("A7-Campaign","GLOBAL",1) !Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~Global("A7-Campaign","GLOBAL",3) Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeSoA","LOCALS",1)~ + Bye.SoA.1
  + ~Global("A7-Campaign","GLOBAL",3) !Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~!Global("A7-Campaign","GLOBAL",1) !Global("A7-Campaign","GLOBAL",3)~ + @10 /* Nothing. Farewell. */ EXIT
END

IF ~~ Default.2
  SAY @18 /* Anything else? */
  + ~Global("TalkHarmonium","LOCALS",0)~ + @9 /* You mentioned the Harmonium earlier. Who are they? */ DO ~SetGlobal("TalkHarmonium","LOCALS",1)~ FLAGS 512 + Harmonium.1
  + ~Global("TalkHarmonium","LOCALS",1)~ + @4 /* What can you tell me about Sigil? */ DO ~SetGlobal("TalkHarmonium","LOCALS",2)~ FLAGS 512 + Sigil.1
  + ~Global("TalkStore","LOCALS",1) Global("StoreNoLabels","LOCALS",0)~ + @13 /* Why are all your wares unlabeled? It feels like a gamble to buy something from you. */ DO ~SetGlobal("StoreNoLabels","LOCALS",1)~ FLAGS 512 + NoLabels.1

  + ~Global("A7-PhazorQuest","GLOBAL",1)~ + @14 /* Can you tell me more about the broken artifact? */ DO ~SetGlobal("A7-PhazorQuest","GLOBAL",2)~ FLAGS 512 + PhazorQuest.2
  + ~Global("A7-PhazorQuest","GLOBAL",2) OR(3) !PartyHasItem("MISC6Z") !PartyHasItem("SCRL7J") !PartyHasItem("SCRL7T")~ + @15 /* Can you tell me about the broken artifact again? */ + PhazorQuest.3
  + ~Global("A7-PhazorQuest","GLOBAL",2) PartyHasItem("MISC6Z") PartyHasItem("SCRL7J") PartyHasItem("SCRL7T")~ + @16 /* I have found the items required to repair the broken artifact. */ + PhazorQuest.4

  + ~Global("A7-DiscOffered","LOCALS",1)~ + @218 /* I'd like to talk about the Green Steel Disc again. */ + DarknessQuest.Disc.Query.1
  + ~Global("A7-DarknessQuest","GLOBAL",3) PartyHasItem("a7-mi13x")~ + @250 /* With the help of the disc of green steel we have discovered a tome written in an unknown language. Do you know how to translate it? */ + DarknessQuest.Translate.1

  + ~Global("TalkStore","LOCALS",0)~ + @6 /* What do you have for sale? */ DO ~SetGlobal("TalkStore","LOCALS",1)~ + Store.1
  + ~!Global("TalkStore","LOCALS",0)~ + @17 /* Please show me your wares. */ DO ~StartStore("a7-merc",LastTalkedToBy(Myself))~ EXIT

  // Variable "A7-Campaign" is set in his creature script
  + ~Global("A7-Campaign","GLOBAL",1) Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeBG1","LOCALS",1)~ + Bye.BG1.1
  + ~Global("A7-Campaign","GLOBAL",1) !Global("TalkByeBG1","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~Global("A7-Campaign","GLOBAL",3) Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ DO ~SetGlobal("TalkByeSoA","LOCALS",1)~ + Bye.SoA.1
  + ~Global("A7-Campaign","GLOBAL",3) !Global("TalkByeSoA","LOCALS",0)~ + @10 /* Nothing. Farewell. */ EXIT
  + ~!Global("A7-Campaign","GLOBAL",1) !Global("A7-Campaign","GLOBAL",3)~ + @10 /* Nothing. Farewell. */ EXIT
END


IF ~~ StoreUpdated.1
  SAY @19 /* Good timing, anyway. I've stocked up my store with even more wares. Feel free to browse and buy, friend. */
  IF ~~ + Default.1
END


IF ~~ Intro.Harmonium.1
  SAY @20 /* Aye, I served in many fights and skirmishes for the Harmonium. Our faction keeps peace and order in Sigil, and on other planes as well. Been that way as long as I can think of. And I can think back for many a decade. */
  IF ~~ + Intro.Harmonium.2
  IF ~Global("HaerDalisInter1","LOCALS",0) InParty("HaerDalis") See("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ DO ~SetGlobal("HaerDalisInter1","LOCALS",1)~ EXTERN IF_FILE_EXISTS ~HAERDAJ~ HaerDalis.Intro.Harmonium.1
END

IF ~~ Intro.Harmonium.2
  SAY @21 /* Now that I'm *mostly* retired I want to see the planes at my own leisure rather than waste my time away in Sigil's bars and taverns. */
  IF ~~ + Intro.2
END

IF ~~ Harmonium.1
  SAY @20 /* Aye, I served in many fights and skirmishes for the Harmonium. Our faction keeps peace and order in Sigil, and on other planes as well. Been that way as long as I can think of. And I can think back for many a decade. */
  IF ~~ + Harmonium.2
  IF ~Global("HaerDalisInter1","LOCALS",0) InParty("HaerDalis") See("HaerDalis") !StateCheck("HaerDalis",CD_STATE_NOTVALID)~ DO ~SetGlobal("HaerDalisInter1","LOCALS",1)~ EXTERN IF_FILE_EXISTS ~HAERDAJ~ HaerDalis.Harmonium.1
END

IF ~~ Harmonium.2
  SAY @21 /* Now that I'm *mostly* retired I want to see the planes at my own leisure rather than waste my time away in Sigil's bars an' taverns. */
  IF ~~ + Default.2
END

// From: HAERDAJ > HaerDalis.Harmonium.1
IF ~~ Intro.Harmonium.HaerDalis.1
  SAY @22 /* Be that as it may, the planes work in unknowable ways; even to ol' Ebb. They always have. You cling to entropy, but that's only one force of many in the multiverse. There's more than enough to keep entropy in check. But in my old age I'm not concerned with that anymore. */
  IF ~~ + Intro.Harmonium.2
END

IF ~~ Harmonium.HaerDalis.1
  SAY @22 /* Be that as it may, the planes work in unknowable ways; even to ol' Ebb. They always have. You cling to entropy, but that's only one force of many in the multiverse. There's more than enough to keep entropy in check. But in my old age I'm not concerned with that anymore. */
  IF ~~ + Harmonium.2
END


IF ~~ Intro.Sigil.1
  SAY @23 /* Sigil is a wondrous place. Called the "City of Doors", an' for good reason it is. Any arch, frame, window or door can be a portal to another place. Most of them are dormant, though, unless you have the right key. */
  = @24 /* A key can be pretty much anything; from a literal key itself, over a phrase spoken aloud, to a thought expressed at a specific hour with a lim-lim pet standing on your head. Destination can be any place in the multiverse, too. Many clueless berks walked through a portal by accident only to find themselves in the middle of the Blood War, or drowning in the endless oceans of the Elemental Plane of Water with no way back. */
  = @25 /* The city is ruled by the Lady of Pain. Her rule is absolute. You'd be careful to invoke her wrath. It's something you'd never survive, no matter how tough ye are. If you're lucky she'll only maze you to one of her own pocket dimensions with no way out. Otherwise you might find out a new way of dying. That'll be something. */
  = @26 /* I'm sorry for rambling on and on, but ye can only really come to understand the city by experiencing it for yourself. */
  IF ~~ + Intro.2
END

IF ~~ Sigil.1
  SAY @23 /* Sigil is a wondrous place. Called the "City of Doors", an' for good reason it is. Any arch, frame, window or door can be a portal to another place. Most of them are dormant, though, unless you have the right key. */
  = @24 /* A key can be pretty much anything; from a literal key itself, over a phrase spoken aloud, to a thought expressed at a specific hour with a lim-lim pet standing on your head. Destination can be any place in the multiverse, too. Many clueless berks walked through a portal by accident only to find themselves in the middle of the Blood War, or drowning in the endless oceans of the Elemental Plane of Water with no way back. */
  = @25 /* The city is ruled by the Lady of Pain. Her rule is absolute. You'd be careful to invoke her wrath. It's something you'd never survive, no matter how tough ye are. If you're lucky she'll only maze you to one of her own pocket dimensions with no way out. Otherwise you might find out a new way of dying. That'll be something. */
  = @26 /* I'm sorry for rambling on and on, but ye can only really come to understand the city by experiencing it for yourself. */
  IF ~~ + Default.2
END


IF ~~ Intro.Customer.1
  SAY @27 /* Eh, that one? He purchased an artifact of premium quality. Good as new, without any charges spent. He's probably enjoying the sights an' wonders of Ysgard right now. With luck he'll figure out how to return, eventually. */
  = @28 /* But don't ye worry too much about it. None of my wares will kill you. If you keep your wits about you, that is. */
  IF ~~ + Intro.2
END


IF ~~ NoLabels.1
  SAY @29 /* As I mentioned before, these are all souvenirs collected from places all over the planes. If I had to spend my time identifying all that stuff then I'd die of old age before I was done. */
  = @30 /* I can assure you that everything is genuine and would probably pass as rarities on this world. */
  IF ~~ + Default.2
END

IF ~~ Store.1
  SAY @31 /* I've got everything an adventurer like yourself desires. Be it jewelry that makes you invulnerable to harm, or a weapon to turn even your deadliest foes to ash. */
  = @32 /* Oh, and every now and then I'll replenish my stock, when I have the opportunity to visit home. You might want to check back once in a while. */
  IF ~~ DO ~StartStore("a7-merc",LastTalkedToBy(Myself))~ EXIT
END


IF ~~ Bye.BG1.1
  SAY @33 /* I'll be here for a while before I move on. My tour across the Sword Coast probably leads me from Beregost, over Nashkel's Carnival, Ulgoth's Beard, an' back. So y'know where to look for me if ye can't find me here. */
  IF ~~ JOURNAL @3001 EXIT
END

IF ~~ Bye.SoA.1
  SAY @34 /* I'll be here for a while before I move on. My tour across Amn probably leads me from Athkatla's market district, over Trademeet, Imnesvale, an' back. So y'know where to look for me if ye can't find me here. */
  IF ~~ JOURNAL @3002 EXIT
END


IF ~~ PhazorQuest.1
  SAY @35 /* Anyway, just recently I procured a curious artifact from a befuddled gnome wizard. It's supposed to be a deadly weapon according to his ramblings. But it seems to be broken. Maybe you'd be interested in helping me out to fix it? */
  IF ~~ UNSOLVED_JOURNAL @3101 + Default.1
  IF ~InParty("Jan") See("Jan") !StateCheck("Jan",CD_STATE_NOTVALID)~ EXTERN IF_FILE_EXISTS ~JANJ~ Jan.PhazorQuest.1
END

IF ~~ PhazorQuest.2
  SAY @36 /* Sure. It's a weapon of a design I've never seen before. And believe me, I've seen a lot in my life already. The gnome wizard left with me scribbled notes that are supposed to be repair instructions. But I can't make heads or tails of it. */
  = @37 /* What I *can* make out are the spare parts needed to fix this device. The broken crystal needs to be replaced by a beljuril gem of the highest quality. Furthermore, a scroll of protection from magical energies is required to shield the crystal from overloading. The scribbles also mention a scroll of disintegration, but I can't make out what it is used for. */
  = @38 /* If you provide me with these items then I'll have another word with the gnome about how to repair this piking contraption. Are ye up to the task, <LADGAL>? */
  ++ @39 /* Sounds intriguing. I'll try my best to find these items for you. */ + PhazorQuest.2.1
  ++ @40 /* No, I'm not interested. */ + PhazorQuest.2.2
END

IF ~~ PhazorQuest.2.1
  SAY @41 /* Splendid. I'll continue to study the notes. Maybe I can make out more details in the meantime. */
  IF ~~ UNSOLVED_JOURNAL @3102 + Default.2
END

IF ~~ PhazorQuest.2.2
  SAY @42 /* Fair enough. It would be quite a task to collect everything. I'll keep studying the notes anyway, just in case you change your mind. */
  IF ~~ UNSOLVED_JOURNAL @3102 + Default.2
END

IF ~~ PhazorQuest.3
  SAY @43 /* Certainly. It's a weapon of a design I've never seen before. But it's broken. According to the gnome's scribbles it can be repaired with a beljuril gem and scrolls of disintegration and protection from magical energies. If you provide me with these, I'll have another word with the gnome wizard how to fix this contraption. */
  IF ~~ + Default.2
END

IF ~~ PhazorQuest.4
  SAY @44 /* Let me see them. Yes, the beljuril is quite a sight, isn't it? And you've got the scrolls as well? Very good. Are ye ready to part with them? */
  ++ @45 /* Yes, I am. */ DO ~TakePartyItemNum("MISC6Z",1) DestroyItem("MISC6Z") TakePartyItemNum("SCRL7J",1) DestroyItem("SCRL7J") TakePartyItemNum("SCRL7T",1) DestroyItem("SCRL7T")~ + PhazorQuest.4.1
  ++ @46 /* Not yet. Maybe later. */ + PhazorQuest.4.2
END

IF ~~ PhazorQuest.4.1
  SAY @47 /* Let me take that to the old gnome. He'll know better than me what to do with it. I guess repairing that damn contraption will take a while. Come back tomorrow. */
  IF ~~ DO ~SetGlobal("A7-PhazorQuest","GLOBAL",4) SetGlobalTimer("A7-PhazorQuestRepairTimer","GLOBAL",ONE_DAY) EscapeArea()~ UNSOLVED_JOURNAL @3103 EXIT
END

IF ~~ PhazorQuest.4.2
  SAY @48 /* Any time, <LADGAL>. I'll be here if you change your mind. */
  IF ~~ + Default.2
END

IF ~~ PhazorQuest.5
  SAY @49 /* By the way, the gnome wizard did the impossible and fixed that weird contraption. I have it added to my pile of wares if you'd like to buy it. */
  IF ~~ DO ~AddexperienceParty(15000) EraseJournalEntry(@3101) EraseJournalEntry(@3102) EraseJournalEntry(@3103)~ SOLVED_JOURNAL @3150 + Default.1
END


IF ~~ DarknessQuest.Disc.Query.1
  SAY @219 /* Ah, you're still interested? */
  IF ~~ + DarknessQuest.Disc.Offer.1
END

IF ~~ DarknessQuest.Disc.1
  SAY @201 /* It's made from pure green steel, and judging by the adornments it may be enchanted as well. */
  ++ @202 /* So, what makes this disc so special? */ + DarknessQuest.Disc.Question.1
END

IF ~~ DarknessQuest.Disc.Question.1
  SAY @203 /* Firstly, green steel can only be mined and forged in Baator. */
  + ~CheckStatLT(LastTalkedToBy,25,LORE)~ + @204 /* Baator? */ + DarknessQuest.Disc.Question.Baator.1
  IF ~!CheckStatLT(LastTalkedToBy,25,LORE)~ + DarknessQuest.Disc.Question.2
END

IF ~~ DarknessQuest.Disc.Question.Baator.1
  SAY @205 /* It's the Nine Hells, <LADGAL>. Home of the devils! */
  IF ~~ + DarknessQuest.Disc.Question.2
END

IF ~~ DarknessQuest.Disc.Question.2
  SAY @206 /* And if you know anything about that place, and their denizens, then you'd be extra wary of artifacts from there. */
  = @207 /* Anyway, I bet that adventurers like yourself are usually dying to get their hands on exotic items like this. So, I'd like to make you an offer. */
  IF ~~ + DarknessQuest.Disc.Offer.1
END

IF ~~ DarknessQuest.Disc.Offer.1
  SAY @208 /* For just 500 gold it can be yours. What do you say? */
  + ~PartyGoldGT(499)~ + @209 /* It's a deal. */ + DarknessQuest.Disc.Offer.Accepted.1
  + ~PartyGoldGT(499) !CheckStatLT(LastTalkedToBy,16,CHR)~ + @210 /* Sounds pretty expensive. Can't you lower the price a bit? */ + DarknessQuest.Disc.Offer.Haggle.Succeed.1
  + ~PartyGoldGT(499) CheckStatLT(LastTalkedToBy,16,CHR)~ + @210 /* Sounds pretty expensive. Can't you lower the price a bit? */ + DarknessQuest.Disc.Offer.Haggle.Fail.1
  + ~!PartyGoldGT(499) !CheckStatLT(LastTalkedToBy,16,CHR)~ + @215 /* I don't have enough gold. Could you maybe lower the price a bit? */ + DarknessQuest.Disc.Offer.Haggle.Succeed.1
  + ~!PartyGoldGT(499) CheckStatLT(LastTalkedToBy,16,CHR)~ + @215 /* I don't have enough gold. Could you maybe lower the price a bit? */ + DarknessQuest.Disc.Offer.Haggle.Fail.1
  ++ @213 /* Sorry, but I'm not interested. */ + DarknessQuest.Disc.Offer.Refused.1
END

IF ~~ DarknessQuest.Disc.Offer.Haggle.Succeed.1
  SAY @211 /* Hmm, alright. How about 300 gold? */
  + ~PartyGoldGT(299)~ + @209 /* It's a deal. */ + DarknessQuest.Disc.Offer.Accepted.2
  + ~!PartyGoldGT(299)~ + @212 /* It's still too much for me. Maybe later. */ + DarknessQuest.Disc.Offer.Refused.1
  ++ @213 /* Sorry, but I'm not interested. */ + DarknessQuest.Disc.Offer.Refused.1
END

IF ~~ DarknessQuest.Disc.Offer.Haggle.Fail.1
  SAY @214 /* No, I can't do that. It is a precious artifact after all. */
  + ~PartyGoldGT(499)~ + @209 /* It's a deal. */ + DarknessQuest.Disc.Offer.Accepted.1
  ++ @213 /* Sorry, but I'm not interested. */ + DarknessQuest.Disc.Offer.Refused.1
END

IF ~~ DarknessQuest.Disc.Offer.Refused.1
  SAY @216 /* As you wish. My offer still stands if you change your mind later. */
  IF ~!Global("A7-DiscOffered","LOCALS",0)~ EXIT
  IF ~Global("A7-DiscOffered","LOCALS",0)~ DO ~SetGlobal("A7-DiscOffered","LOCALS",1)~ UNSOLVED_JOURNAL @3201 EXIT
END

IF ~~ DarknessQuest.Disc.Offer.Accepted.1
  SAY @217 /* Very good. Come back again. */
  IF ~~ DO ~SetGlobal("A7-DiscOffered","LOCALS",2)
            SetGlobal("A7-DarknessQuest","GLOBAL",1)
            TakePartyGold(500)
            GiveItemCreate("a7-mi15",LastTalkedToBy,0,0,0)~
            UNSOLVED_JOURNAL @3202 EXIT
END

IF ~~ DarknessQuest.Disc.Offer.Accepted.2
  SAY @217 /* Very good. Come back again. */
  IF ~~ DO ~SetGlobal("A7-DiscOffered","LOCALS",2)
            SetGlobal("A7-DarknessQuest","GLOBAL",1)
            TakePartyGold(300)
            GiveItemCreate("a7-mi15",LastTalkedToBy,0,0,0)~
            UNSOLVED_JOURNAL @3202 EXIT
END

IF ~~ DarknessQuest.Translate.1
  SAY @251 /* I don't rightly know. Let me see it. */
  ++ @252 /* Here you go. */ + DarknessQuest.Translate.2
END

IF ~~ DarknessQuest.Translate.2
  SAY @253 /* Oh no, it's written in Abyssal! I won't touch it. */
  = @254 /* If you're still hell-bent on translating that thing then you should ask a scholar. I've heard of one who resides in this area, but his name escapes me at the moment. He shouldn't be too hard to find, anyway. */
  = @255 /* And now, kindly remove that book from my sight. */
  IF ~~ DO ~SetGlobal("A7-DarknessQuest","GLOBAL",4)~ UNSOLVED_JOURNAL @3210 EXIT
END


//////////////////////////////////////////////////////////////////////////////

APPEND IF_FILE_EXISTS ~JANJ~

// Interjection from A7-MERC > PhazorQuest.1
IF ~~ Jan.PhazorQuest.1
  SAY @100 /* Well now, it's not our fault that the big folk can't follow our trains of thought. Unless the train is just a pile of loose gears, like Uncle Witherjar used to have occasionally. That's nothing that can't be solved with good blow to the head, though. */
  IF ~~ UNSOLVED_JOURNAL @3101 EXTERN ~A7-MERC~ Default.1
END

END


APPEND IF_FILE_EXISTS ~HAERDAJ~

// Interjection from A7-MERC > Intro.Harmonium.1
IF ~~ HaerDalis.Intro.Harmonium.1
  SAY @110 /* A futile attempt in the face of decay and entropy. Your words and deeds will only delay the inevitable by a miniscule span of time. While you have to actively work to keep entropy at bay we can simply sit back and watch. Time is our ally. */
  IF ~~ EXTERN ~A7-MERC~ Intro.Harmonium.HaerDalis.1
END

// Interjection from A7-MERC > Harmonium.1
IF ~~ HaerDalis.Harmonium.1
  SAY @110 /* A futile attempt in the face of entropy and decay. Your words and deeds will only delay the inevitable by a miniscule span of time. While you have to work actively to keep entropy at bay we can simply sit back and watch. Time is our ally. */
  IF ~~ EXTERN ~A7-MERC~ Harmonium.HaerDalis.1
END

END
