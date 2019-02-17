function [img] = closing(mat, radius)

    img = dilation(mat, radius);
    img = erosion(img, radius);

end

