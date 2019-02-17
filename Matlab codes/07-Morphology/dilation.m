function [img] = dilation(mat, radius)

    [h, w] = size(mat);
    img = mat;
    m = max(max(mat));
    
    for i = 1 : h;
        for j = 1 : w;
            dif = false;
            for ki = i-radius : i+radius;
                for kj = j-radius : j+radius;
                    if (~((ki < 1 || kj < 1) || (ki > h || kj > w)))
                        if (mat(ki,kj) ~= 0)
                            dif = true;
                        end
                    end
                end
            end
            if (dif)
                img(i,j) = m;
            else
                img(i,j) = 0;
            end
        end
    end

end

