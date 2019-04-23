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
Board_intersections.A1.xyz = Line_Locations.parallel.A.xyz.first;
Board_intersections.A2.xyz = Board_intersections.A1.xyz + AdditionVector5;
Board_intersections.A3.xyz = Board_intersections.A2.xyz + AdditionVector5;
Board_intersections.A4.xyz = Board_intersections.A3.xyz + AdditionVector5;
Board_intersections.A5.xyz = Line_Locations.parallel.A.xyz.second;

AdditionVector6 = (Line_Locations.parallel.B.xyz.second - Line_Locations.parallel.B.xyz.first)/4;
Board_intersections.B1.xyz = Line_Locations.parallel.B.xyz.first;
Board_intersections.B2.xyz = Board_intersections.B1.xyz + AdditionVector6;
Board_intersections.B3.xyz = Board_intersections.B2.xyz + AdditionVector6;
Board_intersections.B4.xyz = Board_intersections.B3.xyz + AdditionVector6;
Board_intersections.B5.xyz = Line_Locations.parallel.B.xyz.second;

AdditionVector7 = (Line_Locations.parallel.C.xyz.second - Line_Locations.parallel.C.xyz.first)/4;
Board_intersections.C1.xyz = Line_Locations.parallel.C.xyz.first;
Board_intersections.C2.xyz = Board_intersections.C1.xyz + AdditionVector7;
Board_intersections.C3.xyz = Board_intersections.C2.xyz + AdditionVector7;
Board_intersections.C4.xyz = Board_intersections.C3.xyz + AdditionVector7;
Board_intersections.C5.xyz = Line_Locations.parallel.C.xyz.second;

AdditionVector8 = (Line_Locations.parallel.D.xyz.second - Line_Locations.parallel.D.xyz.first)/4;
Board_intersections.D1.xyz = Line_Locations.parallel.D.xyz.first;
Board_intersections.D2.xyz = Board_intersections.D1.xyz + AdditionVector8;
Board_intersections.D3.xyz = Board_intersections.D2.xyz + AdditionVector8;
Board_intersections.D4.xyz = Board_intersections.D3.xyz + AdditionVector8;
Board_intersections.D5.xyz = Line_Locations.parallel.C.xyz.second;

AdditionVector9 = (Line_Locations.parallel.E.xyz.second - Line_Locations.parallel.E.xyz.first)/4;
Board_intersections.E1.xyz = Line_Locations.parallel.E.xyz.first;
Board_intersections.E2.xyz = Board_intersections.E1.xyz + AdditionVector9;
Board_intersections.E3.xyz = Board_intersections.E2.xyz + AdditionVector9;
Board_intersections.E4.xyz = Board_intersections.E3.xyz + AdditionVector9;
Board_intersections.E5.xyz = Line_Locations.parallel.E.xyz.second;

AdditionVector10 = (Line_Locations.parallel.F.xyz.second - Line_Locations.parallel.F.xyz.first)/4;
Board_intersections.F1.xyz = Line_Locations.parallel.F.xyz.first;
Board_intersections.F2.xyz = Board_intersections.F1.xyz + AdditionVector10;
Board_intersections.F3.xyz = Board_intersections.F2.xyz + AdditionVector10;
Board_intersections.F4.xyz = Board_intersections.F3.xyz + AdditionVector10;
Board_intersections.F5.xyz = Line_Locations.parallel.F.xyz.second;

AdditionVector11 = (Line_Locations.parallel.G.xyz.second - Line_Locations.parallel.G.xyz.first)/4;
Board_intersections.G1.xyz = Line_Locations.parallel.G.xyz.first;
Board_intersections.G2.xyz = Board_intersections.G1.xyz + AdditionVector11;
Board_intersections.G3.xyz = Board_intersections.G2.xyz + AdditionVector11;
Board_intersections.G4.xyz = Board_intersections.G3.xyz + AdditionVector11;
Board_intersections.G5.xyz = Line_Locations.parallel.G.xyz.second;

AdditionVector12 = (Line_Locations.parallel.H.xyz.second - Line_Locations.parallel.H.xyz.first)/4;
Board_intersections.H1.xyz = Line_Locations.parallel.H.xyz.first;
Board_intersections.H2.xyz = Board_intersections.H1.xyz + AdditionVector12;
Board_intersections.H3.xyz = Board_intersections.H2.xyz + AdditionVector12;
Board_intersections.H4.xyz = Board_intersections.H3.xyz + AdditionVector12;
Board_intersections.H5.xyz = Line_Locations.parallel.H.xyz.second;

AdditionVector13 = (Line_Locations.parallel.I.xyz.second - Line_Locations.parallel.I.xyz.first)/4;
Board_intersections.I1.xyz = Line_Locations.parallel.I.xyz.first;
Board_intersections.I2.xyz = Board_intersections.I1.xyz + AdditionVector13;
Board_intersections.I3.xyz = Board_intersections.I2.xyz + AdditionVector13;
Board_intersections.I4.xyz = Board_intersections.I3.xyz + AdditionVector13;
Board_intersections.I5.xyz = Line_Locations.parallel.I.xyz.second;