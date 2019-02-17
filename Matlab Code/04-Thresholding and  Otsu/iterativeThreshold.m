function [img, T] = iterativeThreshold(mat)
    
    [h, w] = size(mat);
    error = 0.1; previousT = error+1;
    total = h*w;
    sumTotal = sum(sum(mat));
    T = round(sumTotal/total);
    
    hist = getHistogram(mat);
        
    while(abs(T-previousT) > error)

        previousT = T;

        mu1 = 0; mu2 = 0; cont1 = 0; cont2 = 0;
        i = (1:round(T-1));
        mu1 = sum((i-1).*hist(i(1):i(end)));
        cont1 = sum(hist(1:round(T-1)));
        
        i = (round(T):256);
        mu2 = sum((i-1).*hist(i(1):i(end)));
        cont2 = sum(hist(round(T):256));
        
        mu1 = mu1/cont1;
        mu2 = mu2/cont2;

        T = (mu1+mu2)/2;
        
    end
    
    T = round(T);
    img = staticThreshold(mat, T);

end

