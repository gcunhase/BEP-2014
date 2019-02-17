%% Settings

filename = 'colorFile';
mat = imread(filename, 'png');


%% RGB

[r, g, b] = getRGB(mat);

figRGB = figure('name','Colors - RGB');
figRGB, subplot(2,2,1), imshow(mat), title('Original'); % subimage(mat)
figRGB, subplot(2,2,2), imshow(r), title('R');
figRGB, subplot(2,2,3), imshow(g), title('G');
figRGB, subplot(2,2,4), imshow(b), title('B');


%% CMYK

[c, m, y, k] = rgb2cmyk(r, g, b);

figCMYK = figure('name','Colors - CMYK');
figCMYK, subplot(2,2,1), imshow(c), title('C');
figCMYK, subplot(2,2,2), imshow(m), title('M');
figCMYK, subplot(2,2,3), imshow(y), title('Y');
figCMYK, subplot(2,2,4), imshow(k), title('K');

%% HSV

[h, s, v] = rgb2hsv(r, g, b);

figHSV = figure('name','Colors - HSV');
figHSV, subplot(2,2,1), imshow(mat), title('Original');
figHSV, subplot(2,2,2), imshow(h), title('H');
figHSV, subplot(2,2,3), imshow(s), title('S');
figHSV, subplot(2,2,4), imshow(v), title('V');
