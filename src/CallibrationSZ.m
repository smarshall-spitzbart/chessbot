%Calibration
%function CallibrationSZ(r,c);
%load('GameBoard')
%GameBoard{r,c}= ScorGetXYZPR
%end
function Gameboard1=CallibrationSZ(r,c)
load('Gameboard1');
Gameboard1.xyz=ScorGetXYZPR;
Gameboard1.joints=ScorGetBSEPR;
Gameboard1.pose=ScorGetPose;
Gameboard1.gripper=ScorGetGripper;
Gameboard1.speed=ScorGetSpeed;
save('Gameboard1');
end