function [img] = zoomIn(mat, zoomFactor) 
    %Using Nearest Neighbor Interpolation (Replication)

    [h, w] = size(mat);
    img = zeros(h*zoomFactor, w*zoomFactor);
    
	for i = 1 : h;
		for j = 1 : w;
			for ki = 0 : zoomFactor-1;
				for kj = 0: zoomFactor-1;
					img(ki+i*zoomFactor,kj+j*zoomFactor) = mat(i,j);
                end
            end
        end
    end

end

