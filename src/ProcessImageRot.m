%% Process image function (ROTATION)
% Does not include any robot movement functions, only image processing
% see 'CorrectPositionTEST' for combo of this function and CorrectPosition
function [XYZPRPiece,Slopediff] = ProcessImageRot(Chessboard,Gameboard,Gamesettings,Board_intersections,boardsquare)
% cam needs to be called within function, MATLAB cannot import objects of
% class 'camera'
cam = webcam('HD Pro Webcam C920');
I = snapshot(cam);
% cam.FocusMode = 'auto';
cam.FocusMode = 'manual';
cam.Focus = 15; 
% NOTE: Closest camera focus is not 0, it is 125, medium range is around 30
% 05-25 is good focus for current elevated plane in movepawn
figure(1), imshow(I)

%% Detect relevant edges and corners

% Detect square corners using hough transform
Igray = rgb2gray(I);
Iedges = edge(Igray,'Sobel');

% Original line image
figure(2), imshow(Iedges)
hold on

% Detect Lines by hough transform
[H, t, r] = hough(Iedges, 'RhoResolution',1,'Theta',-90:0.01:89.99); % sets rho and theta resolution
peaks = houghpeaks(H, 10); % 10 is the number of lines needed in the image
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
    if x1 == x2
        ycomp = linspace(y1,y2,length(xcomp));
    else
        ycomp = interp1([x1 x2],[y1 y2], xcomp);
    end
    xcomp = round(xcomp);
    ycomp = round(ycomp);
    
    for n = 1:length(xcomp)
        xcompstore(i,n) = xcomp(n);
        ycompstore(i,n) = ycomp(n);
    end
    
    linInd = sub2ind(size(Iedges), ycomp, xcomp);
    Sum(linInd) = Sum(linInd) + 1;      
end
 [intersect.y.locs,intersect.x.locs] = find(Sum == 2);
 % plot(intersect.x.locs,intersect.y.locs, 'g*');

%% Cropping for line intervals
% cropping tool
% [J, rect] = imcrop(I);

%% Define lines and intersections of interest, use cropping tool above to find intervals
TopLinerangex = [0,640];
TopLinerangey = [119.51,119.51+101.98];

RightLinerangex = [308.51,308.51+98.98];
RightLinerangey = [0,480];

BottomLinerangex = [0,640];
BottomLinerangey = [231.51,231.51+99.98];

LeftLinerangex = [183.51,183.51+133.98];
LeftLinerangey = [0,480];

% Define Topline
Size = size(xcompstore);
FlagTopLine = zeros(Size(1),1);
for i = 1:Size(1)
    for n = 1:Size(2)
        if TopLinerangex(1) < xcompstore(i,n) && xcompstore(i,n)...
                < TopLinerangex(2)...
                && TopLinerangey(1) < ycompstore(i,n) && ycompstore(i,n)...
                    < TopLinerangey(2)...
                && xcompstore(i,n) > 0 && ycompstore(i,n) > 0
            
            FlagTopLine(i) = FlagTopLine(i) + 1;
        else
            FlagTopLine(i) = FlagTopLine(i) - 1;
        end
    end
    if FlagTopLine(i) > 0
        TopLine = [xcompstore(i,:);ycompstore(i,:)];
    end
end

% Define Rightline
FlagRightLine = zeros(Size(1),1);
for i = 1:Size(1)
    for n = 1:Size(2)
        if RightLinerangex(1) < xcompstore(i,n) && xcompstore(i,n)...
                < RightLinerangex(2)...
                && RightLinerangey(1) < ycompstore(i,n)...
                && ycompstore(i,n) < RightLinerangey(2)...
                && xcompstore(i,n) > 0 && ycompstore(i,n) > 0
            
            FlagRightLine(i) = FlagRightLine(i) + 1;
        else
            FlagRightLine(i) = FlagRightLine(i) - 1;
        end
    end
    if FlagRightLine(i) > 0
        RightLine = [xcompstore(i,:);ycompstore(i,:)];
    end
end

% Define Bottomline
FlagBottomLine = zeros(Size(1),1);
for i = 1:Size(1)
    for n = 1:Size(2)
        if BottomLinerangex(1) < xcompstore(i,n) && xcompstore(i,n)...
                < BottomLinerangex(2)...
                && BottomLinerangey(1) < ycompstore(i,n)...
                && ycompstore(i,n) < BottomLinerangey(2)...
                && xcompstore(i,n) > 0 && ycompstore(i,n) > 0
            
            FlagBottomLine(i) = FlagBottomLine(i) + 1;
        else
            FlagBottomLine(i) = FlagBottomLine(i) - 1;
        end
    end
    if FlagBottomLine(i) > 0
        BottomLine = [xcompstore(i,:);ycompstore(i,:)];
    end
end

