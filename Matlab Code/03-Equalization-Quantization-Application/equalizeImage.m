function [eqImg, eqHist, eqCdf] = equalizeImage(mat)

    [width, height] = size(mat);
    s = width*height;
    alpha = 255/s; %double(256)/s; %scaling factor
    
    %Normalize the histogram so that the sum of histogram bins is 255.
    %Compute the integral of the histogram (cumulative histogram)
    %histogram = getHistogram(mat);
    %LUT = zeros(1,256);
    %LUT(1) = alpha*histogram(1);
    %for i = 2 : 256;
    %    LUT(i) = LUT(i-1) + alpha*histogram(i);
    %end
    cdf = getCdf(mat);
    LUT = alpha*cdf;
    
    %Normalize
    max = LUT(1); min = LUT(1);
    for i = 1 : 256;
        if (max < LUT(i))
            max = LUT(i);
        end
        if (min > LUT(i))
            min = LUT(i);
        end
    end
    
    for i = 1 : 256;
        LUT(i) = 0 + (255 - 0)*(LUT(i) - min)/(max-min);
    end
        
    %Map the levels to the new picture (look up table)
    eqImg = mat;
    for i = 1 : width;
        for j = 1 : height;
            eqImg(i,j) = LUT(mat(i,j)+1);
        end
    end
    
	eqHist = getHistogram(eqImg);
    eqCdf = getCdf(eqImg);

end