function [value] = minM(mat)
    
    [h, w] = size(mat);
	value = 1;
	while (value < h)
		value = value*2;
    end

end

