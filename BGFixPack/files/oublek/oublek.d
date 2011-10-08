//OublekBounty1 is for brage
//OublekBounty2 is for prism
//the oublekbounty globals will prevent any exploits by dropping a second item and trying to get the full reward again
/* These aren't needed if we use two items.  Without using two items for the emeralds, the player would not understand why they couldn't turn in the one gem for a reward.
ADD_TRANS_TRIGGER ~oublek~ 9 ~Global("OublekBounty1","GLOBAL",0)~ DO 0
ADD_TRANS_TRIGGER ~oublek~ 9 ~Global("OublekBounty2","GLOBAL",0)~ DO 1
ADD_TRANS_TRIGGER ~oublek~ 9 ~Global("OublekBounty1","GLOBAL",0)
Global("OublekBounty2","GLOBAL",0)~ DO 4
ADD_TRANS_TRIGGER ~oublek~ 10 ~Global("OublekBounty1","GLOBAL",0)~ DO 1 5
ADD_TRANS_TRIGGER ~oublek~ 10 ~Global("OublekBounty2","GLOBAL",0)~ DO 9 5 */
//changing from one item to two ensures that players can not take advantage of dropping one item and trying to get the full reward twice
REPLACE_TRANS_TRIGGER oublek BEGIN 9 END BEGIN 1 END ~PartyHasItem("MISC43")~ ~PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")~
REPLACE_TRANS_TRIGGER oublek BEGIN 9 END BEGIN 4 END ~!PartyHasItem("MISC43")~ ~!PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")~
REPLACE_TRANS_TRIGGER oublek BEGIN 10 END BEGIN 9 END ~PartyHasItem("MISC43")~ ~PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")~
REPLACE_TRANS_TRIGGER oublek BEGIN 10 END BEGIN 5 END ~!PartyHasItem("MISC43")~ ~!PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")~
REPLACE_TRANS_ACTION oublek BEGIN 14 END BEGIN 0 END ~TakePartyItem("MISC43")~ ~TakePartyItem("abgfEyeL")
TakePartyItem("abgfEyeR")~
//adding new states that give half the reward when only one item gets turned in
APPEND oublek
IF ~~ THEN BEGIN abLeftEye
  SAY ~One of the Emeralds! That will be a 150 gold bounty for you.  Be sure to bring the other if you should find it.~//this is custom text
  IF ~~ THEN DO ~AddexperienceParty(100)
