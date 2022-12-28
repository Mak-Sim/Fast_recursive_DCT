function [y] = dct2_recursive(x)
% Recursive computation of DCT-2.
    m   = length(x)/2;
    Im  = eye(m);        
    Jm  = rot90(Im); 
    B2m = [Im  Jm;
           Im -Jm];

    x   = B2m*x;
    
    if m==1
        y=x;
    else
        t1 = dct2_recursive(x(1:m));
        t2 = dct4_recursive(1/2, x(m+1:2*m));
        y = zeros(2*m, 1);
        y(1:m) = t1;
        y(m+1:2*m) = t2;
        L_n_2n = stride_perm(2*m, m);
        y = L_n_2n*y;
    end
end

