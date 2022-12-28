function [y1, y2] = fastDCT_bb(a, x1, x2)
%Function implements building block of the fast DCT algorithm.
%  a  -- "rotation" angle
%  x1 -- Upper input
%  x2 -- Lower input
%  y1 -- Upper output
%  y2 -- Lower output

m   = size(x1,1);
J_m = rot90(eye(m));

tmp_1 = x1 - J_m*x2;
tmp_2 = x2*2*cos(a);

y1 = tmp_1 + tmp_2;
y2 = tmp_1 - tmp_2;
end

