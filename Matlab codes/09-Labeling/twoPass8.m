function [imgFinal, img] = twoPass8(mat)

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
                ineigh = [-1, -1, -1, -1];
                jneigh = [-1, -1, -1, -1];

                % left (west)
                if (jtmp-1 >= 1)
                    if (mat(itmp,jtmp-1) ~= 0)
                        ineigh(1) = itmp;
                        jneigh(1) = jtmp-1;
                     end
                end
                % top left (northwest)
                if (itmp-1 >= 1 && jtmp-1 >= 1)
                    if (mat(itmp-1,jtmp-1) ~= 0)
                        ineigh(2) = itmp-1;
                        jneigh(2) = jtmp-1;
                     end
                end
                % top (north)
                if (itmp-1 >= 1)
                    if (mat(itmp-1,jtmp) ~= 0)
                        ineigh(3) = itmp-1;
                        jneigh(3) = jtmp;
                    end
                end
                % top right (northeast)
                if (itmp-1 >= 1 && jtmp+1 <= w)
                    if (mat(itmp-1,jtmp+1) ~= 0)
                        ineigh(4) = itmp-1;
                        jneigh(4) = jtmp+1;
                    end
                end
                
                % Conditions
                minValue = -1;
                set = true;
                for k = 1 : 4
                    if (ineigh(k) ~= -1)
                        value = img(ineigh(k),jneigh(k));
                        if (set)
                            set = false;
                            minValue = value;
                        else
                            if (value < minValue)
                                minValue = value;
                            end
                        end
                    end
                end
                
                if (minValue == -1) %no neighbors
                    group = group + 1;
                    img(i,j) = group;
                    groupEquivalence = [groupEquivalence, group];
                else
                    img(i,j) = minValue;
                    for k = 1 : 4
                        if (ineigh(k) ~= -1)
                            value = img(ineigh(k),jneigh(k));
                            img(ineigh(k),jneigh(k)) = minValue;
                            if (value > 0) groupEquivalence(value) = minValue; end
                        end
                    end
                end
            end
        end
    end
    
    for i = 1 : max(size(groupEquivalence))
        for j = 2 : max(size(groupEquivalence))+1
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
    
    for i = 1: h
        for j = 1 : w
            if (imgFinal(i,j) > 0)
                imgFinal(i,j) = groupEquivalence(imgFinal(i,j));
            end
        end
    end

    % Show detected classes with colored labels
    img = coloredLabels(img, group);
    imgFinal = coloredLabels(imgFinal, group);

end

