function [ L_n_m ] = stride_perm( n, m )
%STRIDE_PERM Computes stride permutation matrix for given n and m
L_n_m = zeros(n,n);
for i1=0:n/m-1
    for i2=0:m-1
        i   = i2*(n/m)+i1;
        f_i = i1*m + i2;
        L_n_m(i+1, f_i+1) = 1;
    end
end
end

