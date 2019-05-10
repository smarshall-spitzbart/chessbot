function movedown
%get current position, then convert to chess coordinates, then execute 10
%movements to the playing plane
posR = ScorGetXYZPR();
posC = RobtoChess(posR);
%posC is position in relation to chess board
constants;
gamesettings;
ScorSetSpeed(50);

n = 10;
i = 1;
pos_move = zeros(n,5);
alpha = linspace(0,1,10);
for i = 1:n;
    pos_move(i,IX)= posC(1,IX);
    pos_move(i,IY)= posC(1,IY);
    pos_move(i,IZ) = posC(1,IZ)*(1-alpha(i))+ playingheight*alpha(i);
    pos_move(i,IP) = pitch;
    pos_move(i,IR) = roll;
end
i = 1;
for i = 1:n;
    pos_move(i,:) = ChesstoRob(pos_move(i,:));
    ScorSetXYZPR(pos_move(i,:), 'MoveType', 'LinearJoint');
    ScorWaitForMove;
end