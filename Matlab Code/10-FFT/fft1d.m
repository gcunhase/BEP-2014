function [result] = fft1d(arrayInput, N)
    sizeArray = max(size(arrayInput));
    
	result = zeros(1,N);
	even = zeros(1,N/2);
	odd = zeros(1,N/2);      
	f = [];
    
    if (N > sizeArray) %Zero Padding
        for i = 1 : N
            if (i <= sizeArray) f = [f, arrayInput(i)];
            else f = [f, 0];
            end
        end
    else %Trimming or equal
        f = arrayInput(1:N);
    end

    % Base Case
    if (N == 2)
        result(1) = f(1) + f(2) * exp(-2 * pi * 0 / N);
        result(2) = f(1) + f(2) * exp(-2 * pi * 1 / N);
        return;
    end
    
    % Recursion
    for i = 1 : N
        if (mod(i, 2) == 0)
            even(1+round(i/2)) = f(i);
        else
            odd(round(1+(i-1)/2)) = f(i);
        end
    end
    
    evenResult = fft1d(even, N / 2);
    oddResult = fft1d(odd, N / 2);

    for i = 1 : N / 2
        result(i) = evenResult(i) + oddResult(i) * exp(-2 * pi * (i-1) / N);
    end
    
    for i = 1 : N / 2
        result(round(i + N / 2)) = oddResult(i) + evenResult(i) * exp(-2 * pi * (round(i-1 + N / 2)) / N);
    end
    
    return;
    
end

