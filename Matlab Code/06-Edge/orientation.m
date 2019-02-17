function [img1, img2, img3, img4] = orientation(mat, kernel_size)

    [h, w] = size(mat);
    img1 = zeros(h, w);
    
    kernel_size = 3;
    edgeX = edge(mat, kernel_size, 'sobel', 'x');
    edgeY = edge(mat, kernel_size, 'sobel', 'y');
    img1 = zeros(h, w);
    img2 = zeros(h, w);
    img3 = zeros(h, w);
    img4 = zeros(h, w);
    
    for i = 1 : h
        for j = 1 : w
            val = atan2(double(edgeY(i,j)), double(edgeX(i,j)));
            if (val < pi/4)
                img1(i,j) = 255;
            else
                if (val < pi/2)
                    img2(i,j) = 255;
                else
                    if (val < 3*pi/4)
                        img3(i,j) = 255;
                    else
                        img4(i,j) = 255;
                    end
                end
            end
        end
    end
    
    img1 = normalize(img1);
    img2 = normalize(img2);
    img3 = normalize(img3);
    img4 = normalize(img4);
end
