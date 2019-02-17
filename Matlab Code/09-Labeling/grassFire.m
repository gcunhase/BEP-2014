function [img] = grassFire(mat, neighbors)

    [h, w] = size(mat);
    img = zeros(h, w);

    group = 0;
    stack = java.util.Stack();
    for i = 1 : h
        for j = 1 : w
            if (mat(i,j) ~= 0 && img(i,j) == 0)
                group = group + 1;
                stack.push([i, j, group]);
                while (~stack.isEmpty())
                    pos = stack.pop();
                    itmp = pos(1);
                    jtmp = pos(2);
                    img(itmp,jtmp) = group;

                    if (neighbors == 4)
                        if (itmp-1 >= 1)
                            if (img(itmp-1,jtmp) == 0 && mat(itmp-1,jtmp) ~= 0) stack.push([itmp-1, jtmp, group]); end
                        end
                        if (itmp+1 <= h)
                            if (img(itmp+1,jtmp) == 0 && mat(itmp+1,jtmp) ~= 0) stack.push([itmp+1, jtmp, group]); end
                        end
                        if (jtmp-1 >= 1)
                            if (img(itmp,jtmp-1) == 0 && mat(itmp,jtmp-1) ~= 0) stack.push([itmp, jtmp-1, group]); end
                        end
                        if (jtmp+1 <= w)
                            if (img(itmp,jtmp+1) == 0 && mat(itmp,jtmp+1) ~= 0) stack.push([itmp, jtmp+1, group]); end
                        end
                    else % assume neighbors is 8
                        for itmp = pos(1)-1 : pos(1)+1
                            for jtmp = pos(2)-1 : pos(2)+1
                                if ((itmp >= 1) && (itmp <= h) && (jtmp >= 1) && (jtmp <= w))
                                    if ((img(itmp,jtmp) == 0) && (mat(itmp,jtmp) ~= 0))
                                        stack.push([itmp, jtmp, group]);
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    % Show detected classes with colored labels
    img = coloredLabels(img, group);		

end

