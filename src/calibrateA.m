function keypartial = calibratePos
%move robot arm to site A before calling
boardDimensions;
constants;
Rob = zeros(1,3);
five = ScorGetXYZPR;
Rob(1,:) = five(1,1:3);
Chess = zeros(1,3);
Chess(1,IX)= AX;
Chess(1,IY)= AY;
Chess(1,IZ)= AZ;

keypartial = Chess(1,:);