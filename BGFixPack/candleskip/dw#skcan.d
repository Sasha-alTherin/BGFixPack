BEGIN ~dw#skcan~

IF ~NumTimesTalkedTo(0)~
THEN BEGIN ~firsttalk~
SAY ~Ho there, <CHARNAME>! Your foster father Gorion tells me that you need to leave the Keep at once. Your very life is in danger and there is no time to lose.~ 
= ~But before then, it's probably a good idea if you go round the Keep in a leisurely fashion finding lost property and running errands, all for an economically implausible cash reward and an astonishing amount of experience.~
//@2201=~Ho there, <CHARNAME>! Your foster father Gorion tells me that you need to leave the Keep at once. Your very life is in danger and there is no time to lose.~
//@2202=~But before then, it's probably a good idea if you go round the Keep in a leisurely fashion finding lost property and running errands, all for an economically implausible cash reward and an astonishing amount of experience.~
IF ~~ THEN REPLY ~Sounds good, I'm on it.~ GOTO ~guardleaves~
//@2203=~Sounds good, I'm on it.~
IF ~~ THEN REPLY ~Can't I just get the cash and experience right now? The longer I wait, the higher the chance that those first-level assassins in the Keep will finish me off.~ GOTO ~getthecash~
//@2204=~Can't I just get the cash and experience right now? The longer I wait, the higher the chance that those first-level assassins in the Keep will finish me off.~
END

