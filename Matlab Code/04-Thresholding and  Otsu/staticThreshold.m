function [img] = staticThreshold(mat, T)

    [h, w] = size(mat);
    img = mat;
    for i = 1 : h;
        for j = 1 : w;
            if (mat(i,j) > T)
                img(i,j) = 255;
            else
                img(i,j) = 0;
            end
        end
    end

end

