BEGIN ~a7-mi09~

IF ~!PartyHasItemIdentified("a7-mi09")~ grimoire.unknown
  SAY @100 /* (Apart from the unsightly look and a slight rotting smell you don't notice anything unusual.) */
  IF ~~ EXIT
END

IF ~!InPartySlot(LastTalkedToBy,0)~ grimoire.denied
  SAY @101 /* (The book does not respond to your presence.) */
  IF ~~ EXIT
END

IF ~Global("A7-Grimoire","GLOBAL",0)~ grimoire.intro
  SAY @102 /* I greet thee, master. How may this humble tome serve you? */
  ++ @103 /* You can talk? */ DO ~SetGlobal("A7-Grimoire","GLOBAL",1)~ + grimoire.1
  ++ @104 /* You can't. Stop talking to me. */ DO ~SetGlobal("A7-Grimoire","GLOBAL",1)~ + grimoire.bye
END

IF ~Global("A7-Grimoire","GLOBAL",1)~ grimoire.talk
  SAY @105 /* Master, how may I serve your needs? Do you need your curiosity assuaged? */
  ++ @106 /* Yes. Answer some questions for me. */ + grimoire.6
  ++ @107 /* No. */ + grimoire.bye
END

IF ~Global("A7-Grimoire","GLOBAL",2)~ grimoire.task1
  SAY @108 /* Master. Have you decided that perhaps you wish to continue your education? The offer of greater insight and ability remains open to you. */
  ++ @109 /* Tell me what I have to do. */ DO ~SetGlobal("A7-Grimoire","GLOBAL",3)~ + grimoire.task2.1
  ++ @110 /* Not yet. Answer some other questions for me. */ + grimoire.task1.4
  ++ @111 /* No. Farewell. */ EXIT
END

IF ~Global("A7-Grimoire","GLOBAL",3)~ grimoire.task2
  SAY @112 /* Master. Have you decided that perhaps you wish to continue your education? The offer of greater insight and ability remains open to you if you will but complete the second sacrifice. */
  ++ @113 /* Yes, I am ready. */ + grimoire.task2.1
  ++ @114 /* Not right now. Farewell. */ EXIT
END

IF ~Global("A7-Grimoire","GLOBAL",4)~ grimoire.task2.completed
  SAY @115 /* You have done well so far. Listen to these words and learn still more. */
  ++ @116 /* Do you have more to teach me, Book? */ + grimoire.task2.3
  ++ @114 /* Not right now. Farewell. */ EXIT
END

IF ~Global("A7-Grimoire","GLOBAL",5)~ grimoire.task3.asked
  SAY @117 /* I can grant you one more power. You have shown yourself willing to do what it takes to finish a job. Are you ready to perform your final task? */
  ++ @118 /* Yes, I am. */ + grimoire.task2.7
  ++ @114 /* Not right now. Farewell. */ EXIT
END

IF ~Global("A7-Grimoire","GLOBAL",6)~ grimoire.task3
  SAY @119 /* Well? Have you achieved your goal? Have you slain an innocent person with the ability I taught you? */
  + ~!Global("A7-GrimoireSlain","GLOBAL",0)~ + @120 /* Yes, I have. */ DO ~SetGlobal("A7-Grimoire","GLOBAL",7)~ + grimoire.task3.1
  + ~Global("A7-GrimoireSlain","GLOBAL",0)~ + @121 /* Not yet. */ + grimoire.task3.bye
  + ~Global("A7-GrimoireSlain","GLOBAL",0)~ + @122 /* No. And I'm not going to. */ + grimoire.task3.bye
END

IF ~GlobalGT("A7-Grimoire","GLOBAL",7)~ grimoire.completed
  SAY @123 /* (The book is silent and does not answer you. It appears to have run out of words.) */
  + ~Global("A7-Grimoire","GLOBAL",8)~ + @124 /* Very well. */
      DO ~SetGlobal("A7-Grimoire","GLOBAL",9) EraseJournalEntry(@300) EraseJournalEntry(@301)
          EraseJournalEntry(@302) EraseJournalEntry(@303) EraseJournalEntry(@304)~
      SOLVED_JOURNAL @350 /* Dark Temptations  The book speaks to me no longer. */
      EXIT
  + ~GlobalGT("A7-Grimoire","GLOBAL",8)~ + @124 /* Very well. */ EXIT
END


