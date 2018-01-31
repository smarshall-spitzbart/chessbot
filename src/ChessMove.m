function ChessMove(start,finish)
%inputs are the starting position of the piece(Chess command) and desired
%position of the piece(Chess command)
constants;
gamesettings;
occupied = isoccupied(finish);
start = ChesstoXY(start(1,IX),start(1,IY));
finish = ChesstoXY(finish(1,IX),finish(1,IY));

if occupied == 1
    movetograveyard(finish);
end

posabovestart = [start(1,IX),start(1,IY),planeheight,pitch,roll];
hometostart(posabovestart);
ScorSetGripper(gripperopen);
ScorWaitForMove;
movedown;
ScorSetGripper(gripperclosed);
ScorWaitForMove;
moveup;
f = [finish(1,IX),finish(1,IY)];
movetoplanar(f);
movedown;
ScorSetGripper(gripperopen);
ScorWaitForMove;
moveup;
updateboard(start,finish);
ScorGoHome;
