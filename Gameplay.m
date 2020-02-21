function [Chessboard] = Gameplay(old,new,Chessboard,Gameboard,Gamesettings)
if Chessboard.(old).piece==0
    fprintf('Error. There is no piece in that square.')
    return
elseif Chessboard.(new).piece==0 
    [~]=MovePawn(old,new,Chessboard,Gameboard,Gamesettings);
    Chessboard.(new).piece = Chessboard.(old).piece
    Chessboard.(new).color = Chessboard.(old).color
    Chessboard.(old).piece = 0
    Chessboard.(old).color = 0
elseif Chessboard.(new).color==Chessboard.(old).color
    fprintf('Error: invalid Move');
    return
else
   [~]=MovePawn(new,genvarname('graveyard'),Chessboard,Gameboard,Gamesettings);
   [~]=MovePawn(old,new,Chessboard,Gameboard,Gamesettings);
   Chessboard.(new).piece=Chessboard.(old).piece;
   Chessboard.(old).piece=0;
end