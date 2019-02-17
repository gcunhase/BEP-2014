%% Dilation
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img1.bmp');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

radius1 = 1;
img1 = dilation(mat, radius1);
radius2 = 2;
img2 = dilation(mat, radius2);
radius3 = 5;
img3 = dilation(mat, radius3);

figDilation = figure('name','Morphology: Dilation');
figDilation, subplot(2,2,1), imshow(mat), title('Original');
figDilation, subplot(2,2,2), imshow(img1), title(strcat('Dilated, radius = ', num2str(radius1)));
figDilation, subplot(2,2,3), imshow(img2), title(strcat('Dilated, radius = ', num2str(radius2)));
figDilation, subplot(2,2,4), imshow(img3), title(strcat('Dilated, radius = ', num2str(radius3)));

%% Erosion
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'noisy image.bmp');
mat = imread(filename);

radius1 = 1;
img1 = erosion(mat, radius1);
radius2 = 2;
img2 = erosion(mat, radius2);
radius3 = 5;
img3 = erosion(mat, radius3);

figErosion = figure('name','Morphology: Erosion');
figErosion, subplot(2,2,1), imshow(mat), title('Original');
figErosion, subplot(2,2,2), imshow(img1), title(strcat('Eroded, radius = ', num2str(radius1)));
figErosion, subplot(2,2,3), imshow(img2), title(strcat('Eroded, radius = ', num2str(radius2)));
figErosion, subplot(2,2,4), imshow(img3), title(strcat('Eroded, radius = ', num2str(radius3)));

%% Opening
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'noisy image.bmp');
mat = imread(filename);

radius1 = 1;
img1 = opening(mat, radius1);
radius2 = 2;
img2 = opening(mat, radius2);
radius3 = 5;
img3 = opening(mat, radius3);

figOpening = figure('name','Morphology: Opening');
figOpening, subplot(2,2,1), imshow(mat), title('Original');
figOpening, subplot(2,2,2), imshow(img1), title(strcat('Opened, radius = ', num2str(radius1)));
figOpening, subplot(2,2,3), imshow(img2), title(strcat('Opened, radius = ', num2str(radius2)));
figOpening, subplot(2,2,4), imshow(img3), title(strcat('Opened, radius = ', num2str(radius3)));

%% Closing
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img2.bmp');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

radius1 = 1;
img1 = closing(mat, radius1);
radius2 = 2;
img2 = closing(mat, radius2);
radius3 = 5;
img3 = closing(mat, radius3);

figClosing = figure('name','Morphology: Closing');
figClosing, subplot(2,2,1), imshow(mat), title('Original');
figClosing, subplot(2,2,2), imshow(img1), title(strcat('Closed, radius = ', num2str(radius1)));
figClosing, subplot(2,2,3), imshow(img2), title(strcat('Closed, radius = ', num2str(radius2)));
figClosing, subplot(2,2,4), imshow(img3), title(strcat('Closed, radius = ', num2str(radius3)));
