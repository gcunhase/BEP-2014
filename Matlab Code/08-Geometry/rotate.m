function [img] = rotate(mat, theta)

    [h, w] = size(mat);
	img = zeros(h, w);
    x0 = round(h/2);
    y0 = round(w/2);

	 for i = 1 : h;
		 for j = 1 : w;
			x2 = round(abs(cos(theta)*(i-x0) - sin(theta)*(j-y0) + x0));
			y2 = round(abs(sin(theta)*(i-x0) + cos(theta)*(j-y0) + y0));
			if ((x2 <= h) & (y2 <= w) & (x2 > 0) & (y2 > 0))
				img(x2,y2) = mat(i,j);
            end
         end
     end

end

