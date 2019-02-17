function [img] = reflect(mat, axis)

    [h, w] = size(mat);
    img = zeros(h, w);
         
    for i = 1: h;
        for j = 1 : w;
            newX = i; newY = j;
            if (axis == 'x') % reflect on x-axis    
                newY = w - j;
            else % reflect on y-axis
                newX = h - i;    
            end
            if ((newX <= h) & (newY <= w) & (newX > 0) & (newY > 0))
                img(newX,newY) = mat(i,j);
            end
        end
    end

end