IF ~~ THEN BEGIN ~guardleaves~
SAY ~Good luck, <CHARNAME>, and watch out for those rats. See you in Chapter Six.~
//@2205=~Good luck, <CHARNAME>, and watch out for those rats. See you in Chapter Six.~
IF ~~ THEN DO ~EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN ~getthecash~
SAY ~I don't see why not. How much are you really going to learn about spell-throwing and swordplay by fetching crossbow bolts, after all?~
= ~Well pick your package. Go do your shopping, then I'll take you to Gorion.~
//@2206=~I don't see why not. How much are you really going to learn about spell-throwing and swordplay by fetching crossbow bolts, after all?~
//@2207=~Well pick your package. Go do your shopping, then I'll take you to Gorion.~
IF ~ReactionGT(LastTalkedToBy,HOSTILE_UPPER) ReactionLT(LastTalkedToBy,FRIENDLY_LOWER)~ THEN
REPLY ~Give me everything I could possibly get including stuff from quests, killing those who attack me, and looting containers that I can't possibly loot on my own.~
DO ~GiveItemCreate("misc17",Player1,1,0,0) 
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("hamm01",Player1,1,0,0)
GiveItemCreate("potn08",Player1,3,0,0)
GiveItemCreate("ring11",Player1,1,0,0)
GiveItemCreate("scrl67",Player1,1,0,0)
GiveItemCreate("scrl76",Player1,1,0,0)
GiveItemCreate("amul09",Player1,1,0,0)
GiveItemCreate("potn21",Player1,1,0,0)
GiveItemCreate("ring17",Player1,1,0,0)
GiveItemCreate("misc41",Player1,1,0,0)
GiveGoldForce(200) 
AddExperienceParty(245) 
SetGlobalTimer("talktopc","LOCALS",15)~ EXIT
IF ~ReactionLT(LastTalkedToBy,NEUTRAL_LOWER)~ THEN
REPLY ~Give me everything I could possibly get including stuff from quests, killing those who attack me, and looting containers that I can't possibly loot on my own.~
DO ~GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("hamm01",Player1,1,0,0)
GiveItemCreate("potn08",Player1,3,0,0)
GiveItemCreate("ring11",Player1,1,0,0)
GiveItemCreate("scrl67",Player1,1,0,0)
GiveItemCreate("scrl76",Player1,1,0,0)
GiveItemCreate("amul09",Player1,1,0,0)
GiveItemCreate("potn21",Player1,1,0,0)
GiveItemCreate("ring17",Player1,1,0,0)
GiveItemCreate("misc41",Player1,1,0,0)
GiveGoldForce(200)
AddExperienceParty(245)
SetGlobalTimer("talktopc","LOCALS",15)~ EXIT
IF ~ReactionGT(LastTalkedToBy,NEUTRAL_UPPER)~ THEN
REPLY ~Give me everything I could possibly get including stuff from quests, killing those who attack me, and looting containers that I can't possibly loot on my own.~
DO ~GiveItemCreate("misc17",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("dagg01",Player1,1,0,0)
GiveItemCreate("hamm01",Player1,1,0,0)
GiveItemCreate("potn08",Player1,3,0,0)
GiveItemCreate("ring11",Player1,1,0,0)
GiveItemCreate("scrl67",Player1,1,0,0)
GiveItemCreate("scrl76",Player1,1,0,0)
GiveItemCreate("amul09",Player1,1,0,0)
GiveItemCreate("potn21",Player1,1,0,0)
GiveItemCreate("ring17",Player1,1,0,0)
GiveItemCreate("misc41",Player1,1,0,0)
GiveItemCreate("dagg02",Player1,1,0,0)
GiveGoldForce(200)
AddExperienceParty(245)
SetGlobalTimer("talktopc","LOCALS",15)~ EXIT
IF ~~ THEN
REPLY ~Just give me something! I don't care! I just wanna get outta here as quick as possible!~
DO ~AddExperienceParty(400)
GiveItemCreate("dagg01",Player1,0,0,0)
GiveItemCreate("dagg01",Player1,0,0,0)
GiveItemCreate("potn08",Player1,2,0,0)
GiveItemCreate("misc16",Player1,0,0,0)
GiveGoldForce(32)
SetGlobalTimer("talktopc","LOCALS",15)~
EXIT END

IF ~NumTimesTalkedToGT(0)~ THEN BEGIN ~secondchat~
SAY ~Ready to go, <CHARNAME>?~
//@2208=~Ready to go, <CHARNAME>?~
IF ~~ THEN REPLY ~Yep, take me to Gorion.~ GOTO ~taketogorion~
//@2209=~Yep, take me to Gorion.~
IF ~~ THEN REPLY ~No, I haven't finished shopping yet.~ GOTO ~stillshopping~
//@2210=~No, I haven't finished shopping yet.~
IF ~~ THEN REPLY ~Actually, I thought I'd go and do all the quests anyway, and get twice the experience.~ GOTO ~cheat~
//@2211=~Actually, I thought I'd go and do all the quests anyway, and get twice the experience.~
END

IF ~~ THEN BEGIN ~taketogorion~
SAY ~Right this way.~
//@2212=~Right this way.~
IF ~~ THEN DO ~ActionOverride(Player1,JumpToPoint([2910.1970])) SetGlobal("DMWWReadyToLeaveKeep","GLOBAL",1) MoveViewPoint([2910.1970],INSTANT)~
EXIT END

IF ~~ THEN BEGIN ~stillshopping~
SAY ~Very well, <CHARNAME>, but get a move on, I don't have all day.~
= ~In any case, you don't realise just how dangerous it is here for you. Those bounty hunters can do up to one point of damage per blow!~
//@2213=~Very well, <CHARNAME>, but get a move on, I don't have all day.~
//@2214=~In any case, you don't realise just how dangerous it is here for you. Those bounty hunters can do up to one point of damage per blow!~
IF ~~ THEN DO ~SetGlobalTimer("talktopc","LOCALS",15)~ EXIT END

IF ~~ THEN BEGIN ~cheat~
SAY ~I understand completely, <CHARNAME>. Greater heroes than you have fallen to temptation at the prospect of getting two Lynx Eye Gems.~
//@2215=~I understand completely, <CHARNAME>. Greater heroes than you have fallen to temptation at the prospect of getting two Lynx Eye Gems.~
IF ~~ THEN DO ~EscapeArea()~ EXIT END
