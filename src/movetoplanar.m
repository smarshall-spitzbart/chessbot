function movetoplanar(a)
constants;
gamesettings;
% input has to be in relation to chessboard
%get current position, then move incrementally to end position
posR = ScorGetXYZPR();
%posR is position in Robot terms
posC = RobtoChess(posR); %NEED RobtoChess()!!!
%posC is position in relation to chess board

%% generate move info
n = 10;
pos_move = zeros(5,n);
alpha = linspace(0,1,n);
for i = 1:n
    pos_mov(i,IX) = posC(1,IX)*(1-alpha(i)) + alpha(i)*a(1,IX);
    pos_mov(i,IY) = posC(1,IY)*(1-alpha(i)) + alpha(i)*a(1,IY);
    pos_mov(i,IZ) = playingheight; %%%%%FIX THIS PUT BACK TO planeheight
    pos_mov(i,IP) = pitch;
    pos_mov(i,IR) = roll;
    
end
i = 1;

%% move Robot incrementally
for i =1:n
    pos_mov(i,:) = ChesstoRob(pos_mov(i,:));
    ScorSetXYZPR(pos_mov(i,:), 'MoveType', 'LinearJoint');
    ScorWaitForMove;
end
return