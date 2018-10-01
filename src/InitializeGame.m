function [Gameboard, Gamesettings, Chessboard]  =  InitializeGame(filename_Gameboard, filename_Gamesettings)

temp = load(filename_Gameboard,'Gameboard2');
Gameboard = temp.Gameboard2;
temp = load(filename_Gamesettings, 'Gamesettings');
Gamesettings = temp.Gamesettings;
Chessboard = ResetChessboard();




