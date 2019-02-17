function [result] = fft2d(mat, N, M)

    [h, w] = size(mat);
    
	%X
	fftResultNorm = zeros(h, M);
	for i = 1 : h
		arrayInput = mat(i,:);
		fftResult = fft1d(arrayInput, M);
		fftResultNorm(i,:) = abs(fftResult/M);
    end
	%Normalize
	result = normalize(fftResultNorm);

	%Y
	fftResultNormY = zeros(N, M);
	for j = 1 : M
        arrayInput = result(:,j);
		fftResultY = fft1d(arrayInput, N);
		fftResultNormY(:,j) = abs(fftResultY(:)/N);
    end
    
	%Normalize
	result = normalize(fftResultNormY);
    %result = fftResultNormY;

	%Shuffling
	result = shuffle(result, N, M);
    
end

