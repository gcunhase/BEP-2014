function [img] = convFilter(mat, kernel, kernel_size)

    [h, w] = size(mat);
    radius = round((kernel_size-1)/2);
    kernelArea = kernel_size*kernel_size;
    
    for i = 1 : h
        for j = 1 : w
            pixelValue = []; kerneli = 1;
            for ki = i-radius : i+radius
                kernelj = 1;
                for kj = j-radius : j+radius
                    if ((ki < 1 || kj < 1) || (ki > h || kj > w))
                        pixelValue = [pixelValue, 0];
                    else
                        kval = double(kernel(kerneli,kernelj)); %str2num(num2str(kernel(kerneli,kernelj)));
                        matval = double(mat(ki,kj)); %str2num(num2str(mat(ki,kj)));
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

