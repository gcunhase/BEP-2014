%% Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'TestEdge.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%% Sobel
size = 3;
img1 = edge(mat, size, 'sobel', 'x');
img2 = edge(mat, size, 'sobel', 'y');
img3 = edge(edge(mat, size, 'sobel', 'x'), size, 'sobel', 'y');

figSobel = figure('name','Sobel');
figSobel, subplot(2,2,1), imshow(mat), title('Original');
figSobel, subplot(2,2,2), imshow(img1), title(strcat([num2str(size), ' x ', num2str(size), ', x']));
figSobel, subplot(2,2,3), imshow(img2), title(strcat([num2str(size), ' x ', num2str(size), ', y']));
figSobel, subplot(2,2,4), imshow(img3), title(strcat([num2str(size), ' x ', num2str(size), ', x+y']));

%% Prewitt
size = 3;
img1 = edge(mat, size, 'prewitt', 'x');
img2 = edge(mat, size, 'prewitt', 'y');
img3 = edge(edge(mat, size, 'prewitt', 'x'), size, 'prewitt', 'y');

figPrewitt = figure('name','Prewitt');
figPrewitt, subplot(2,2,1), imshow(mat), title('Original');
figPrewitt, subplot(2,2,2), imshow(img1), title(strcat([num2str(size), ' x ', num2str(size), ', x']));
figPrewitt, subplot(2,2,3), imshow(img2), title(strcat([num2str(size), ' x ', num2str(size), ', y']));
figPrewitt, subplot(2,2,4), imshow(img3), title(strcat([num2str(size), ' x ', num2str(size), ', x+y']));

%% Roberts
size = 3;
img1 = edge(mat, size, 'roberts', 'x');
img2 = edge(mat, size, 'roberts', 'y');
img3 = edge(edge(mat, size, 'roberts', 'x'), size, 'roberts', 'y');

figRoberts = figure('name','Roberts');
figRoberts, subplot(2,2,1), imshow(mat), title('Original');
figRoberts, subplot(2,2,2), imshow(img1), title(strcat([num2str(size), ' x ', num2str(size), ', x']));
figRoberts, subplot(2,2,3), imshow(img2), title(strcat([num2str(size), ' x ', num2str(size), ', y']));
figRoberts, subplot(2,2,4), imshow(img3), title(strcat([num2str(size), ' x ', num2str(size), ', x+y']));

%% Orientation
size = 3;
[img1, img2, img3] = orientation(mat, size);

figOrientation = figure('name','Orientation');
figOrientation, subplot(2,2,1), imshow(mat), title('Original');
figOrientation, subplot(2,2,2), imshow(img1), title(strcat([num2str(size), ' x ', num2str(size)]));
figOrientation, subplot(2,2,3), imshow(img2), title(strcat([num2str(size), ' x ', num2str(size)]));
figOrientation, subplot(2,2,4), imshow(img3), title(strcat([num2str(size), ' x ', num2str(size)]));

%% Highboost-spatial
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'TestEdge2.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

c1 = 1;
[imgHighpass, imgHighboost1] = highboost(mat, c1);
c2 = 2;
[imgHighpass, imgHighboost2] = highboost(mat, c2);

figHighboost = figure('name','Highboost');
figHighboost, subplot(2,2,1), imshow(mat), title('Original');
figHighboost, subplot(2,2,2), imshow(imgHighpass), title('Highpass'); 
figHighboost, subplot(2,2,3), imshow(imgHighboost1), title(strcat(['Highboost, c = ', num2str(c1)]));
figHighboost, subplot(2,2,4), imshow(imgHighboost2), title(strcat(['Highboost, c = ', num2str(c2)]));