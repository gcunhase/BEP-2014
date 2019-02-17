function [imgFinal] = coloredLabels(img, group)

    [h, w] = size(img);
    imgFinal = zeros(h, w, 3);
    groupArray = [];
    for i = 1 : group
        p = [0, 0, 0];
        if (i ~= 0)
            p = [rand(), rand(), rand()];
        end
        groupArray = [groupArray; p];
    end

    for i = 1 : h
        for j = 1 : w
            idx = img(i,j);
            if (idx ~= 0 && idx <= group)
                imgFinal(i,j,1) = groupArray(idx,1);
                imgFinal(i,j,2) = groupArray(idx,2);
                imgFinal(i,j,3) = groupArray(idx,3);
            end
        end
    end

end

