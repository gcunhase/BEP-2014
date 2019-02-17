%% Zoom-in
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'small image2.png');
mat = imread(filename);

zoomFactor = 10; %1 pixel in original picture -> zoomFactor^2 pixels in new picture
img = zoomIn(mat, zoomFactor);

figureZoomInOriginal = figure('name','Geometry: Zoom-in (Original)');
figureZoomInOriginal, imshow(mat);

figureZoomInZoomed = figure('name','Geometry: Zoom-in (Zoomed)');
figureZoomInZoomed, imshow(img);

%% Zoom-out
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img4.bmp');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

zoomFactor = 10; %1 pixel in original picture -> zoomFactor^2 pixels in new picture
img = zoomOut(mat, zoomFactor);

figureZoomOutOriginal = figure('name','Geometry: Zoom-out (Original)');
figureZoomOutOriginal, imshow(mat);

figureZoomOutZoomed = figure('name','Geometry: Zoom-out (Zoomed)');
figureZoomOutZoomed, imshow(img);

%% Rotation
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img4.bmp');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

theta1 = pi/4;
img1 = rotate(mat, theta1);
theta2 = pi/2;
img2 = rotate(mat, theta2);
theta3 = 3*pi/4;
img3 = rotate(mat, theta3);

figRotate = figure('name','Geometry: Rotation');
figRotate, subplot(2,2,1), imshow(mat), title('Original');
figRotate, subplot(2,2,2), imshow(img1), title(strcat('Rotated, theta = ', num2str(rad2deg(theta1))));
figRotate, subplot(2,2,3), imshow(img2), title(strcat('Rotated, theta = ', num2str(rad2deg(theta2))));
figRotate, subplot(2,2,4), imshow(img3), title(strcat('Rotated, theta = ', num2str(rad2deg(theta3))));

%% Reflect
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img4.bmp');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

img1 = reflect(mat, 'x');
img2 = reflect(mat, 'y');
img3 = reflect(mat, 'x');
img3 = reflect(img3, 'y');

figReflect = figure('name','Geometry: Reflect');
figReflect, subplot(2,2,1), imshow(mat), title('Original');
figReflect, subplot(2,2,2), imshow(img1), title('Reflect on x');
figReflect, subplot(2,2,3), imshow(img2), title('Reflect on y');
figReflect, subplot(2,2,4), imshow(img3), title('Reflect on x and y');
