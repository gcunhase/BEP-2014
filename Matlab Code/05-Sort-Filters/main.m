%% Settings Sort
vector = [10 4 5 8 2 9 1];

%% Sort
%Bubble
sortedBubble = bubbleSort(vector)

%Quicksort
s = max(size(vector));
sortedQuick = quickSort(vector, 1, s)

%Insertion
sortedInsertion = insertionSort(vector)

%% Filters

%% Filter: Average
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
img1 = filter(mat, size1, 'average');
size2 = 5;
img2 = filter(mat, size2, 'average');
size3 = 7;
img3 = filter(mat, size3, 'average');

figAverage = figure('name','Average');
figAverage, subplot(2,2,1), imshow(mat), title('Original');
figAverage, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1)]));
figAverage, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size2)]));
figAverage, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size3)]));

%% Filter: Median
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter2.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
img1 = filter(mat, size1, 'median');
size2 = 5;
img2 = filter(mat, size2, 'median');
size3 = 7;
img3 = filter(mat, size3, 'median');

figMedian = figure('name','Median');
figMedian, subplot(2,2,1), imshow(mat), title('Original');
figMedian, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1)]));
figMedian, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size2)]));
figMedian, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size3)]));

%% Filter: Max
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter2.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
img1 = filter(mat, size1, 'max');
size2 = 5;
img2 = filter(mat, size2, 'max');
size3 = 7;
img3 = filter(mat, size3, 'max');

figMax = figure('name','Max');
figMax, subplot(2,2,1), imshow(mat), title('Original');
figMax, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1)]));
figMax, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size2)]));
figMax, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size3)]));

%% Filter: Min
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter3.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
img1 = filter(mat, size1, 'min');
size2 = 5;
img2 = filter(mat, size2, 'min');
size3 = 7;
img3 = filter(mat, size3, 'min');

figMin = figure('name','Min');
figMin, subplot(2,2,1), imshow(mat), title('Original');
figMin, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1)]));
figMin, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size2)]));
figMin, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size3)]));

%% Filter: Midpoint
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter1.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
img1 = filter(mat, size1, 'midpoint');
size2 = 5;
img2 = filter(mat, size2, 'midpoint');
size3 = 7;
img3 = filter(mat, size3, 'midpoint');

figMidpoint = figure('name','Midpoint');
figMidpoint, subplot(2,2,1), imshow(mat), title('Original');
figMidpoint, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1)]));
figMidpoint, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size2)]));
figMidpoint, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size3)]));

%% Filter: Alpha-trimmed Mean
%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testFilter2.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%Algorithm
size1 = 3;
alpha1 = 0;
img1 = filter(mat, size1, 'alpha-trimmed', alpha1);
alpha2 = 2;
img2 = filter(mat, size1, 'alpha-trimmed', alpha2);
alpha3 = 4;
img3 = filter(mat, size2, 'alpha-trimmed', alpha3);

figAlphaT = figure('name','Alpha-trimmed Mean');
figAlphaT, subplot(2,2,1), imshow(mat), title('Original');
figAlphaT, subplot(2,2,2), imshow(img1), title(strcat([num2str(size1), ' x ', num2str(size1), ', alpha = ', num2str(alpha1)]));
figAlphaT, subplot(2,2,3), imshow(img2), title(strcat([num2str(size2), ' x ', num2str(size1), ', alpha = ', num2str(alpha2)]));
figAlphaT, subplot(2,2,4), imshow(img3), title(strcat([num2str(size3), ' x ', num2str(size1), ', alpha = ', num2str(alpha3)]));
