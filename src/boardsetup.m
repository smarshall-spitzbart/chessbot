function boardsetup
constants;
board = zeros(8,8);
board(2,:)= Pawn;
board(7,:)= Pawn;
board(1,1)= Rook;
board(1,2)= Knight;
board(1,3)= Bishop;
board(1,4)= King;
board(1,5)= Queen;
board(1,6)= Bishop;
board(1,7)= Knight;
board(1,8)= Rook;
board(8,1)= Rook;
board(8,2)= Knight;
board(8,3)= Bishop;
board(8,4)= King;
board(8,5)= Queen;
board(8,6)= Bishop;
board(8,7)= Knight;
board(8,8)= Rook;
save('board','board');