% Define Leftline
FlagLeftLine = zeros(Size(1),1);
for i = 1:Size(1)
    for n = 1:Size(2)
        if LeftLinerangex(1) < xcompstore(i,n) && xcompstore(i,n)...
                < LeftLinerangex(2)...
                && LeftLinerangey(1) < ycompstore(i,n)...
                && ycompstore(i,n) < LeftLinerangey(2)...
                && xcompstore(i,n) > 0 && ycompstore(i,n) > 0
            
            FlagLeftLine(i) = FlagLeftLine(i) + 1;
        else
            FlagLeftLine(i) = FlagLeftLine(i) - 1;
        end
    end
    if FlagLeftLine(i) > 0
        LeftLine = [xcompstore(i,:);ycompstore(i,:)];
    end
end

% display lines
plot(TopLine(1,:),TopLine(2,:),'w*')
plot(RightLine(1,:),RightLine(2,:),'w*')
plot(BottomLine(1,:),BottomLine(2,:),'w*')
plot(LeftLine(1,:),LeftLine(2,:),'w*')

intersect.ref([1:length(intersect.x.locs)]) = 0;

% Define each relevant intersection
for i = 1:length(TopLine)
    for n = 1:length(intersect.x.locs)
        if [TopLine(1,i),TopLine(2,i)] == [intersect.x.locs(n),intersect.y.locs(n)]
           intersect.ref(n) = intersect.ref(n) + 1.5;
        end
    end
end

for i = 1:length(RightLine)
    for n = 1:length(intersect.x.locs)
        if [RightLine(1,i),RightLine(2,i)] == [intersect.x.locs(n),intersect.y.locs(n)]
           intersect.ref(n) = intersect.ref(n) + 3;
        end
    end
end

for i = 1:length(BottomLine)
    for n = 1:length(intersect.x.locs)
        if [BottomLine(1,i),BottomLine(2,i)] == [intersect.x.locs(n),intersect.y.locs(n)]
           intersect.ref(n) = intersect.ref(n) + 5;
        end
    end
end

for i = 1:length(LeftLine)
    for n = 1:length(intersect.x.locs)
        if [LeftLine(1,i),LeftLine(2,i)] == [intersect.x.locs(n),intersect.y.locs(n)]
           intersect.ref(n) = intersect.ref(n) + 7.5;
        end
    end
end

for i = 1:length(intersect.ref)
    if intersect.ref(i) == 4.5
        IntersectTR = [intersect.x.locs(i),intersect.y.locs(i)];
    elseif intersect.ref(i) == 8
        IntersectBR = [intersect.x.locs(i),intersect.y.locs(i)];
    elseif intersect.ref(i) == 12.5
        IntersectBL = [intersect.x.locs(i),intersect.y.locs(i)];
    elseif intersect.ref(i) == 9
        IntersectTL = [intersect.x.locs(i),intersect.y.locs(i)];
    end
end

plot(IntersectTR(1),IntersectTR(2),'r*','MarkerSize',15)
plot(IntersectBR(1),IntersectBR(2),'r*','MarkerSize',15)
plot(IntersectBL(1),IntersectBL(2),'r*','MarkerSize',15)
plot(IntersectTL(1),IntersectTL(2),'r*','MarkerSize',15)
%% Detect Chess piece Dots

Red = I(:,:,1);
Green = I(:,:,2);
Blue = I(:,:,3);

% Command used to display individual pixel colors (color adjustment
% purposes)
% a = impixel(I)

% define color levels for red stickers (needs adjustments for different
% rooms/lighting/robot arm height)

outputR = Red > 140 & Red < 180 & Green > 20 & Green < 60 & Blue > 30 & Blue < 80;
%prev
%outputR = Red > 120 & Red < 150 & Green > 10 & Green < 40 & Blue > 30 & Blue < 50;

% cropping tool
% [J, rect] = imcrop(I);

% Set cropping of red sticker detection to define the piece we care about
% Note, this cropping only allows for correction within the board square.
% Stickers outside of board square could be for separate peice
Rcrop = imcrop(outputR,[min(IntersectBL(1),IntersectTL(1)),...
    min(IntersectTL(2),IntersectTR(2)), max(IntersectTR(1),IntersectBR(1))...
    - (min(IntersectBL(1),IntersectTL(1))), max(IntersectBR(2),IntersectBL(2))...
    - (min(IntersectTL(2),IntersectTR(2)))]); %[xmin ymin width height]

% filter image
outputR2 = imfill(Rcrop,'holes');
outputR3 = bwmorph(outputR2,'dilate',3);

% Caculate/display centroids for each sticker type
statsR = regionprops(outputR3);

centroidsR = cat(1, statsR.Centroid);

% Correct for cropping of red channel
centroidsR(:,1) = centroidsR(:,1) + min(IntersectBL(1),IntersectTL(1));
centroidsR(:,2) = centroidsR(:,2) + min(IntersectTL(2),IntersectTR(2));

% Define top left sticker centroid
StickerTL = [centroidsR(1,1); centroidsR(1,2)];

% Define top right sticker centroid
StickerTR = [centroidsR(2,1); centroidsR(2,2)];

hold on
plot(StickerTL(1),StickerTL(2),'g*','MarkerSize',20)
plot(StickerTR(1),StickerTR(2),'g*','MarkerSize',20)

