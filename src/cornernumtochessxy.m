function chessxycoor = cornernumtochessxy(number)
gamesettings;
xmult = ceil(number/7);
ymult = ((number/7)-floor(number/7))*7;
if ymult == 0
    ymult = 7;
end
xcoor = -squaredim/2 + xmult*squaredim;
ymult = 8-ymult;
ycoor = -squaredim/2+ymult*squaredim;
chessxycoor = [xcoor,ycoor];