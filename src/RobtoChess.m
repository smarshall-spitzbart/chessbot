function XYZPRChess = RobtoChess(XYZPRRob)
%Orientation?
%call the key from settings
gamesettings;
load('key');
Robotcoor = zeros(1,3);
Robotcoor(1,:) = XYZPRRob(1,1:3);
Chesscoor = (Robotcoor-key{1,2}')*(key{1,1}^-1); %key is the transformation matrix
Chesscoor (1,4:5)= [pitch,roll] ;
%need settings for pitch and roll or figure out how to match just pitch and
%roll as close as possible FOR LATER...
XYZPRChess = Chesscoor;
%make it work... Show me what you gotttttt