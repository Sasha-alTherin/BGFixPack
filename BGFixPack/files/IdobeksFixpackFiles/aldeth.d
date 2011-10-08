REPLACE_ACTION_TEXT ~ALDETH~ ~SetGlobal("TalkedToAldeth","GLOBAL",1)~
                             ~~

REPLACE ~ALDETH~

IF WEIGHT #7 ~Global("Chapter","GLOBAL",7)~ THEN BEGIN 21
  SAY #2123
  IF ~~ THEN REPLY #2126 EXIT
  IF ~~ THEN REPLY #2127 DO ~CreateCreature("FLAMAL",[281.450],0)
                             CreateCreature("FFHUNT",[221.425],0)
                             CreateCreature("FFHUNT",[468.293],0)
                             CreateCreature("FFHUNT",[503.269],0)~ GOTO 22
END

END
