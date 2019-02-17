function [c, m, y, k, cmyk] = rgb2cmyk(r, g, b)
    % Source: http://mathforum.org/kb/message.jspa?messageID=7668792
    r = im2double(r);
    g = im2double(g);
    b = im2double(b);
 
    k = 1-max(max(r,g),b);
    c = 1-r;
    m = 1-g;
    y = 1-b;
    cmyk = cat(3, c, m, y);
    
end

