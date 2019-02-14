%%Moves a piece from one space to another.

function [confirm] = MovePawn(old,new,Chessboard,Gameboard,Gamesettings)
%Set the location of the robot to x,y position of the old piece 200 mm above the board.  
stop1 = [Gameboard.(old).xyz(1) Gameboard.(old).xyz(2) Gameboard.(old).xyz(3)+200 ...
    Gameboard.(old).xyz(4) Gameboard.(old).xyz(5)];
ScorSetXYZPR(stop1);
%Shawn's Code
%
%
%Establish which piece you're trying to move.
piecenumber=Chessboard.(old).piece;
%Set a parameter for the diameter of the piece.
x=Gamesettings(piecenumber,1);
ScorWaitForMove;
%Set the gripper to a little bit larger than the piece diameter.
ScorSetGripper(x+5);
%Move to location of desired point
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
%ScorWaitForMove;
%ScorGoHome;

confirm=true
%}