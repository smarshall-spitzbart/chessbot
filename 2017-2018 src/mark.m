function Board_Locations=mark(text,Board_Locations)
var = genvarname(text);
Board_Locations.(var).xyz=ScorGetXYZPR;
Board_Locations.(var).joints=ScorGetBSEPR;
end