GivePartyGold(150)
TakePartyItem("abgfEyeL")
SetGlobal("abgf_LeftEyeBounty","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN abRightEye
  SAY ~One of the Emeralds! That will be a 150 gold bounty for you.  Be sure to bring the other if you should find it.~//this is custom text
  IF ~~ THEN DO ~AddexperienceParty(100)
GivePartyGold(150)
TakePartyItem("abgfEyeR")
SetGlobal("abgf_RightEyeBounty","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN abLeftEyeLast
  SAY ~The last of the Emeralds! That will be another 150 gold bounty for you. Well, you'll make quite a name for yourself among the bounty hunters if you keep this up.  Whether it is for better or worse, I do not know.~//this is custom text
  IF ~~ THEN DO ~AddexperienceParty(100)
GivePartyGold(150)
TakePartyItem("abgfEyeL")
SetGlobal("abgf_LeftEyeBounty","GLOBAL",1)~ EXIT
END
IF ~~ THEN BEGIN abRightEyeLast
  SAY ~The last of the Emeralds! That will be another 150 gold bounty for you. Well, you'll make quite a name for yourself among the bounty hunters if you keep this up.  Whether it is for better or worse, I do not know.~//this is custom text
  IF ~~ THEN DO ~AddexperienceParty(100)
GivePartyGold(150)
TakePartyItem("abgfEyeR")
SetGlobal("abgf_RightEyeBounty","GLOBAL",1) ~ EXIT
END

END //end the append

//adding additional transitions that allow the player to turn in only one of the two required items for good boy
EXTEND_BOTTOM oublek 9
IF ~PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")
Global("abgf_LeftEyeBounty","GLOBAL",0)
Global("abgf_RightEyeBounty","GLOBAL",0)~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO abLeftEye
IF ~!PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")
Global("abgf_LeftEyeBounty","GLOBAL",0)
Global("abgf_RightEyeBounty","GLOBAL",0)~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO abRightEye
IF ~PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")
Global("abgf_RightEyeBounty","GLOBAL",1)~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO abLeftEyeLast
IF ~!PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")
Global("abgf_LeftEyeBounty","GLOBAL",1)~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO abRightEyeLast
END //end the extend bottom
//adding additional transitions that continue to keep 'bad boy' player from getting full reward. If they turn in only one gem, they get rewarded but can't turn in the other or resolve brage issue with oublek. It is an overall punishment when compared to 'good boy' rewards.
EXTEND_BOTTOM oublek 10
IF ~PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO 14
IF ~!PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")~ THEN REPLY ~I've come to turn in a bounty, and collect the reward that is duly mine.~ GOTO 14
END //end the extend bottom
//adjustments needed for prism to work with the rest of the component
ADD_STATE_TRIGGER prism 0 ~HasItem("abgfEyeL",Myself)
HasItem("abgfEyeR",Myself)~
REPLACE_TRANS_ACTION ~PRISM~ BEGIN 7 END BEGIN 0 END ~DropInventory()~
~DestroyItem("abgfEyeL")
DestroyItem("abgfEyeR")
ActionOverride("A6StatueRightEye",CreateItem("abgfEyeL",1,0,0))
ActionOverride("A6StatueLeftEye",CreateItem("abgfEyeR",1,0,0))
SetGlobal("abgf_GemInEyeL","GLOBAL",1)
SetGlobal("abgf_GemInEyeR","GLOBAL",1)~ //1 means they are in the container and penalties for taking them out of 'statue' apply
REPLACE_TRANS_ACTION prism BEGIN 9 END BEGIN 0 END ~GiveItem("MISC43","GREYWOLF")~
~GiveItem("abgfEyeL","GREYWOLF")
GiveItem("abgfEyeR","GREYWOLF")
SetGlobal("abgf_GemInEyeL","GLOBAL",2)
SetGlobal("abgf_GemInEyeR","GLOBAL",2)~ //anything not one means that either the gems were not in container when obtained OR the penalty was applied
//only way to get items if player allowed greywolf to attack prism is to attack greywolf before prism is dead and hopefully kill him before he runs away.
APPEND prism
IF ~NumTimesTalkedTo(0)
!HasItem("abgfEyeL",Myself)
!HasItem("abgfEyeR",Myself)
PartyHasItem("abgfEyeL")
PartyHasItem("abgfEyeR")
Global("ab_GemStoleResolve","GLOBAL",0)~ THEN BEGIN abBothStole
 SAY ~My Emeralds! You! You took them! I must have them back. I need them to finish this epiphany. Please, please return them. I will give you all else that is mine.~
  IF ~~ THEN REPLY #4750 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO abRelent
  IF ~~ THEN REPLY #4751 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO 3
END
IF ~~ THEN BEGIN abRelent
  SAY #678
  IF ~~ THEN DO ~TakePartyItem("abgfEyeL")
TakePartyItem("abgfEyeR")
CreateCreature("GREYWO",[1267.2579],0)
ClearAllActions()
StartCutSceneMode()
StartCutScene("Prismcut")~ EXIT
END
IF ~NumTimesTalkedTo(0)
HasItem("abgfEyeL",Myself)
!HasItem("abgfEyeR",Myself)
PartyHasItem("abgfEyeR")
Global("ab_GemStoleResolve","GLOBAL",0)~ THEN BEGIN abRightStole
 SAY ~My Emerald! You! You took it! I must have it back. I need it to finish this epiphany. Please, please return it. I will give you all else that is mine.~
  IF ~~ THEN REPLY #4750 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO abRelent
  IF ~~ THEN REPLY #4751 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO 3
END
IF ~NumTimesTalkedTo(0)
!HasItem("abgfEyeL",Myself)
HasItem("abgfEyeR",Myself)
PartyHasItem("abgfEyeL")
Global("ab_GemStoleResolve","GLOBAL",0)~ THEN BEGIN abLeftStole
 SAY ~My Emerald! You! You took it! I must have it back. I need it to finish this epiphany. Please, please return it. I will give you all else that is mine.~
  IF ~~ THEN REPLY #4750 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO abRelent
  IF ~~ THEN REPLY #4751 DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO 3
END
IF ~NumTimesTalkedTo(0)
!HasItem("abgfEyeL",Myself)
!HasItem("abgfEyeR",Myself)
!PartyHasItem("abgfEyeL")
!PartyHasItem("abgfEyeR")
Global("ab_GemStoleResolve","GLOBAL",0)~ THEN BEGIN abBothStoleButGone
 SAY ~My Emeralds! You! You took them! I must have them back. I need them to finish this epiphany. Please, please return them. I will give you all else that is mine.~
  IF ~Global("OublekBounty2","GLOBAL",1)~ THEN REPLY ~They are gone. Given to the authorities. You will never finish that lump of stone now.~ DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO 8
  IF ~Global("OublekBounty2","GLOBAL",0)~ THEN REPLY ~They are gone. Sold by now to hang on the neck as some fat woman's trinket.~ DO ~SetGlobal("ab_GemStoleResolve","GLOBAL",1)~ GOTO 8
END 
END//end the append