IF ~~ grimoire.1
  SAY @125 /* That I can, master, in many different languages. Only you should take care that none see us conversing, for they cannot hear me. And, master, speech is but one of my powers. */
  ++ @126 /* What can you do? What are your powers? */ + grimoire.2
  ++ @127 /* How did you end up in Ebb's store? */ + grimoire.3
  ++ @128 /* Tell me about yourself. */ + grimoire.4
  ++ @129 /* That's enough for now. */ + grimoire.bye
END

IF ~~ grimoire.2
  SAY @130 /* I can grant you abilities that will allow you greater latitude in life's vicissitudes, master. */
  ++ @131 /* What abilities do you mean? */ + grimoire.5
  ++ @132 /* Forget it. Answer some other questions for me. */ + grimoire.6
END

IF ~~ grimoire.3
  SAY @133 /* The merchant stumbled upon the remains of my former master who perished in the Outlands many ages ago. Instead of perusing my services he decided to put me up for sale. */
  + ~GlobalLT("A7-Grimoire","GLOBAL",2)~ + @134 /* Tell me of your powers. */ + grimoire.2
  + ~Global("A7-Grimoire","GLOBAL",2)~ + @134 /* Tell me of your powers. */ + grimoire.task1.3
  + ~Global("A7-Grimoire","GLOBAL",3)~ + @134 /* Tell me of your powers. */ + grimoire.task2.1
  + ~GlobalLT("A7-Grimoire","GLOBAL",2)~ + @135 /* I see. Answer some other questions for me. */ + grimoire.6
  + ~Global("A7-Grimoire","GLOBAL",2)~ + @135 /* I see. Answer some other questions for me. */ + grimoire.task1.4
  ++ @136 /* True. Farewell. */ EXIT
END

IF ~~ grimoire.4
  SAY @137 /* The question you ask is not a simple one, my master, but your servant shall seek to answer it as best it can. I am a codex of moments-now-forgotten, ideas-now-lost, and thoughts of other times and other worlds. Within my pages lies the lore of forgotten civilizations. In essence, my master, and this is the only thing of import: within my pages lie POWER. This power can be yours... my master. */
  ++ @134 /* Tell me of your powers. */ + grimoire.5
  ++ @138 /* Not interested right now. Answer some other questions for me, instead. */ + grimoire.6
  ++ @139 /* Not interested. Farewell, book. */ + grimoire.bye
END

IF ~~ grimoire.5
  SAY @197 /* These are powers, my master, that can improve your life immeasurably. Unfortunately, the laws that bind me... they demand a small service in recompense for these powers. */
  ++ @198 /* A small service? Like what? */ + grimoire.task1.1
  ++ @199 /* Then I wish nothing. */ + grimoire.7
END

IF ~~ grimoire.6
  SAY @200 /* What do you wish to know, master? */
  ++ @126 /* What can you do? What are your powers? */ + grimoire.2
  ++ @127 /* How did you end up in Ebb's store? */ + grimoire.3
  ++ @128 /* Tell me about yourself. */ + grimoire.4
  ++ @129 /* That's enough for now. */ + grimoire.bye
END

IF ~~ grimoire.7
  SAY @140 /* It is but a small sacrifice, master, for a great gain... but it is your choice. The offer remains open, master. */
  ++ @141 /* Good. Answer some other questions for me. */
      UNSOLVED_JOURNAL @300 /* Dark Temptations  This strange book I have found has asked me to give up a small piece of myself in exchange for power. I declined. The option is still open, however. */
      + grimoire.6
  ++ @142 /* Good. Farewell. */
      UNSOLVED_JOURNAL @300 /* Dark Temptations  This strange book I have found has asked me to give up a small piece of myself in exchange for power. I declined. The option is still open, however. */
      + grimoire.bye
END

IF ~~ grimoire.bye
  SAY @143 /* As you wish, master. Merely speak the word to me and I shall assist you in any way possible. */
  ++ @144 /* Actually, tell me what you can do. */ + grimoire.2
  ++ @145 /* Fine. Now quiet yourself. */ EXIT
END


IF ~~ grimoire.task1.1
  SAY @146 /* The service required is a trifling one, my master. I would barely mention it if it were not for the sake of the laws that bind me to these pages... */
  = @147 /* To unlock my power, you must sacrifice but a small bit of yourself, my master. You must spill blood upon the first of my pages. This act will serve to strengthen the chain between us and allow me to help you reach your full potential. It is a small price to pay for the powers that will come to be at your disposal. */
  ++ @148 /* All right. Here. */
      DO ~SetGlobal("A7-Grimoire","GLOBAL",2) CreateItem("misc45",1,0,0) ApplySpellRES("a7-mi09a",LastTalkedToBy) EraseJournalEntry(@300)~
      UNSOLVED_JOURNAL @301 /* Dark Temptations  This strange book I have picked up has asked me to spill some of my blood onto its pages. I have done so, and gained a spell. It has promised me more power, as well. */
      + grimoire.task1.2
  ++ @149 /* No. */ + grimoire.7
