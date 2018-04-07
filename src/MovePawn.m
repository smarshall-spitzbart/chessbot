%Pawn moving
%Lets figure out a way to make a seperate cell where each point contains
%either a 1 or a 0 signifying if that spot on the chessboard is occupied or
%not.

function confirm = MovePawn(old1,new1)
old=genvarname(old1);
new=genvarname(new1);
stop1=[Gameboard2.(old).xyz(1) Gameboard2.(old).xyz(2) Gameboard2.(old).xyz(3)+150 ...
    Gameboard2.(old).xyz(4) Gameboard2.(old).xyz(5)];
ScorSetXYZPR(stop1);
x=18.3;
ScorSetGripper(x+2);
ScorSetXYZPR(Gameboard2.(old).xyz);
ScorSetGripper(x);
ScorSetXYZPR(stop1);
stop2=[Gameboard2.(new).xyz(1) Gameboard2.(new).xyz(2) Gameboard2.(new).xyz(3)+150 ...
    Gameboard2.(new).xyz(4) Gameboard2.(new).xyz(5)];
ScorSetXYZPR(stop2);
ScorSetXYZPR(Gameboard2.(new).xyz);
ScorSetGripper(x+2);
ScorSetXYZPR(stop2);
ScorGoHome;
confirm=true