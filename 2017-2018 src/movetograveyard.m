function movetograveyard(start)
constants;
settings;
posabovestart = [start(1,IX),start(1,IY),planeheight,pitch,roll];
hometostart(posabovestart);
Scorsetgripper(gripperopen);
movedown;
Scorsetgripper(gripperclosed);
moveup;
movetoplanar(graveyard);
movedown;
Scorsetgripper(gripperopen);
moveup;
ScorGoHome;
