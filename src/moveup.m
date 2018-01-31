function moveup
%get current position, then convert to chess coordinates, then get the ten
%positions in between (current and plane above pieces), then execute movement to all points in between, then
posR = ScorGetXYZPR();
%posR is position in Robot terms
posC = RobtoChess(posR);%NEED RobtoChess()!!!
%posC is position in relation to chess board
constants;
gamesettings;

n=10;
i =1;
pos_move = zeros(n,5);
alpha = linspace(0,1,10);
for i = 1:n;
    pos_move(i,IX)= posC(1,IX);
    pos_move(i,IY)= posC(1,IY);
    pos_move(i,IZ) = posC(1,IZ)*(1-alpha(i))+ planeheight*alpha(i);
    pos_move(i,IP) = pitch;
    pos_move(i,IR) = roll;
end
%% move Robot Incrementally
i = 1;
for i = 1:n
    pos_move(i,:) = ChesstoRob(pos_move(i,:));
    ScorSetXYZPR(pos_move(i,:), 'MoveType', 'LinearJoint');
    ScorWaitForMove;
end