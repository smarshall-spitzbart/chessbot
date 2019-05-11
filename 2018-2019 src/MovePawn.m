%%Moves a piece from one space to another.

function [confirm] = MovePawn(old,new,Gameboard,Gamesettings,Chessboard,Board_intersections)
%Set the location of the robot to x,y position of the old piece 200 mm above the board.  
stop1 = [Gameboard.(old).xyz(1) Gameboard.(old).xyz(2) Gameboard.(old).xyz(3)+200 ...
    Gameboard.(old).xyz(4) Gameboard.(old).xyz(5)];
ScorSetXYZPR(stop1);

%Correct position of 'old' placement if needed (comment out if cam not
%attached)
[~] = CorrectPosition(Chessboard,Gameboard,Gamesettings,Board_intersections,old);

%Establish which piece you're trying to move.
piecenumber=Chessboard.(old).piece;
%Set a parameter for the diameter of the piece.
x=Gamesettings(piecenumber,1);
ScorWaitForMove;
%Set the gripper to a little bit larger than the piece diameter.
ScorSetGripper(x+5);
%Move down to actual piece (moving down in z).
pick1=[Gameboard.(old).xyz(1) Gameboard.(old).xyz(2) Gameboard.(old).xyz(3)+Gamesettings(piecenumber,2)-2 ...
    Gameboard.(old).xyz(4) Gameboard.(old).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick1);
ScorWaitForMove;
%Grip the Piece
ScorSetGripper(x);
ScorWaitForMove;
%Move up in z with piece
ScorSetXYZPR(stop1);
%Move to x&y location of new position.
stop2=[Gameboard.(new).xyz(1) Gameboard.(new).xyz(2) Gameboard.(new).xyz(3)+200 ...
    Gameboard.(new).xyz(4) Gameboard.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(stop2);
%Place the piece on the new square (moving down in z).
pick2=[Gameboard.(new).xyz(1) Gameboard.(new).xyz(2) Gameboard.(new).xyz(3)+Gamesettings(piecenumber,2) ...
    Gameboard.(new).xyz(4) Gameboard.(new).xyz(5)];
ScorWaitForMove;
ScorSetXYZPR(pick2);
ScorWaitForMove;
%Release the piece
ScorSetGripper(x+3);
ScorWaitForMove;
ScorSetXYZPR(stop2);
%ScorWaitForMove;
confirm=true
end