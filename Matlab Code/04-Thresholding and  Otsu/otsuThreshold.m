function [img, T] = otsuThreshold(mat)

    [h, w] = size(mat);
    total = h*w;
    
    % Custom: http://en.wikipedia.org/wiki/Otsu's_method
    % Compute histogram and probabilities of each intensity level
    histogram = getHistogram(mat);
    probabilities = histogram/double(total);
    
    sigma_squared = 0; T = 0;

    % Step through all possible thresholds t = 1 ... max intensity
    for t = 1 : 256

        % Initializing variables
        omega_0 = 0.0; mu_0 = 0.0; omega_1 = 0.0; mu_1 = 0.0;

        % omega
        omega_0 = sum(probabilities(1:t-1));
        omega_1 = 1.0 - omega_0;
        
        % mu
        for i = 1 : t-1
            if (omega_0 == 0.0)
                mu_0 = mu_0 + probabilities(i)*(i-1);
            else
                mu_0 = mu_0 + probabilities(i)*(i-1)/omega_0;
            end
        end
        
        for i = t : 256
            if (omega_1 == 0.0)
                mu_1 = mu_1 + probabilities(i)*(i-1);
            else
                mu_1 = mu_1 + probabilities(i)*(i-1)/omega_1;
            end
        end
        
        % sigma^2
        sigma_squared_current = omega_0*omega_1*((mu_1-mu_0)^2);

        if (sigma_squared < sigma_squared_current)
            sigma_squared = sigma_squared_current;
            T = t;
        end
    end
    
    img = staticThreshold(mat, T);

end

