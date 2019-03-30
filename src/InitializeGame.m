function [Gameboard, Gamesettings, Chessboard]  =  InitializeGame(filename_Gameboard, filename_Gamesettings)

temp = load(filename_Gameboard,'Board_Locations');
Gameboard = temp.Gameboard2;
temp = load(filename_Gamesettings, 'Gamesettings');
Gamesettings = temp.Gamesettings;
Chessboard = ResetChessboard();

%[Gameboard, Gamesettings, Chessboard]  =  InitializeGame('Board_Locations', 'Gamesettings')