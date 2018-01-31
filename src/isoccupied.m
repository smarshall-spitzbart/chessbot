function O = isoccupied(pos)
constants;
load('board');
x = pos(1,IX);
y = pos(1,IY);
if board(9-x,9-y) == 0
    O = 0;
else
    O = 1;
end

