function [value] = minN(mat)
    
    [h, w] = size(mat);
	value = 1;
	while (value < w)
		value = value*2;
    end

end

