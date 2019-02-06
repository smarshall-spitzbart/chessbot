%Detects location of chess piece after it has been placed and gripper has
%been released (see MovePawn function)

%Setting up webcam, will need to be moved to separate function, possibly
%InitializeGame function??%

%use delete(cam) in command line if already registered
cam = webcam('HD Pro Webcam C920');
%cam.FocusMode = 'auto';
cam.FocusMode = 'manual';
cam.Focus = 0;
I = snapshot(cam);

%Detect board corners

[imagePoints,boardSize,imagesUsed] = detectCheckerboardPoints(I);%,'MinCornerMetric', 0.14);

%Plot for board detection testing purposes
imshow(I)
hold on
plot(imagePoints(:, 1, 1, 1),imagePoints(:, 2, 1, 1),'g*','MarkerSize',10);

% %Detect Chess piece Dots
% 
% Red = I(:,:,1);
% Green = I(:,:,2);
% Blue = I(:,:,3);
% 
% %Command used to display individual pixel colors (color adjustment purposes%
% %a = impixel(I)
% 
% %define color levels for each sticker type
% outputB = Red > 100 & Red < 160 & Green > 170 & Green < 210 & Blue > 230 & Blue < 260;
% outputR = Red > 125 & Red < 210 & Green > 20 & Green < 95 & Blue > 35 & Blue < 130;
% 
% %cropping tool
% %[J, rect] = imcrop(I);
% 
% %Set cropping of image if needed
% %Rcrop = imcrop(outputR,[2318 1107 804 870]); %[xmin ymin width height]
% 
% %filter images
% outputB2 = imfill(outputB,'holes');
% outputB3 = bwmorph(outputB2,'dilate',3);
% 
% outputR2 = imfill(Rcrop,'holes');
% outputR3 = bwmorph(outputR2,'dilate',10);
% 
% %figure(1)
% %imshow(I)
% 
% %shows BW outline for red layer (can use for blue layer too)
% %figure(2)
% %imshow(outputR3)
% 
% %figure(3)
% %imshow(I)
% 
% %Caculate/display centroids for each sticker type
% statsB = regionprops(outputB3);
% statsR = regionprops(outputR3);
% 
% centroidsB = cat(1, statsB.Centroid);
% centroidsR = cat(1, statsR.Centroid);
% hold on
% 
% %Correct for cropping of red channel (if needed)
% centroidsR(:,1) = centroidsR(:,1) + 2318;
% centroidsR(:,2) = centroidsR(:,2) + 1107;
% 
% %plot(centroidsB(:, 1),centroidsB(:, 2), 'w*','MarkerSize',20)
% %plot(centroidsR(:, 1),centroidsR(:, 2), 'g*','MarkerSize',20)
% 
% %Display distance of chess corners to board corners
% %Note that MATLAB indexed the red and blue points differently
% 
% %Use this test to figure out indexing of points
% %plot(centroidsB(3, 1),centroidsB(3, 2), 'w*','MarkerSize',20)
% %plot(centroidsR(4, 1),centroidsR(4, 2), 'g*','MarkerSize',20)
% 
% %Top left points
% blue_point_1 = [centroidsB(2,1); centroidsB(2,1)];
% red_point_1 = [centroidsR(1,1); centroidsR(2,1)];
% top_left_dist = norm(blue_point_1 - red_point_1)
% 
% %Bottom left points
% blue_point_2 = [centroidsB(1,1); centroidsB(1,2)];
% red_point_2 = [centroidsR(2,1); centroidsR(2,2)];
% bottom_left_dist = norm(blue_point_2 - red_point_2)
% 
% %Bottom right points
% blue_point_3 = [centroidsB(4,1); centroidsB(4,2)];
% red_point_3 = [centroidsR(3,1); centroidsR(3,2)];
% bottom_right_dist = norm(blue_point_3 - red_point_3)
% 
% %Top right points
% blue_point_4 = [centroidsB(3,1); centroidsB(3,2)];
% red_point_4 = [centroidsR(4,1); centroidsR(4,2)];
% top_right_dist = norm(blue_point_4 - red_point_4)


