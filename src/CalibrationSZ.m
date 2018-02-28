function CalibrationSZ(row,column)

load('Gameboard')

A = ScorGetXYZPR;
A(6:10) = ScorGetBSEPR;
Gameboard{row,column} = A; 

save('Gameboard')

end

