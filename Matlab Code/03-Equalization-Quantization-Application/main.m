%% Equalize

%%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'testImage3');
fmt = 'png';
matRGB = imread(filename, fmt);
mat = rgb2gray(matRGB); %mat2gray

matHist = getHistogram(mat);
matCdf = getCdf(mat);

%%Algorithm
[eqImg, eqHist, eqCdf] = equalizeImage(mat);

figEq = figure('name','Equalization');
figEq, subplot(2,3,1), imshow(mat), title('Original');
figEq, subplot(2,3,2), bar(matHist), xlim([1, 256]), grid on, title('Histogram');
figEq, subplot(2,3,3), bar(matCdf), xlim([1, 256]), grid on, title('CDF');
figEq, subplot(2,3,4), imshow(eqImg), title('Equalized Image');
figEq, subplot(2,3,5), bar(eqHist), xlim([1, 256]), grid on, title('Histogram');
figEq, subplot(2,3,6), bar(eqCdf), xlim([1, 256]), grid on, title('CDF');

%% Quantization
%%Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'flower');
fmt = 'png';
matRGB = imread(filename, fmt);
mat = rgb2gray(matRGB);

matHist = getHistogram(mat);
matCdf = getCdf(mat);

%%Algorithm
[quantImg, quantHist, quantCdf] = imageQuantization(mat, 64);
[quantImg8, quantHist8, quantCdf8] = imageQuantization(mat, 8);

figQuant = figure('name','Quantization');
figQuant, subplot(3,3,1), imshow(mat), title('Original');
figQuant, subplot(3,3,2), bar(matHist), xlim([1, 256]), grid on, title('Histogram');
figQuant, subplot(3,3,3), bar(matCdf), xlim([1, 256]), grid on, title('CDF');
figQuant, subplot(3,3,4), imshow(quantImg), title('Quantized Image - 64');
figQuant, subplot(3,3,5), bar(quantHist), xlim([1, 256]), grid on, title('Histogram');
figQuant, subplot(3,3,6), bar(quantCdf), xlim([1, 256]), grid on, title('CDF');
figQuant, subplot(3,3,7), imshow(quantImg8), title('Quantized Image - 8');
figQuant, subplot(3,3,8), bar(quantHist8), xlim([1, 256]), grid on, title('Histogram');
figQuant, subplot(3,3,9), bar(quantCdf8), xlim([1, 256]), grid on, title('CDF');

%% Application

%%Settings
filename = 'images'; %2, 3, 4
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename1 = strcat(filename, 'testImage3');
fmt = 'png';
matRGB = imread(filename1, fmt);
mat = rgb2gray(matRGB);
[height, width] = size(mat);

mat1 = mat;
mat1(:,1:round(width/2)) = stretchImage(mat(:,1:round(width/2)), [0 255]);
mat1 = [mat, mat1];

filename2 = strcat(filename, 'couple2');
fmt = 'png';
matRGB = imread(filename2, fmt);
mat = rgb2gray(matRGB);
[height, width] = size(mat);

mat2 = mat;
mat2(:,round((2/3)*width):width) = equalizeImage(mat(:,round((2/3)*width):width));
mat2 = [mat, mat2];

filename3 = strcat(filename, 'couple3');
fmt = 'png';
matRGB = imread(filenam3, fmt);
mat = rgb2gray(matRGB);
[height, width] = size(mat);

mat3 = mat;
mat3(:,round(width/2):width) = equalizeImage(mat(:,round(width/2):width));
mat3 = [mat, mat3];

filename4 = strcat(filename, 'couple4');
fmt = 'png';
matRGB = imread(filename4, fmt);
mat = rgb2gray(matRGB);
[height, width] = size(mat);

mat4 = mat;
mat4(:,1:round(width/2)) = stretchImage(mat(:,1:round(width/2)), [0 255]);
mat4 = [mat, mat4];

%%Algorithm
figApp = figure('name','Application');
figApp, subplot(2,2,1), imshow(mat1), title('Stretching 1');
figApp, subplot(2,2,2), imshow(mat2), title('Equalize 2');
figApp, subplot(2,2,3), imshow(mat3), title('Equalize 3');
figApp, subplot(2,2,4), imshow(mat4), title('Stretchig 4');
