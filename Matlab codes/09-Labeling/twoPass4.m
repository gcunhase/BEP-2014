function [imgFinal, img] = twoPass4(mat)

    [h, w] = size(mat);
    img = zeros(h, w);
    group = 0;
    groupEquivalence = [];
    
    % On the first pass:
    % Iterate through each element of the data by column, then by row (Raster Scanning)
    % If the element is not the background
    %	 Get the neighboring elements of the current element
    %	 If there are no neighbors, uniquely label the current element and continue
    %	 Otherwise, find the neighbor with the smallest label and assign it to the current element
    %	 Store the equivalence between neighboring labels
    for i = 1 : h
        for j = 1 : w
            if (mat(i,j) ~= 0)
                itmp = i; jtmp = j;
                ileft = -1; jleft = -1;
                itop = -1; jtop = -1;

                % left
                if (jtmp-1 >= 1)
                    if (mat(itmp,jtmp-1) ~= 0)
                        ileft = itmp;
                        jleft = jtmp-1;
                    end
                end
                % top
                if (itmp-1 >= 1)
                    if (mat(itmp-1,jtmp) ~= 0)
                        itop = itmp-1;
                        jtop = jtmp;
                    end
                end

                % Conditions in: http://en.wikipedia.org/wiki/Connected-component_labeling
                if (itop == -1)
                    if (ileft == -1) %no neighbors
                        group = group + 1;
                        img(i,j) = group;
                        groupEquivalence = [groupEquivalence, group];
                    else %only left
                        img(i,j) = img(ileft,jleft);
                    end
                else
                    if (ileft == -1) %only top
                        img(i,j) = img(itop,jtop);
                    else %both neightbors
                        if (img(ileft,jleft) == img(itop,jtop)) %equal
                            img(i,j) = img(ileft,jleft);
                        else %different
                            if (img(ileft,jleft) < img(itop,jtop))
                                img(i,j) = img(ileft,jleft);
                                groupEquivalence(img(itop,jtop)) = img(ileft,jleft);
                            else
                                img(i,j) = img(itop,jtop);
                                groupEquivalence(img(ileft,jleft)) = img(itop,jtop);
                            end
                        end
                    end
                end
            end
        end
    end
    
    for i = 1 : max(size(groupEquivalence));
        for j = 2 : max(size(groupEquivalence))+1;
            if ((groupEquivalence(i) == j) && (groupEquivalence(i) ~= groupEquivalence(j)))
                groupEquivalence(i) = groupEquivalence(j);
            end
        end
    end

    % On the second pass:
    % Iterate through each element of the data by column, then by row
    % If the element is not the background
    %	 Relabel the element with the lowest equivalent label
    imgFinal = img;
    
    for i = 1: h;
        for j = 1 : w;
            if (imgFinal(i,j) > 0)
                imgFinal(i,j) = groupEquivalence(imgFinal(i,j));
            end
        end
    end

    % Show detected classes with colored labels
    img = coloredLabels(img, group);
    imgFinal = coloredLabels(imgFinal, group);

end

