function updateboard(start, finish)
constants;
gamesettings;
load('board')
Xstart = round(start(1,IX)/squaredim);
Ystart = round(start(1,IY)/squaredim);
Xfinish = round(finish(1,IX)/squaredim);
Yfinish = round(finish(1,IY)/squaredim);

board(9-Xfinish,9-Yfinish)= board(9-Xstart,9-Ystart);
board(9-Xstart,9-Ystart)=0;
save('board','board');