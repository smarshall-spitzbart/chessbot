%% Line points parallel to robots, ordered A-I alphabetically from board
load('Board_Locations.mat')

% Line_Locations.parallel.A.xyz.first = [Board_Locations.A1.xyz(1:5)] - 0.5*[(Board_Locations.A2.xyz(1)-Board_Locations.A1.xyz(1)),(Board_Locations.B1.xyz(2)-Board_Locations.A1.xyz(2)), 0, 0, 0];
Line_Locations.parallel.A.xyz.first = [168.5000  133.9590  115.8020 -1.5933    0.7162]; %manual adjustment

% Line_Locations.parallel.I.xyz.first = [Board_Locations.H1.xyz(1:5)] - 0.5*[(Board_Locations.H2.xyz(1)-Board_Locations.H1.xyz(1)),(Board_Locations.G1.xyz(2)-Board_Locations.H1.xyz(2)), 0, 0, 0];
Line_Locations.parallel.I.xyz.first = [175.7098 -237.2216  115.6860   -1.6039   -0.9051]; %manual adjustment

% 'Second' parallel point for A line, (between lines 4 and 5)
Line_Locations.parallel.A.xyz.second = [363.4180  139.6960  115.7150   -1.6039    0.4034];

% 'Second' parallel point for I line, (between lines 4 and 5)
Line_Locations.parallel.I.xyz.second = [368.5360 -240.2740  114.4830   -1.5633   -0.5793];

%% Now define line points perpendicular to robots, ordered 1-5 from board (for robot A)
Line_Locations.perpendicular.one.xyz.first = Line_Locations.parallel.A.xyz.first;
Line_Locations.perpendicular.five.xyz.first = Line_Locations.parallel.A.xyz.second;

Line_Locations.perpendicular.one.xyz.second = Line_Locations.parallel.I.xyz.first;
Line_Locations.perpendicular.five.xyz.second = Line_Locations.parallel.I.xyz.second;
%% Iteration Points
% 'First' points along board for parallel lines
AdditionVector1 = (Line_Locations.parallel.I.xyz.first - Line_Locations.parallel.A.xyz.first)/8;
Line_Locations.parallel.B.xyz.first = Line_Locations.parallel.A.xyz.first + AdditionVector1;
Line_Locations.parallel.C.xyz.first = Line_Locations.parallel.B.xyz.first + AdditionVector1;
Line_Locations.parallel.D.xyz.first = Line_Locations.parallel.C.xyz.first + AdditionVector1;
Line_Locations.parallel.E.xyz.first = Line_Locations.parallel.D.xyz.first + AdditionVector1;
Line_Locations.parallel.F.xyz.first = Line_Locations.parallel.E.xyz.first + AdditionVector1;
Line_Locations.parallel.G.xyz.first = Line_Locations.parallel.F.xyz.first + AdditionVector1;
Line_Locations.parallel.H.xyz.first = Line_Locations.parallel.G.xyz.first + AdditionVector1;

% 'Second' points along board for parallel lines
AdditionVector2 = (Line_Locations.parallel.I.xyz.second - Line_Locations.parallel.A.xyz.second)/8;
Line_Locations.parallel.B.xyz.second = Line_Locations.parallel.A.xyz.second + AdditionVector2;
Line_Locations.parallel.C.xyz.second = Line_Locations.parallel.B.xyz.second + AdditionVector2;
Line_Locations.parallel.D.xyz.second = Line_Locations.parallel.C.xyz.second + AdditionVector2;
Line_Locations.parallel.E.xyz.second = Line_Locations.parallel.D.xyz.second + AdditionVector2;
Line_Locations.parallel.F.xyz.second = Line_Locations.parallel.E.xyz.second + AdditionVector2;
Line_Locations.parallel.G.xyz.second = Line_Locations.parallel.F.xyz.second + AdditionVector2;
Line_Locations.parallel.H.xyz.second = Line_Locations.parallel.G.xyz.second + AdditionVector2;
%% CHECK THE FOLLOWING TWO
% 'First' points along board for perpendicular lines
AdditionVector3 = (Line_Locations.perpendicular.five.xyz.first - Line_Locations.perpendicular.one.xyz.first)/4;
Line_Locations.perpendicular.two.xyz.first = Line_Locations.perpendicular.one.xyz.first + AdditionVector3;
Line_Locations.perpendicular.three.xyz.first = Line_Locations.perpendicular.two.xyz.first + AdditionVector3;
Line_Locations.perpendicular.four.xyz.first = Line_Locations.perpendicular.three.xyz.first + AdditionVector3;

% 'Second' points along board for perpendicular lines
AdditionVector4 = (Line_Locations.perpendicular.five.xyz.second - Line_Locations.perpendicular.one.xyz.second)/4;
Line_Locations.perpendicular.two.xyz.second = Line_Locations.perpendicular.one.xyz.second + AdditionVector4;
Line_Locations.perpendicular.three.xyz.second = Line_Locations.perpendicular.two.xyz.second + AdditionVector4;
Line_Locations.perpendicular.four.xyz.second = Line_Locations.perpendicular.three.xyz.second + AdditionVector4;

