function [histogram] = getHistogram(mat)

    histogram = zeros(1,256);
    
    [height, width] = size(mat);
    for i = 1 : height;
        for j = 1 : width;
            idx = mat(i,j)+1;
            histogram(idx) = histogram(idx) + 1;
        end
    end
    
end