END

IF ~~ grimoire.task1.2
  SAY @150 /* You cut yourself and allow a few drops of blood to drip upon the page. A strange chill settles in your bones, and you feel empty and hurt. At the same time, there is a feeling of triumph: You have been rewarded with a precious gem.

^CYou have lost 1 Hit Point from your maximum Hit Point level.^- */
  = @151 /* This is your reward... master. Know that this is but the first power that lies in my pages.

^CGained An Item: %task1_reward%^- */
  ++ @152 /* Tell me of these other powers. */ + grimoire.task1.3
  ++ @153 /* Answer some more questions for me. */ + grimoire.task1.4
  ++ @154 /* I need nothing more right now. */ + grimoire.task1.bye
END

IF ~~ grimoire.task1.3
  SAY @155 /* Unfortunately, master, the laws that bind me demand a greater sacrifice in return for greater power. I would grant these powers to you freely, but as you can see, I am bound. */
  ++ @156 /* What is the sacrifice? */ DO ~SetGlobal("A7-Grimoire","GLOBAL",3)~ + grimoire.task2.1
  ++ @157 /* Forget it, then. */ + grimoire.task1.5
END

IF ~~ grimoire.task1.4
  SAY @158 /* You require answers? */
  ++ @127 /* How did you end up in Ebb's store? */ + grimoire.3
  ++ @128 /* Tell me about yourself. */ + grimoire.task1.6
  + ~Global("A7-Grimoire","GLOBAL",2)~ + @159 /* Do you have more powers for me? */ + grimoire.task1.3
  ++ @160 /* No more. Farewell. */ EXIT
END

IF ~~ grimoire.task1.5
  SAY @161 /* I am saddened that you do not think my powers worth such a small price. Do not let doubt and confusion shackle you, master... but I speak out of turn. Remember that the offer remains open to you. */
  ++ @162 /* I'll think about it. I need some more answers from you. */ + grimoire.task1.4
  ++ @163 /* I'll think about it. Farewell. */ EXIT
END

IF ~~ grimoire.task1.6
  SAY @164 /* I am power, master, and I can teach you more. */
  + ~Global("A7-Grimoire","GLOBAL",2)~ + @165 /* How? */ + grimoire.task1.3
  + ~Global("A7-Grimoire","GLOBAL",3)~ + @166 /* Refresh my memory. */ + grimoire.task2.1
  ++ @138 /* Not interested right now. Answer some other questions for me, instead. */ + grimoire.task1.4
  ++ @139 /* Not interested. Farewell, book. */ EXIT
END

IF ~~ grimoire.task1.bye
  SAY @167 /* Then remember that you may find yourself wishing greater power later, and that I will be waiting for you... master. */
  ++ @168 /* I'll do that. Farewell. */ EXIT
END


IF ~~ grimoire.task2.1
  SAY @169 /* The second sacrifice is a portion of your experience, master. This will signify the binding between you and the power - the experience allows me to grant you a reward of a more immaterial nature. */
  ++ @170 /* Fine, I agree. */
     DO ~SetGlobal("A7-Grimoire","GLOBAL",4) ApplySpellRES("a7-mi09b",LastTalkedToBy) ApplySpellRES("a7-mi09c",LastTalkedToBy)~
     UNSOLVED_JOURNAL @302 /* Dark Temptations  In exchange for a portion of my experience the book granted me a bonus to all my saving throws. */
     + grimoire.task2.2
  ++ @163 /* I'll think about it. Farewell. */ EXIT
END

IF ~~ grimoire.task2.2
  SAY @171 /* You have made the right decision. I grant you the ability to resist adverse effects more efficiently.

^CYou have lost experience points.^-
^CYou have been granted +1 to all of your Saving Throws.^-~
  = ~You are a swift learner. Listen to these words and learn still more. */
  ++ @116 /* Do you have more to teach me, Book? */ + grimoire.task2.3
  ++ @172 /* My thanks. Farewell. */ EXIT
END

IF ~~ grimoire.task2.3
  SAY @173 /* In time, in time! You must have patience! You have already shown yourself willing to do what it takes to achieve this power, and you must realize that you WILL pay for this power. */
  ++ @174 /* What do I have to do? */ + grimoire.task2.4
  ++ @175 /* I've paid enough. Forget it. */ + grimoire.task2.5
