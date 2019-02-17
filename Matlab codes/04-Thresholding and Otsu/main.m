%% Settings
filename = 'IMAGE256';
fmt = 'png';
mat = imread(filename, fmt);

%% Bin Static

T = [20, 100, 200];
img1 = staticThreshold(mat, T(1));
img2 = staticThreshold(mat, T(2));
img3 = staticThreshold(mat, T(3));

figStatic = figure('name','Static');
figStatic, subplot(2,2,1), imshow(mat), title('Original');
figStatic, subplot(2,2,2), imshow(img1), title('Threshold: 20');
figStatic, subplot(2,2,3), imshow(img2), title('Threshold: 100');
figStatic, subplot(2,2,4), imshow(img3), title('Threshold: 200');

%% P-tile

p = [2, 3, 7];
img1 = pTileThreshold(mat, p(1));
img2 = pTileThreshold(mat, p(2));
img3 = pTileThreshold(mat, p(3));

figPtile = figure('name','P-tile');
figPtile, subplot(2,2,1), imshow(mat), title('Original');
figPtile, subplot(2,2,2), imshow(img1), title('p = 2');
figPtile, subplot(2,2,3), imshow(img2), title('p = 3');
figPtile, subplot(2,2,4), imshow(img3), title('p = 7');

%% Bin Iterative
[img, T] = iterativeThreshold(mat);
figIterative = figure('name','Iterative');
figIterative, subplot(1,2,1), imshow(mat), title('Original');
figIterative, subplot(1,2,2), imshow(img), title(strcat(['Iterative - T = ', num2str(T)]));

%% Otsu
[img, T] = otsuThreshold(mat);
figOtsu = figure('name','Otsu');
figOtsu, subplot(1,2,1), imshow(mat), title('Original');
figOtsu, subplot(1,2,2), imshow(img), title(strcat(['Otsu - T = ', num2str(T)]));
