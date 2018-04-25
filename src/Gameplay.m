function confirm=Gameplay(old,new)
temp = load('Chessboard', 'Chessboard');
Chessboard = temp.Chessboard;
if Chessboard.(old).piece==0
    fprintf('Error. There is no piece in that square.')
    return
elseif Chessboard.(new).piece==0 
    MovePawn(old,new);
    Chessboard.(new).piece=Chessboard.(old).piece
    Chessboard.(new).color=Chessboard.(old).color
    Chessboard.(old).piece=0
    Chessboard.(old).color=0
    save('Chessboard', 'Chessboard');
elseif Chessboard.(new).color==Chessboard.(old).color
    fprintf('Error: You cannot do that');
    return
else
   MovePawn(new,genvarname('graveyard'));
   MovePawn(old,new);
   Chessboard.(new).piece=Chessboard.(old).piece;
   Chessboard.(old).piece=0;
   save('Chessboard', 'Chessboard');
end