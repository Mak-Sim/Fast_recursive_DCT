function [y] = dct4_recursive(r, x)
% Computation of skew DCT4(r) using recursive algorithm.
m = length(x)/2;

[t1, t2]= fastDCT_bb(r*pi/2, x(1:m), x(m+1:2*m));
P = eye(2);
x = [t1; t2];
if m~=1    
    x1 = dct4_recursive(r/2,   t1);
    x2 = dct4_recursive(1-r/2, t2);
    x   = [x1; x2];
    P=zeros(2*m, 2*m);
    P(1,1)=1; P(2*m,m)=1;
    row = 2;  col = m+1; sign = -1;
    for i=1:m-1
        P(row,col) = 1;
        row = row+1; col = col+1;
        P(row,col) = 1;
        row = row+1; col = col+sign*m;
        sign= sign*(-1);
    end
end
y = P*x;
end