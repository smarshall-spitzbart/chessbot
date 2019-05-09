% Detects location of chess piece after it has been placed and gripper has
% been released (see MovePawn function)

% [confirm] = CorrectPosition(Chessboard,Gameboard,Gamesettings,Board_intersections,'D2')

function [confirm] = CorrectPosition(Chessboard,Gameboard,Gamesettings,Board_intersections,boardsquare)

%Establish which piece you're trying to move
piecenumber = Chessboard.(boardsquare).piece;
%%
% call robot arm to initial placement
initstop = [Gameboard.(boardsquare).xyz(1) Gameboard.(boardsquare).xyz(2) Gameboard.(boardsquare).xyz(3)+200 ...
    Gameboard.(boardsquare).xyz(4) Gameboard.(boardsquare).xyz(5)];
ScorSetXYZPR(initstop);

x=Gamesettings(piecenumber,1);

%% Correct for chess piece placement
stop1 = [Gameboard.(boardsquare).xyz(1) Gameboard.(boardsquare).xyz(2) Gameboard.(boardsquare).xyz(3)+200 ...
    Gameboard.(boardsquare).xyz(4) Gameboard.(boardsquare).xyz(5)];
%% Rotational Displacement Correction

% Slope difference to pitch conversion factor
P2S = 0.95; % pitch value per slope

% Image process for rotation
[XYZPRPiece,Slopediff] = ProcessImageRot(Chessboard,Gameboard,Gamesettings,Board_intersections,boardsquare);

if abs(Slopediff) > 0.01 % Rotational correction needed
    
    ScorSetGripper(x+5);
    % Move arm to location of image processed point
    pick1=[XYZPRPiece(1) XYZPRPiece(2) XYZPRPiece(3)+Gamesettings(piecenumber,2)-2 ...
        XYZPRPiece(4) XYZPRPiece(5)];
    ScorWaitForMove;
    ScorSetXYZPR(pick1);
    ScorWaitForMove;
    ScorSetGripper(x);
    ScorWaitForMove;
    ScorSetXYZPR(stop1);
    % Correct for rotation
    pick2=[XYZPRPiece(1) XYZPRPiece(2) XYZPRPiece(3)+Gamesettings(piecenumber,2)-2 ...
        XYZPRPiece(4) XYZPRPiece(5)-P2S*Slopediff];
    ScorWaitForMove;
    ScorSetXYZPR(pick2);
    ScorWaitForMove;
    ScorSetGripper(x+3);
    ScorWaitForMove;
    % Return arm to original spot
    ScorSetXYZPR(stop1);
    ScorWaitForMove;
end

%% Planar Displacement Correction

% Image process for displacement
[XYZPRPiece,XYZPRPieceIdeal,Piece_LM] = ProcessImageDisp(Chessboard,Gameboard,Gamesettings,Board_intersections,boardsquare)

if Piece_LM(1) < 0.40 || Piece_LM(1) > 0.60 || Piece_LM(2) < 0.45 || Piece_LM(2) > 0.60
    
    % Move piece to proper M,L coordinates
    ScorSetGripper(x+5);
    % Move arm to location of image processed point
    pick1=[XYZPRPiece(1) XYZPRPiece(2) XYZPRPiece(3)+Gamesettings(piecenumber,2)-2 ...
        XYZPRPiece(4) XYZPRPiece(5)];
    ScorWaitForMove;
    ScorSetXYZPR(pick1);
    ScorWaitForMove;
    ScorSetGripper(x);
    ScorWaitForMove;
    ScorSetXYZPR(stop1);
    % Correct for displacement
    pick2=[XYZPRPieceIdeal(1) XYZPRPieceIdeal(2)...
        (XYZPRPieceIdeal(3)+Gamesettings(piecenumber,2)-2)...
        XYZPRPieceIdeal(4) XYZPRPieceIdeal(5)];
    ScorWaitForMove;
    ScorSetXYZPR(pick2);
    ScorWaitForMove;
    ScorSetGripper(x+3);
    ScorWaitForMove;
    % Return arm to original spot
    ScorSetXYZPR(stop1);
    ScorWaitForMove;
end
confirm = true