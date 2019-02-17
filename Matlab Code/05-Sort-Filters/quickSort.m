function [sortedVec] = quickSort(vec, inivet, endvet)
    
    sortedVec = vec;
    i = inivet;
    j = endvet;
    
    pivo = sortedVec(round((inivet+endvet)/2));
    
    while(i < j)
        while (sortedVec(i) < pivo)
            i = i + 1;
        end
        while (sortedVec(j) > pivo)
            j = j - 1;
        end
        if (i <= j)
            aux = sortedVec(i);
            sortedVec(i) = sortedVec(j);
            sortedVec(j) = aux;
            i = i + 1;
            j = j - 1;
        end
    end
    
    if (j > inivet)
        sortedVec = quickSort(sortedVec, inivet, j);
    end
    if (i < endvet)
        sortedVec = quickSort(sortedVec, inivet, j);
    end
end

