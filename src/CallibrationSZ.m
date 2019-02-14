%Calibration
%function CallibrationSZ(r,c);
%load('GameBoard')
%GameBoard{r,c}= ScorGetXYZPR
%end
function MasterGameboard=Mark(var)
Gameboard.var.xyz=ScorGetXYZPR;
Gameboard.var.joints=ScorGetBSEPR;
Gameboard.var.pose=ScorGetPose;
Gameboard.var.gripper=ScorGetGripper;
Gameboard.var.speed=ScorGetSpeed;
end