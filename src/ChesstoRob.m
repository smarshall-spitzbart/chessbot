function XYZPRRob = ChesstoRob(XYZPRChess)
%call the key from settings
gamesettings;
load('key');
Chesscoor = zeros(1,3);
Chesscoor(1,:) = XYZPRChess(1,1:3);
Robotcoor = (Chesscoor*key{1,1})+ key{1,2}';
Robotcoor(1,4:5) = [pitch,roll];
% TODO: make this work, and stuff
XYZPRRob = Robotcoor;