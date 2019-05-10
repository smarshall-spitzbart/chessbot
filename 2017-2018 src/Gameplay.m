%{
This function allows the user to input the board they are using, make a
move, and output the updated board. 'old' refers to the square containing
the piece you want to move and 'new' refers to the square you want to
move it to.
 
Note: The old and new must be input as text files.
ex: Gameplay('A1','B3',Chessboard,Gameboard,Gamesettings)
%}

function [Chessboard] = Gameplay(old,new,Chessboard,Gameboard,Gamesettings)
%If there is no piece in the "old" square, return error. 
if Chessboard.(old).piece==0
    fprintf('Error. There is no piece in that square.')
    return
    
%If there is no piece in the new square, execute move.
elseif Chessboard.(new).piece==0 
    [~]=MovePawn(old,new,Chessboard,Gameboard,Gamesettings);
    Chessboard.(new).piece = Chessboard.(old).piece
    Chessboard.(new).color = Chessboard.(old).color
    Chessboard.(old).piece = 0
    Chessboard.(old).color = 0
    
%If the piece in the new square is the same color (same players) piece,
%return error.
elseif Chessboard.(new).color==Chessboard.(old).color
    fprintf('Error: invalid Move');
    return

%If the opponent has a piece in the new square, move the opponents piece to
%the graveyard and then move the users piece to the new square.
else
   [~]=MovePawn(new,genvarname('graveyard'),Chessboard,Gameboard,Gamesettings);
   [~]=MovePawn(old,new,Chessboard,Gameboard,Gamesettings);
   Chessboard.(new).piece=Chessboard.(old).piece;
   Chessboard.(old).piece=0;
   
end