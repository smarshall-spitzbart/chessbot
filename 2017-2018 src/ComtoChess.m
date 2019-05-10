function Rect = ComtoChess(a,b)
gamesettings;
c = 9-(a-64);
Rect = [b,c];
if a > 72
    c = 9-(a-96);
    Rect = [b,c];
%rectangular coordinates%
end
Rect = [(b-1)*squaredim,(9-c)*squaredim];

%Square dim needs to be the dimension of a square on the gameboard