END

IF ~~ grimoire.task2.4
  SAY @176 /* Do you have the courage to take a life? */
  ++ @177 /* Yes, I have. What do I have to do? */ DO ~SetGlobal("A7-Grimoire","GLOBAL",5)~ + grimoire.task2.7
  ++ @178 /* No, I won't do something like that. */ DO ~SetGlobal("A7-Grimoire","GLOBAL",5)~ + grimoire.task2.8
END

IF ~~ grimoire.task2.5
  SAY @179 /* To have come so far, only to back out now. Shameful. You are not as strong as I had thought. */
  ++ @180 /* Be that as it may. Answer some questions for me. */ + grimoire.task2.6
  ++ @181 /* Fine. What do I have to do? */ + grimoire.task2.4
  ++ @182 /* Be that as it may. Farewell. */ EXIT
END

IF ~~ grimoire.task2.6
  SAY @183 /* No. I will not until you show yourself willing to achieve your potential. */
  ++ @174 /* What do I have to do? */ + grimoire.task2.4
  ++ @157 /* Forget it, then. */ + grimoire.task2.bye
END

IF ~~ grimoire.task2.7
  SAY @184 /* I am granting you an ability that rips the souls from the body of an innocent person. Talk to me again when the deed is done and I will grant you my greatest power. */
  ++ @185 /* Very well. */
      DO ~SetGlobal("A7-Grimoire","GLOBAL",6) ActionOverride(LastTalkedToBy,AddSpecialAbility("a7-mi09d"))~
      UNSOLVED_JOURNAL @303 /* Dark Temptations  I have just agreed to slay an innocent person in exchange for power from the book. I have to use the ability the book has granted me for this purpose. */
      EXIT
END

IF ~~ grimoire.task2.8
  SAY @186 /* Bah. Then I shall waste no more time in trying to educate you. Have you no ambition? Have you no desire? You weak fool. */
  ++ @181 /* Fine. What do I have to do? */ + grimoire.task2.4
  ++ @187 /* As I said: I won't do it. No power is worth that. */ + grimoire.task2.9
END

IF ~~ grimoire.task2.9
  SAY @188 /* Then suffer in darkness, fool. */
  ++ @189 /* I've changed my mind. What do I have to do? */ + grimoire.task2.4
  ++ @190 /* I will. Farewell. */ EXIT
END

IF ~~ grimoire.task2.bye
  SAY @191 /* Be that as it may. One route leads to failure, one to success. */
  ++ @192 /* Fine. */ EXIT
END

IF ~~ grimoire.task3.1
  SAY @193 /* Excellent. You have proven yourself a worthy student. This, then, is the final power I can grant you. */
  ++ @194 /* Thanks, book. */
      DO ~SetGlobal("A7-Grimoire","GLOBAL",8) EraseJournalEntry(@303) ApplySpellRES("a7-mi09e",LastTalkedToBy) ActionOverride(LastTalkedToBy,RemoveSpellRES("a7-mi09d"))~
      UNSOLVED_JOURNAL @304 /* Dark Temptations  The book has granted me yet another, more powerful power in exchange for the death of an innocent person - a worthy trade. */
      + grimoire.task3.finished
END

IF ~~ grimoire.task3.bye
  SAY @195 /* (The book falls abruptly silent, and no amount of coaxing can induce it to answer you again.) */
  ++ @192 /* Fine. */ EXIT
END

IF ~~ grimoire.task3.finished
  SAY @196 /* (The book is silent and does not answer you. It appears to have run out of words.)

^CYou have been granted +15% resistance to crushing, slashing, piercing, and missile damage.^- */
  IF ~Alignment(LastTalkedToBy,MASK_EVIL)~ EXIT
  IF ~!Alignment(LastTalkedToBy,MASK_EVIL)~ DO ~ApplySpellRES("a7-mi09f",LastTalkedToBy)~ EXIT
  IF ~Class(LastTalkedToBy,RANGER) !Alignment(LastTalkedToBy,MASK_EVIL) !FallenRanger(LastTalkedToBy)~ DO ~RemoveRangerHood() ApplySpellRES("a7-mi09f",LastTalkedToBy)~ EXIT
  IF ~Class(LastTalkedToBy,PALADIN) !Alignment(LastTalkedToBy,MASK_EVIL) !FallenPaladin(LastTalkedToBy)~ DO ~RemovePaladinHood() ApplySpellRES("a7-mi09f",LastTalkedToBy)~ EXIT
END
