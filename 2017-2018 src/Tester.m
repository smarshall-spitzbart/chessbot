new = 'F5';
old = 'B7';
MovePawn('B7','F5',Chessboard,Gameboard,Gamesettings);
Chessboard.(new).piece = Chessboard.(old).piece
Chessboard.(new).color = Chessboard.(old).color
Chessboard.(old).piece = 0
Chessboard.(old).color = 0