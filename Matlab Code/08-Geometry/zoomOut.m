function [img] = zoomOut(mat, zoomFactor)

    [hmat, wmat] = size(mat);
    img = zeros(floor(hmat/zoomFactor), floor(wmat/zoomFactor));
    
    [h, w] = size(img);
    
	 for i = 1 : h;
		for j = 1 : w;
			for ki = 0 : zoomFactor-1;
				for kj = 0 : zoomFactor-1;
                    newi = ki+(i-1)*zoomFactor;
                    newj = kj+(j-1)*zoomFactor;
                    if (~((newi < 1 || newj < 1) || (newi > hmat || newj > wmat)))
                        img(i,j) = mat(newi, newj);
                    end
                end
            end
        end
     end

end

