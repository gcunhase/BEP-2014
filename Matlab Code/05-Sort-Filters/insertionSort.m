function [sortedVec] = insertionSort(vec)

    sortedVec = vec;
    s = max(size(sortedVec));
    for i = 1 : s
         temp = sortedVec(i);
         for j = i-1 : -1 : 1
             if (temp < sortedVec(j))
                sortedVec(j+1) = sortedVec(j);
             else
                 j = j+1;
                 break;
             end
         end
         sortedVec(j) = temp;
    end
    
end

