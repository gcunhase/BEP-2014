function [img] = opening(mat, radius)

    img = erosion(mat, radius);
    img = dilation(img, radius);

end

