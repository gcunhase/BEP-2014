%% Settings
filename = 'images';
if (ismac)
    filename = strcat(filename, '/');
else
    filename = strcat(filename, '\');
end
filename = strcat(filename, 'label3.png');
matRGB = imread(filename);
mat = rgb2gray(matRGB);

%% Grass-Fire
imgFinal1 = grassFire(mat, 4);
img2 = grassFire(mat, 8);

figGrassFire = figure('name','Labeling: Grass-Fire');
figGrassFire, subplot(1,3,1), imshow(mat), title('Original');
figGrassFire, subplot(1,3,2), imshow(imgFinal1), title('4-neighbors');
figGrassFire, subplot(1,3,3), imshow(img2), title('8-neighbors');


%% 2-pass

[imgFinal1, img1] = twoPass4(mat);
figTwoPass = figure('name','Labeling: 2-pass');
figTwoPass, subplot(2,3,1), imshow(mat), title('Original');
figTwoPass, subplot(2,3,2), imshow(img1), title('4-neighbors');
figTwoPass, subplot(2,3,3), imshow(imgFinal1), title('4-neighbors final');

[imgFinal2, img2] = twoPass8(mat);
figTwoPass, subplot(2,3,5), imshow(img2), title('8-neighbors');
figTwoPass, subplot(2,3,6), imshow(imgFinal2), title('8-neighbors final');


