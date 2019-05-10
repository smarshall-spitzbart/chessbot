%This function sets everything up for a new game. 

function [BoardLocations, Gamesettings, Chessboard]  =  InitializeGame(filename_BoardLocations, filename_Gamesettings)

%This is structure that contains the xyz locations of the chess squares in
%reference to the robot itself. It labels this struct as 'BoardLocations'. 
temp = load(filename_BoardLocations,'Board_Locations');
BoardLocations = temp.Board_Locations;

%This is a matrix that contains the diameter (Column 1) and height (Column
%2) for each piece. Each row corresponds to a different piece. (1-Rook,
%2-Knight,3-Bishop,4-King,5-Queen,and 6-Pawn) 
temp = load(filename_Gamesettings, 'Gamesettings');
Gamesettings = temp.Gamesettings;

%This is a structure that contains which pieces are in which squares as the
%game progresses. It is constantly updated and each square has fields for
%color(1-White, 2-Black) and piece(1-Rook,2-Knight,3-Bishop,4-King,5-Queen,
%and 6-Pawn)
Chessboard = ResetChessboard();
end

%[BoardLocations, Gamesettings, Chessboard]  =  InitializeGame('Board_Locations', 'Gamesettings')