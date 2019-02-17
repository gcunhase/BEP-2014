function [stretchingImg, stretchingHist, stretchingCdf] = stretchImage(mat, limits)

    [height, width] = size(mat);
    
    min = limits(1); max = limits(2);
    maxGray = mat(1,1); minGray = mat(1,1);
    
    for i = 1 : height;
        for j = 1 : width;
            if (mat(i,j) > maxGray)
                maxGray = mat(i,j);
            end
            if (mat(i,j) < minGray)
                minGray = mat(i,j);
            end
        end
    end

    stretchingImg = mat;
    for i = 1 : height;
        for j = 1 : width;
            stretchingImg(i,j) = min + (max-min)*((double(mat(i,j) - minGray))/(double(maxGray - minGray)));
        end
    end
    
    stretchingHist = getHistogram(stretchingImg);
    stretchingCdf = getCdf(stretchingImg);

end

