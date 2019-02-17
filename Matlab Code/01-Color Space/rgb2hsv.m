function [matH, matS, matV, hsv] = rgb2hsv(r, g, b)

    r = im2double(r);
    g = im2double(g);
    b = im2double(b);
    
    [height, width, depth] = size(r);
    matH = []; matS = []; matV = [];
    for i = 1 : height;
        hTmp = []; sTmp = []; vTmp = [];
        for j = 1: width;
            R = r(i,j);
            G = g(i,j);
            B = b(i,j);
            M = max(max(R,G),B);
            m = min(min(R,G),B);
            C = M - m;
            
            Htemp = 0;
            if (C ~= 0)
                if (M == R)
                    Htemp = (G-B)/C;
                else
                    if (M == G)
                        Htemp = (B-R)/C + 2;
                    else
                        if (M == B)
                            Htemp = (R-G)/C + 4;
                        end
                    end
                end
            end

            h = Htemp*60;
            if (h < 0)
                h = h+360;
            end
            h = h/(2*255);
            v = M;
            s = 0;
            if (C ~= 0)
                s = C/v;
            end

            hTmp = [hTmp, h];
            sTmp = [sTmp, s];
            vTmp = [vTmp, v];
        end
        matH = [matH; hTmp];
        matS = [matS; sTmp];
        matV = [matV; vTmp];
    end
    hsv = cat(3, matH, matS, matV);
end

