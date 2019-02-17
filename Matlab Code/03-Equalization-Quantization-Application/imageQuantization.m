function [quantImg, quantHist, quantCdf] = imageQuatization(mat, levels)

    interval = 256/levels;

    [width, height] = size(mat);
    quantImg = mat;
    for i = 1 : width;
        for j = 1: height;
            for t = 0 : levels;
                if (mat(i,j) >= t*interval & mat(i,j) < (t+1)*interval)
                    quantImg(i,j) = (t*interval + (t+1)*interval)/2;
                end
            end
        end
    end

    quantHist = getHistogram(quantImg);
    quantCdf = getCdf(quantImg);

end

