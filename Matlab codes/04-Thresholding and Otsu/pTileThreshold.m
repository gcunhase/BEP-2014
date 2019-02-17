function [img] = pTileThreshold(mat, p)

    [h, w] = size(mat);
    pixels = h*w;
    histogram = getHistogram(mat);
    T = 0;
    
    count = 0;
    threshold = pixels/p;
    for j = 1 : 256
        count = count + histogram(j);
        if (count >= threshold)
            T = j;
            break;
        end
    end

    img = staticThreshold(mat, T);

end

