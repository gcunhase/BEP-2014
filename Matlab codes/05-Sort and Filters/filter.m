function [img] = filter(mat, kernel_size, type, alpha)

    [h, w] = size(mat);
    img = mat;
    radius = round((kernel_size-1)/2); % floor(kernel_size/2)
    kernelArea = kernel_size*kernel_size;
    
    for i = 1 : h
        for j = 1 : w
            pixelValue = [];
            for ki = i-radius : i+radius
                for kj = j-radius : j+radius
                    if (~((ki < 1 || kj < 1) || (ki > h || kj > w)))
                        pixelValue = [pixelValue, mat(ki,kj)];
                    else
                        pixelValue = [pixelValue, 0];
                    end
                end
            end
            
            switch (type)
                case ('average')
                    img(i,j) = round(sum(pixelValue)/kernelArea);
                case ('median')
                    middleIdx = round((kernelArea-1)/2);
                    sortedVec = insertionSort(pixelValue);
                    img(i,j) = sortedVec(middleIdx);
                case ('max')
                    sortedVec = insertionSort(pixelValue);
                    img(i,j) = sortedVec(end);
                case ('min')
                    sortedVec = insertionSort(pixelValue);
                    img(i,j) = sortedVec(1);
                case ('midpoint')
                    sortedVec = insertionSort(pixelValue);
                    first = str2num(num2str(sortedVec(1)));
                    last = str2num(num2str(sortedVec(end)));
                    val = first+last;
                    img(i,j) = round(val/2);
                    %disp(strcat(['1: ', num2str(sortedVec(1)), ', end: ', num2str(sortedVec(end)), ', sum: ', num2str(round(val/2))]));
                case ('alpha-trimmed')
                    sortedVec = insertionSort(pixelValue);
                    if nargin < 4, alpha = 1; end
                    
					elementValue = sum(sortedVec(alpha+1:kernelArea-alpha));
                    N = kernelArea-2*alpha; %all elements from alpha+1 to N-alpha
                    img(i,j) = round(elementValue / N);
                    
                otherwise
                    disp('Invalid filter type');
            end
        end
    end

end