%% Define center of piece from two stickers (assume piece is facing forward)

Distvector = [(StickerTR(1) - StickerTL(1));(StickerTR(2) - StickerTL(2))];
slopevector = Distvector / max(Distvector);

% Perpendicular distance from line between two stickers and center of piece is 1 cm (distance may
% change for permanent implementation of stickers)

% pixel/cm conversion rate = 8 pixel/cm

piecedist = 1*(8); %cm*(pixel/cm)

% define center of piece. (perpendicular distance from sticker line to
% center can be edited above)
Piecepixelloc = StickerTL + (1/2)*Distvector + piecedist*[-slopevector(2);slopevector(1)];
plot(Piecepixelloc(1),Piecepixelloc(2),'b*','MarkerSize',20)

%% Find relavent locations of stickers referenced from board corners using bilinear interp

% Define the polygon in pixel cordinates, and each x,y cordinate...
px = [IntersectBL(1), IntersectBR(1), IntersectTR(1), IntersectTL(1)];
py = [IntersectBL(2), IntersectBR(2), IntersectTR(2), IntersectTL(2)];

% Define points to convert to L,M coordinates
Xpixel = [StickerTL(1), StickerTR(1), Piecepixelloc(1)];
Ypixel = [StickerTL(2), StickerTR(2), Piecepixelloc(2)];

% Y transformation
imageheight = 640;
Ypixel = imageheight - Ypixel;
py = imageheight - py;

% Assume a bilinear mapping function, solve for alpha and beta coefficients
A = [1 0 0 0;1 1 0 0;1 1 1 1;1 0 1 0];
a = A\px';
b = A\py';

% Solving for L and M cordinates, we need quadratic equation coefficients,
% aa*mm^2+bb*m+cc=0
aa = a(4)*b(3) - a(3)*b(4);
for i = 1:length(Xpixel)
    bb = a(4)*b(1) -a(1)*b(4) + a(2)*b(3) - a(3)*b(2) + Xpixel(i)*b(4) - Ypixel(i)*a(4);
    cc = a(2)*b(1) -a(1)*b(2) + Xpixel(i)*b(2) - Ypixel(i)*a(2);
    
    % Compute m = (-b+sqrt(b^2-4ac))/(2a)
    det = sqrt(bb*bb - 4*aa*cc);
    M(i) = (-bb+det)/(2*aa);
    % Compute L
    L(i) = (Xpixel(i)-a(1)-a(3)*M(i))/(a(2)+a(4)*M(i));
end

%% Define XYZPR Locations of stickers from L,M coordinates

% Define XYZPR of relavent board corners. For indexing of board coners see
% 'InterpolatingLines' function

BLcornerindex = boardsquare;

TLcornerindex = boardsquare;
TLcornerindex(2) = TLcornerindex(2) + 1;

Alphabet = 'ABCDEFGHI';
Letters = Alphabet([1:9]);

BRcornerindex = boardsquare;
for i = 1:length(Letters)
    if BRcornerindex(1) == Letters(i)
        BRcornerindex(1) = Letters(i + 1);
        break
    end
end

TRcornerindex = BRcornerindex;
TRcornerindex(2) = TRcornerindex(2) + 1;

XYZPRBL = Board_intersections.(BLcornerindex).xyz; % XYZPR BottomLeft
XYZPRTL = Board_intersections.(TLcornerindex).xyz; % XYZPR TopLeft
XYZPRBR = Board_intersections.(BRcornerindex).xyz; % XYZPR BottomRight
XYZPRTR = Board_intersections.(TRcornerindex).xyz; % XYZPR TopRight

% Use bilinear interp coordinates to define XYZPR of stickers
StickerTL_LM = [L(1),M(1)]
StickerTR_LM = [L(2),M(2)]
Piece_LM = [L(3),M(3)]


for i = 1:5
    XYZPRSTICKERTL(i) = [1-L(1),L(1)-0]*[XYZPRBL(i),XYZPRTL(i);XYZPRBR(i),XYZPRTR(i)]*[1-M(1);M(1)-0];
end

for i = 1:5
    XYZPRSTICKERTR(i) = [1-L(2),L(2)-0]*[XYZPRBL(i),XYZPRTL(i);XYZPRBR(i),XYZPRTR(i)]*[1-M(2);M(2)-0];
end

for i = 1:5
    XYZPRPiece(i) = [1-L(3),L(3)-0]*[XYZPRBL(i),XYZPRTL(i);XYZPRBR(i),XYZPRTR(i)]*[1-M(3);M(3)-0];
end

% Find slopes, y axis is flipped here from MATLAB indexing
SlopeStickers = -(StickerTR(2) - StickerTL(2))/(StickerTR(1) - StickerTL(1));
SlopeCorners = -(IntersectTR(2) - IntersectTL(2))/(IntersectTR(1) - IntersectTL(1));

% Slope difference calculation
Slopediff = SlopeCorners - SlopeStickers;