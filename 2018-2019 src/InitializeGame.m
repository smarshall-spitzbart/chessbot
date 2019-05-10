function [Gameboard, Gamesettings, Chessboard, Board_intersections]  =  InitializeGame(filename_Gameboard, filename_Gamesettings)
load('Board_Locations.mat');

temp = load(filename_Gameboard,'Board_Locations');
Gameboard = temp.Board_Locations;
temp = load(filename_Gamesettings, 'Gamesettings');
Gamesettings = temp.Gamesettings;
Chessboard = ResetChessboard();
Board_intersections = InterpolatingLines();

%[Gameboard, Gamesettings, Chessboard, Board_intersections]  =  InitializeGame('Board_Locations', 'Gamesettings')