%% Settings

filename = 'dog';
fmt = 'png';
matRGB = imread(filename, fmt);
mat = rgb2gray(matRGB); %mat2gray

matHist = getHistogram(mat);
matCdf = getCdf(mat);

%% Sliding

[slidingImg, slidingHist, slidingCdf] = slideImage(mat, 30);
[slidingImg150, slidingHist150, slidingCdf150] = slideImage(mat, 150);

figSliding = figure('name','Sliding');
figSliding, subplot(3,3,1), imshow(mat), title('Original');
figSliding, subplot(3,3,2), bar(matHist), xlim([1, 256]), grid on, title('Histogram');
figSliding, subplot(3,3,3), bar(matCdf), xlim([1, 256]), grid on, title('CDF');
figSliding, subplot(3,3,4), imshow(slidingImg), title('Slided Image - 30');
figSliding, subplot(3,3,5), bar(slidingHist), xlim([1, 256]), grid on, title('Histogram');
figSliding, subplot(3,3,6), bar(slidingCdf), xlim([1, 256]), grid on, title('CDF');
figSliding, subplot(3,3,7), imshow(slidingImg150), title('Slided Image - 150');
figSliding, subplot(3,3,8), bar(slidingHist150), xlim([1, 256]), grid on, title('Histogram');
figSliding, subplot(3,3,9), bar(slidingCdf150), xlim([1, 256]), grid on, title('CDF');

%% Stretching

[stretchingImg, stretchingHist, stretchingCdf] = stretchImage(mat, [0 255]);

figStretching = figure('name','Stretching');
figStretching, subplot(2,3,1), imshow(mat), title('Original');
figStretching, subplot(2,3,2), bar(matHist), xlim([1, 256]), grid on, title('Histogram');
figStretching, subplot(2,3,3), bar(matCdf), xlim([1, 256]), grid on, title('CDF');
figStretching, subplot(2,3,4), imshow(stretchingImg), title('Stretched Image');
figStretching, subplot(2,3,5), bar(stretchingHist), xlim([1, 256]), grid on, title('Histogram');
figStretching, subplot(2,3,6), bar(stretchingCdf), xlim([1, 256]), grid on, title('CDF');

%% Shrink

[shrinkImg, shrinkHist, shrinkCdf] = stretchImage(mat, [80 230]);

figStretching = figure('name','Shrink');
figStretching, subplot(2,3,1), imshow(mat), title('Original');
figStretching, subplot(2,3,2), bar(matHist), xlim([1, 256]), grid on, title('Histogram');
figStretching, subplot(2,3,3), bar(matCdf), xlim([1, 256]), grid on, title('CDF');
figStretching, subplot(2,3,4), imshow(shrinkImg), title('Shrinked Image');
figStretching, subplot(2,3,5), bar(shrinkHist), xlim([1, 256]), grid on, title('Histogram');
figStretching, subplot(2,3,6), bar(shrinkCdf), xlim([1, 256]), grid on, title('CDF');

