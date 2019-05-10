% Duplicate of CorrectPosition Function, optimized for board position D3
% for testing purposes

%%

% Setting up webcam, will need to be moved to separate function, possibly
% InitializeGame function

% use delete(cam) in command line if already registered
cam = webcam('HD Pro Webcam C920');

% cam.FocusMode = 'auto';
cam.FocusMode = 'manual';
cam.Focus = 15; 
% NOTE: Closest camera focus is not 0, it is 125, medium range is around 30
% 05-25 is good focus for current elevated plane in movepawn
I = snapshot(cam);
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
outputR = Red > 120 & Red < 150 & Green > 10 & Green < 40 & Blue > 30 & Blue < 50;

% cropping tool
% [J, rect] = imcrop(I);

% Set cropping of image to define the piece we care about
% Rcrop = imcrop(outputR,[2318 1107 804 870]); %[xmin ymin width height]

% filter image
outputR2 = imfill(outputR,'holes');
outputR3 = bwmorph(outputR2,'dilate',3);

% Caculate/display centroids for each sticker type
statsR = regionprops(outputR3);

centroidsR = cat(1, statsR.Centroid);

% Correct for cropping of red channel (if needed)
% centroidsR(:,1) = centroidsR(:,1) + 2318;
% centroidsR(:,2) = centroidsR(:,2) + 1107;

% Define top left sticker centroid
StickerTL = [centroidsR(1,1); centroidsR(1,2)];

% Define top right sticker centroid
StickerTR = [centroidsR(2,1); centroidsR(2,2)];

hold on
plot(StickerTL(1),StickerTL(2),'r*')
plot(StickerTR(1),StickerTR(2),'r*')
%% Calculate distances

% Define approprite top left board corner
% BoardTL = [intersect_x(12);intersect_y(12)];

% Define appropriate top right board corner
% BoardTR = [intersect_x(19);intersect_y(19)];

% Calculate distances from sticker centroid to appropriate corners

% TLDIST = norm(BoardTL - StickerTL)
% TRDIST = norm(BoardTR - StickerTR)

%% Calculating distances of chess piece from predefined lines
% % to plot line in front of D3 see below
% plot(xcompstore(1,:),ycompstore(1,:),'g*')
% 
% % to plot line to right of D3 see below
% plot(xcompstore(8,:),ycompstore(8,:),'b*')
% 
% % Obtains distances from sticker centers to board lines
% for i = 1:length(xcompstore)
%     dist1(i) = sqrt((xcompstore(1,i)-StickerTR(1))^2+(ycompstore(1,i)-StickerTR(2))^2);
% end
% TR_topline = min(dist1)
% 
% for i = 1:length(xcompstore)
%     dist2(i) = sqrt((xcompstore(1,i)-StickerTL(1))^2+(ycompstore(1,i)-StickerTL(2))^2);
% end
% TL_topline = min(dist2)
% 
% for i = 1:length(xcompstore)
%     dist3(i) = sqrt((xcompstore(8,i)-StickerTR(1))^2+(ycompstore(8,i)-StickerTR(2))^2);
% end
% TR_rightline = min(dist3)
% 
% for i = 1:length(xcompstore)
%     dist4(i) = sqrt((xcompstore(8,i)-StickerTL(1))^2+(ycompstore(8,i)-StickerTL(2))^2);
% end
% TL_rightline = min(dist4)

%% where to go next?

% put intersection code only within the lines that we care about. Then we
% will have only the intersections we care about. Then use pixel iteration
% and position iteration to define the chess piece's 'real' position within XYZPR 
