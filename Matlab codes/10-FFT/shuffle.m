function [result] = shuffle(result, N, M)

    [h, w] = size(result);
	resultTmp = result;
	for i = 1 : N
		for j = 1 : M
			if (i < N/2 && j < M/2) %A
				if (N/2+i <= h && M/2+j <= w)
                    result(i, j) = resultTmp(round(N/2+i), round(M/2+j));
                end
            else
                if (i < N/2 && j >= M/2) %B
                    if (N/2+i <= h && j-M/2 >= 1)
                        result(i, j) = resultTmp(round(N/2+i), round(j-M/2));
                    end
                else
                    if (i >= N/2 && j < M/2) %C
                        if (i-N/2 >= 1 && M/2+j <= w)
                            result(i, j) = resultTmp(round(i-N/2), round(M/2+j));
                        end
                    else %D
                        if (i-N/2 >= 1 && j-M/2 >= 1)
                            result(i, j) = resultTmp(round(i-N/2), round(j-M/2));
                        end
                    end
                end
            end
        end
    end

end

