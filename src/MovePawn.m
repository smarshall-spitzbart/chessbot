%Pawn moving
%Lets figure out a way to make a seperate cell where each point contains
%either a 1 or a 0 signifying if that spot on the chessboard is occupied or
%not.

function confirm = MovePawn(old,new)
load('Gameboard2')
load('Gamesettings')
load('Chessboard')
stop1=[Gameboard2.(old).xyz(1) Gameboard2.(old).xyz(2) Gameboard2.(old).xyz(3)+200 ...
    Gameboard2.(old).xyz(4) Gameboard2.(old).xyz(5)];
ScorSetXYZPR(stop1);
piecenumber=Chessboard.(old).piece;
x=Gamesettings(piecenumber,1);
%Diameter of each piece is in column 1
ScorWaitForMove;
ScorSetGripper(x+3);
pick1=[Gameboard2.(old).xyz(1) Gameboard2.(old).xyz(2) Gameboard2.(old).xyz(3)+Gamesettings(piecenumber,2) ...
    Gameboard2.(old).xyz(4) Gameboard2.(old).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick1);
ScorWaitForMove;
ScorSetGripper(x);
ScorWaitForMove;
ScorSetXYZPR(stop1);
stop2=[Gameboard2.(new).xyz(1) Gameboard2.(new).xyz(2) Gameboard2.(new).xyz(3)+200 ...
    Gameboard2.(new).xyz(4) Gameboard2.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(stop2);
pick2=[Gameboard2.(new).xyz(1) Gameboard2.(new).xyz(2) Gameboard2.(new).xyz(3)+Gamesettings(piecenumber,2) ...
    Gameboard2.(new).xyz(4) Gameboard2.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick2);
ScorWaitForMove;
ScorSetGripper(x+3);
ScorWaitForMove;
ScorSetXYZPR(stop2);
ScorWaitForMove;
ScorGoHome;
confirm=true