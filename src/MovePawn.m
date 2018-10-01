%%Moves a piece from one space to another.

function [confirm] = MovePawn(old,new,Chessboard,Gameboard,Gamesettings)
%Set the location of the old piece as  
stop1=[Gameboard.(old).xyz(1) Gameboard.(old).xyz(2) Gameboard.(old).xyz(3)+200 ...
    Gameboard.(old).xyz(4) Gameboard.(old).xyz(5)];
ScorSetXYZPR(stop1);
piecenumber=Chessboard.(old).piece;
x=Gamesettings(piecenumber,1);
%Diameter of each piece is in column 1
ScorWaitForMove;
ScorSetGripper(x+3);
pick1=[Gameboard.(old).xyz(1) Gameboard.(old).xyz(2) Gameboard.(old).xyz(3)+Gamesettings(piecenumber,2) ...
    Gameboard.(old).xyz(4) Gameboard.(old).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick1);
ScorWaitForMove;
ScorSetGripper(x);
ScorWaitForMove;
ScorSetXYZPR(stop1);
stop2=[Gameboard.(new).xyz(1) Gameboard.(new).xyz(2) Gameboard.(new).xyz(3)+200 ...
    Gameboard.(new).xyz(4) Gameboard.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(stop2);
pick2=[Gameboard.(new).xyz(1) Gameboard.(new).xyz(2) Gameboard.(new).xyz(3)+Gamesettings(piecenumber,2) ...
    Gameboard.(new).xyz(4) Gameboard.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick2);
%Shawn
ScorWaitForMove;
ScorSetGripper(x+3);
ScorWaitForMove;
ScorSetXYZPR(stop2);
ScorWaitForMove;
ScorGoHome;

confirm=true