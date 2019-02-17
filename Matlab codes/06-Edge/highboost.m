function [imgHighpass, imgHighboost] = highboost(mat, c)

    [h, w] = size(mat);
    imgHighpass = mat;%zeros(h, w);
    
    kernel_size = 3;
    radius = (kernel_size-1)/2;
    kernelArea = kernel_size*kernel_size;
    
    kernelHighpass = [ 0  -1    0;
                      -1  4  -1;
                       0  -1    0];
    kernelOriginalC = [ 0 0 0;
                        0 c 0;
                        0 0 0];
                   
    for i = 1 : h
        for j = 1 : w
            pixelValue = []; kerneli = 1;
            for ki = i-radius : i+radius
                kernelj = 1;
                for kj = j-radius : j+radius
                    if ((ki < 1 || kj < 1) || (ki > h || kj > w))
                        pixelValue = [pixelValue, 0];
                    else
                        kval = double(kernelHighpass(kerneli,kernelj));
                        matval = double(mat(ki,kj));
                        pixelValue = [pixelValue, kval*matval];
                    end
                    kernelj = kernelj + 1;
                end
                kerneli = kerneli + 1;
            end
            imgHighpass(i,j) = round(abs(sum(pixelValue)/kernelArea));
        end
    end

    imgHighpass = normalize(imgHighpass);
    
    imgHighboost = imgHighpass;
    for i = 1 : h
        for j = 1 : w
            imgHighboost(i,j) = c*mat(i,j)+imgHighpass(i,j);
        end
    end
    
    imgHighboost = normalize(imgHighboost);
    
end

