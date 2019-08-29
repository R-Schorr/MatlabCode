function[u] = solution_vector( t, X , Y ,N , M)
u = zeros(size(X));

    for n=1:N
        for m=1:M

            lambda = (n*pi)^2 + (m*pi)^2 - pi^2;
        
            Bnm = 4*(1/(n*pi)-cos(3/4*n*pi)/(n*pi))*(sin(m*pi)/(m*pi)-sin(m*pi/4)/(m*pi));
        
            u = u + Bnm*cos(n*pi*X).*sin(m*pi*Y)*exp(-sqrt(lambda)*t);
        end
    
    end

end
    

