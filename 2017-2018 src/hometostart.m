function hometostart(start)
%input has to be in relation to chess board NEED TO BE 1 by 5 array
%get current position, move to plane above piece
%NEEDS planeheight to already be in the start height
posR = ScorGetXYZPR();
posC = RobtoChess(posR);
constants;
gamesettings;
pos_move = zeros(1,5);

ScorSetSpeed(50);

Rect = ChesstoXY(start(1,IX),start(1,IY)); 
i=1;
n=10;
alpha = linspace(0,1,n);
for i = 1:n
    pos_move(i,IX)= posC(1,IX)*(1-alpha(i))+ alpha(i)*start(1,IX);
    pos_move(i,IY)= posC(1,IY)*(1-alpha(i))+ alpha(i)*start(1,IY);
    pos_move(i,IZ) = posC(1,IZ)*(1-alpha(i))+ alpha(i)*start(1,IZ);
    pos_move(i,IP) = posC(1,IP)*(1-alpha(i))+ alpha(i)*start(1,IP);
    pos_move(i,IR) = posC(1,IR)*(1-alpha(i))+ alpha(i)*start(1,IR);
end

i=1;
for i = 1:n
    pos_move(i,:) = ChesstoRob(pos_move(i,:));
    ScorSetXYZPR(pos_move(i,:),'MoveType','LinearTask'); %Not sure what 'MoveType' is...
    ScorWaitForMove;
end
