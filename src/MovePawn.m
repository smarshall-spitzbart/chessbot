%Pawn moving
%Lets figure out a way to make a seperate cell where each point contains
%either a 1 or a 0 signifying if that spot on the chessboard is occupied or
%not.

function confirm = MovePawn(old,new)
load('Gameboard2')
stop1=[Gameboard2.(old).xyz(1) Gameboard2.(old).xyz(2) Gameboard2.(old).xyz(3)+160 ...
    Gameboard2.(old).xyz(4) Gameboard2.(old).xyz(5)];
ScorSetXYZPR(stop1);
x=18.3;
ScorWaitForMove;
ScorSetGripper(x+2);
pick1=[Gameboard2.(old).xyz(1) Gameboard2.(old).xyz(2) Gameboard2.(old).xyz(3)+43.7 ...
    Gameboard2.(old).xyz(4) Gameboard2.(old).xyz(5)]
ScorWaitForMove;
ScorSetXYZPR(pick1);
ScorWaitForMove;
ScorSetGripper(x);
ScorWaitForMove;
ScorSetXYZPR(stop1);
stop2=[Gameboard2.(new).xyz(1) Gameboard2.(new).xyz(2) Gameboard2.(new).xyz(3)+160 ...
    Gameboard2.(new).xyz(4) Gameboard2.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(stop2);
pick2=[Gameboard2.(new).xyz(1) Gameboard2.(new).xyz(2) Gameboard2.(new).xyz(3)+43.7 ...
    Gameboard2.(new).xyz(4) Gameboard2.(new).xyz(5)]
ScorWaitForMove;
ScorSetXYZPR(pick2);
ScorWaitForMove;
ScorSetGripper(x+2);
ScorWaitForMove;
ScorSetXYZPR(stop2);
ScorWaitForMove;
ScorGoHome;
confirm=true