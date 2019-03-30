% Detects location of chess piece after it has been placed and gripper has
% been released (see MovePawn function)

function [confirm] = CorrectPosition(new,Chessboard,Gameboard,Gamesettings)

% Setting up webcam, will need to be moved to separate function, possibly
% InitializeGame function

% use delete(cam) in command line if already registered
cam = webcam('HD Pro Webcam C920');

cam.FocusMode = 'auto';
% cam.FocusMode = 'manual';
% cam.Focus = 10; 

% NOTE: Closest camera focus is not 0, it is 125, medium range is around 30
% 10 or 15 is good focus for current elevated plane in movepawn
I = snapshot(cam);
figure(1), imshow(I)

%% Detect board corners

% Detect square corners using hough transform
Igray = rgb2gray(I);
Iedges = edge(Igray,'Sobel');

% Original line image
figure(2), imshow(Iedges)
hold on

% Detect Lines by hough transform
[H, t, r] = hough(Iedges, 'RhoResolution',1,'Theta',-90:0.01:89.99); % sets rho and theta resolution
peaks = houghpeaks(H, 12); % 8 is the number of lines needed in the image
lines = houghlines(Iedges, t, r, peaks, 'FillGap', 100);

% Plot lines for visualization
for i = 1:length(lines)
    plot([lines(i).point1(1) lines(i).point2(1)],[lines(i).point1(2) lines(i).point2(2)], 'r-');
end

% Detect intersection points from each line
% First denote a 1 for each pixel that is a part of any one line
% Any pixel that has an end sum of 2 is an intersection pixel
Sum = zeros(size(Iedges));
for i = 1:length(lines)
    x1 = lines(i).point1(1);
    y1 = lines(i).point1(2);
    x2 = lines(i).point2(1);
    y2 = lines(i).point2(2);
    
        xcomp = linspace(x1, x2, max([abs(x2-x1),abs(y2-y1)]));
        ycomp = interp1([x1 x2],[y1 y2], xcomp);
        xcomp = round(xcomp);
        ycomp = round(ycomp);
        
        linInd = sub2ind(size(Iedges), ycomp, xcomp);
        Sum(linInd) = Sum(linInd) + 1;      
end
[intersect_y,intersect_x] = find(Sum == 2);
plot(intersect_x,intersect_y, 'g*');

%% Detect Chess piece Dots

Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);

% Command used to display individual pixel colors (color adjustment
% purposes)
% a = impixel(I)

% define color levels for red stickers (needs adjustments for different
% rooms/lighting/robot arm height)
outputR = Red > 120 & Red < 150 & Green > 10 & Green < 40 & Blue > 30 & Blue < 50;

% cropping tool
% [J, rect] = imcrop(I);

% Set cropping of image if needed
% Rcrop = imcrop(outputR,[2318 1107 804 870]); %[xmin ymin width height]

% filter image
outputR2 = imfill(outputR,'holes');
outputR3 = bwmorph(outputR2,'dilate',3);

% Caculate/display centroids for each sticker type
statsR = regionprops(outputR3);

centroidsR = cat(1, statsR.Centroid);
hold on

% Correct for cropping of red channel (if needed)
% centroidsR(:,1) = centroidsR(:,1) + 2318;
% centroidsR(:,2) = centroidsR(:,2) + 1107;

%% Calculate distances

% Define top left sticker centroid
StickerTL = [centroidsR(1,1); centroidsR(1,2)];

% Define top right sticker centroid
StickerTR = [centroidsR(2,1); centroidsR(2,2)];

% Current config = arbitrary, need to define heights and board spots

% Define approprite top left board corner
BoardTL = [intersect_x(12);intersect_y(12)];

% Define appropriate top right board corner
BoardTR = [intersect_x(19);intersect_y(19)];

% Calculate distances from sticker centroid to appropriate corners

TLDIST = norm(BoardTL - StickerTL)
TRDIST = norm(BoardTR - StickerTR)

plot(StickerTL(1),StickerTL(2),'g*')
plot(StickerTR(1),StickerTR(2),'g*')

% Board corner indexing test % NOTE: board points are indexed starting top
% left, moving downward. But can be funky sometimes
% plot(intersect_x(19),intersect_y(19), 'm*','MarkerSize',20);

confirm=true


