function [img] = normalize(mat, limits)

    if (nargin <= 1), limits = [0 255]; end
    
    [h, w] = size(mat);
    min = double(limits(1)); max = double(limits(2));
    maxGray = mat(1,1); minGray = mat(1,1);
    
    for i = 1 : h
        for j = 1 : w
            if (mat(i,j) > maxGray)
                maxGray = mat(i,j);
            end
            if (mat(i,j) < minGray)
                minGray = mat(i,j);
            end
        end
    end

    img = mat;
    for i = 1 : h
        for j = 1 : w
            img(i,j) = min + (max-min)*((double(mat(i,j) - minGray))/(double(maxGray - minGray)));
        end
    end


end