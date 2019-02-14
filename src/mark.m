function MasterGameboard=mark(text,MasterGameboard)
var = genvarname(text);
MasterGameboard.(var).xyz=ScorGetXYZPR;
MasterGameboard.(var).joints=ScorGetBSEPR;
MasterGameboard.(var).pose=ScorGetPose;
MasterGameboard.(var).gripper=ScorGetGripper;
MasterGameboard.(var).speed=ScorGetSpeed;
end