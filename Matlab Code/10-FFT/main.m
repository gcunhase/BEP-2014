%% Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'img.png');
matRGB = imread(filename);
mat = mat2gray(matRGB);
mat = rgb2gray(mat);

%% FFT - Custom

N = minN(mat);
M = minM(mat);
imgFFT = fft2d(mat, N, M);

figFFT = figure('name','FFT');
figFFT, subplot(1,3,1), imshow(mat), title('Original');
figFFT, subplot(1,3,2), imshow(imgFFT), title('Custom');

%% FFT - Matlab

%[h, w] = size(mat);
%img1 = [];
%for i = 1 : h
%   img1 = [img1; abs(fft(mat(i, :), M))/M]; 
%end
%
%img = [];
%for j = 1 : M
%   img = [img, abs(fft(img1(:, j), N))/N]; 
%end

img = abs(fft2(mat, N, M))/(N*M);
img = normalize(img);
img = shuffle(img, N, M);

figFFT, subplot(1,3,3), imshow(img), title('Matlab');
