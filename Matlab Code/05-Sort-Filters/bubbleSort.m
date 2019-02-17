function [sortedVec] = bubbleSort(vec)

    sortedVec = vec;
    s = max(size(sortedVec));
    change = 1;
    while (change == 1)
         change = 0;
         for j = 1 : s-1
             if (sortedVec(j+1) < sortedVec(j))
                temp = sortedVec(j);
                sortedVec(j) = sortedVec(j+1);
                sortedVec(j+1) = temp;
                change = 1;
             end
         end
    end
    
end

