function GoToChess(a,b)
a = ChesstoXY(a,b);
chesspos = [a(1,1),a(1,2),0,-1.59,.73];
ScorSetXYZPR(ChesstoRob(chesspos));