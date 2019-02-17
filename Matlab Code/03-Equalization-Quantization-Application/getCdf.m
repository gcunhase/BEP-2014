function [cdf] = getCdf(mat)

    hist = getHistogram(mat);
    
    cdf = ones(1,256);
    cdf(1) = hist(1);

    for i = 2 : 256;
        cdf(i) = hist(i) + cdf(i-1);
    end

end

