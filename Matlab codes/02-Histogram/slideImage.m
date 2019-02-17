function [slidingImg, slidingHist, slidingCdf] = slideImage(mat, offset)

    [height, width] = size(mat);
    sliding = 0;
    slidingImg = mat;
    for i = 1 : height;
        for j = 1 : width;
            sliding = mat(i,j) + offset;
            if (sliding < 0)
                sliding = 0;
            else
                if (sliding > 255)
                    sliding = 255;
                end
            end
            slidingImg(i,j) = sliding;
        end
    end
    
    slidingHist = getHistogram(slidingImg);
    slidingCdf = getCdf(slidingImg);

end