%% iterated intersection points (lines/letters ordered from very edge)
AdditionVector5 = (Line_Locations.parallel.A.xyz.second - Line_Locations.parallel.A.xyz.first)/4;
Board_intersections.A1 = Line_Locations.parallel.A.xyz.first;
Board_intersections.A2 = Board_intersections.A1 + AdditionVector5;
Board_intersections.A3 = Board_intersections.A2 + AdditionVector5;
Board_intersections.A4 = Board_intersections.A3 + AdditionVector5;
Board_intersections.A5 = Line_Locations.parallel.A.xyz.second;

AdditionVector6 = (Line_Locations.parallel.B.xyz.second - Line_Locations.parallel.B.xyz.first)/4;
Board_intersections.B1 = Line_Locations.parallel.B.xyz.first;
Board_intersections.B2 = Board_intersections.B1 + AdditionVector6;
Board_intersections.B3 = Board_intersections.B2 + AdditionVector6;
Board_intersections.B4 = Board_intersections.B3 + AdditionVector6;
Board_intersections.B5 = Line_Locations.parallel.B.xyz.second;

AdditionVector7 = (Line_Locations.parallel.C.xyz.second - Line_Locations.parallel.C.xyz.first)/4;
Board_intersections.C1 = Line_Locations.parallel.C.xyz.first;
Board_intersections.C2 = Board_intersections.C1 + AdditionVector7;
Board_intersections.C3 = Board_intersections.C2 + AdditionVector7;
Board_intersections.C4 = Board_intersections.C3 + AdditionVector7;
Board_intersections.C5 = Line_Locations.parallel.C.xyz.second;

AdditionVector8 = (Line_Locations.parallel.D.xyz.second - Line_Locations.parallel.D.xyz.first)/4;
Board_intersections.D1 = Line_Locations.parallel.D.xyz.first;
Board_intersections.D2 = Board_intersections.D1 + AdditionVector8;
Board_intersections.D3 = Board_intersections.D2 + AdditionVector8;
Board_intersections.D4 = Board_intersections.D3 + AdditionVector8;
Board_intersections.D5 = Line_Locations.parallel.C.xyz.second;

AdditionVector9 = (Line_Locations.parallel.E.xyz.second - Line_Locations.parallel.E.xyz.first)/4;
Board_intersections.E1 = Line_Locations.parallel.E.xyz.first;
Board_intersections.E2 = Board_intersections.E1 + AdditionVector9;
Board_intersections.E3 = Board_intersections.E2 + AdditionVector9;
Board_intersections.E4 = Board_intersections.E3 + AdditionVector9;
Board_intersections.E5 = Line_Locations.parallel.E.xyz.second;

AdditionVector10 = (Line_Locations.parallel.F.xyz.second - Line_Locations.parallel.F.xyz.first)/4;
Board_intersections.F1 = Line_Locations.parallel.F.xyz.first;
Board_intersections.F2 = Board_intersections.F1 + AdditionVector10;
Board_intersections.F3 = Board_intersections.F2 + AdditionVector10;
Board_intersections.F4 = Board_intersections.F3 + AdditionVector10;
Board_intersections.F5 = Line_Locations.parallel.F.xyz.second;

AdditionVector11 = (Line_Locations.parallel.G.xyz.second - Line_Locations.parallel.G.xyz.first)/4;
Board_intersections.G1 = Line_Locations.parallel.G.xyz.first;
Board_intersections.G2 = Board_intersections.G1 + AdditionVector11;
Board_intersections.G3 = Board_intersections.G2 + AdditionVector11;
Board_intersections.G4 = Board_intersections.G3 + AdditionVector11;
Board_intersections.G5 = Line_Locations.parallel.G.xyz.second;

AdditionVector12 = (Line_Locations.parallel.H.xyz.second - Line_Locations.parallel.H.xyz.first)/4;
Board_intersections.H1 = Line_Locations.parallel.H.xyz.first;
Board_intersections.H2 = Board_intersections.H1 + AdditionVector12;
Board_intersections.H3 = Board_intersections.H2 + AdditionVector12;
Board_intersections.H4 = Board_intersections.H3 + AdditionVector12;
Board_intersections.H5 = Line_Locations.parallel.H.xyz.second;

AdditionVector13 = (Line_Locations.parallel.I.xyz.second - Line_Locations.parallel.I.xyz.first)/4;
Board_intersections.I1 = Line_Locations.parallel.I.xyz.first;
Board_intersections.I2 = Board_intersections.I1 + AdditionVector13;
Board_intersections.I3 = Board_intersections.I2 + AdditionVector13;
Board_intersections.I4 = Board_intersections.I3 + AdditionVector13;
Board_intersections.I5 = Line_Locations.parallel.I.xyz.second;