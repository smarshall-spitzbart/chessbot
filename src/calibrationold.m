function key = calibrationold(a,b,c,o)
%ASSUMING CALIBRATION ORDER IS point A then B, then C where A is position
%A1 on the chess board, point B is H1, and point C is H6
constants;
A = a(1,1:3);
B = b(1,1:3);
C = c(1,1:3);
chessi = (C-B)/sqrt(sum((C-B).^2));
chessj = (A-B)/sqrt(sum((A-B).^2));
chessk = cross(chessi,chessj);

tmatrix(1,:)=chessi;
tmatrix(2,:)=chessj;
tmatrix(3,:)=chessk;
O = o(1,1:3);
offset = O;
%can average C and A as well to get better offset
key = {tmatrix,offset};
save('key','key');