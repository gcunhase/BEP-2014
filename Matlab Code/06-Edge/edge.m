function [img] = edge(mat, kernel_size, type, orientation)

    radius = round((kernel_size-1)/2);
    kernelArea = kernel_size*kernel_size;
    pixelValue = []; kerneli = 1; kernelj = 1;
    kernel = [];
    [h, w] = size(mat);
    img = mat;
    
    switch (type)
        case ('sobel')
            if (orientation == 'x' && kernel_size == 3)
                kernel = [ 1, 2, 1;
                           0, 0, 0;
                          -1, -2, -1];
            else % y
                kernel = [-1, 0, 1;
                          -2, 0, 2;
                          -1, 0, 1];
            end
        case ('prewitt')
            if (orientation == 'x' && kernel_size == 3)
                kernel = [-1, -1, -1;
                           0,  0,  0;
                           1,  1,  1];
            else % y
                kernel = [-1, 0, 1;
                          -1, 0, 1;
                          -1, 0, 1];
            end
        case ('roberts')
            if (orientation == 'x' && kernel_size == 3)
                kernel = [-1, 0, 0;
                           0, 1, 0;
                           0, 0, 0];
            else % y
                kernel = [0, 0, -1;
                          0, 1,  0;
                          0, 0,  0];
            end
        otherwise
            disp('Invalid edge detection type');
    end
    
    %img = convFilter(mat, kernel, kernel_size);
    for i = 1 : h
        for j = 1 : w
            pixelValue = []; kerneli = 1;
            for ki = i-radius : i+radius
                kernelj = 1;
                for kj = j-radius : j+radius
                    if ((ki < 1 || kj < 1) || (ki > h || kj > w))
                        pixelValue = [pixelValue, 0];
                    else
                        kval = double(kernel(kerneli,kernelj));%str2num(num2str(kernel(kerneli,kernelj)));
                        matval = double(mat(ki,kj));%str2num(num2str(mat(ki,kj)));
                        pixelValue = [pixelValue, kval*matval];
                    end
                    kernelj = kernelj + 1;
                end
                kerneli = kerneli + 1;
            end
            img(i,j) = round(abs(sum(pixelValue)/kernelArea));
        end
    end

    img = normalize(img);

end