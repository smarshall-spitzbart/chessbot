function confirm=Gameplay(old,new)
load('Chessboard')
if Chessboard.(new)==0 & Chessboard.(old)%Figure out
    MovePawn(old,new)
elseif Chessboard.(new).color==Chessboard.(old).color
    fprint('Error: You cannot do that');
    return
else
   MovePawn(new,graveyard)