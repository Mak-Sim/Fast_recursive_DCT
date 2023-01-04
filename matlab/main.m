%% MATLAB implementation of fast 2^n DCT-2 described in
% Vashkevich, M., & Petrovsky, A. (2012). A low multiplicative 
%  complexity fast recursive DCT-2 algorithm. arXiv preprint arXiv:1203.3442.

%% DCT-2 algorithm
n = 8;  % 8-point
% n = 16; % 16-point

% Let's iteratively generate DCT-2 matrix
N = 1:n;
DCT_2_matrix = zeros(n,n);
for m=1:n
    x = (N==m)';    % shifted delta impulse
    DCT_2_matrix(:,m) = dct2_recursive(x);
end


% Reference DCT-2 matrix
DCT2_ref = zeros(n,n);
for k=0:n-1
    for l=0:n-1
        DCT2_ref(k+1,l+1) = cos((l+1/2)*k*pi/(n));
    end
end


% Scaling diagonal matrix
scaling_diag = diag(cos((0:n-1)*pi/(2*n)));
DCT2 = scaling_diag*DCT_2_matrix;

%% Demo
l = 0:n-1;
Ylabels = cell(1,n);
for k=1:n
    Ylabels(1,k) = {['DCT2[' num2str(k-1) ',l]']};
end

figure('Position',[100 100 800 450]);
subplot(121);
s = stackedplot(l, DCT2_ref', 'Marker','o','DisplayLabels',Ylabels);
s.LineWidth = 1;
s.MarkerEdgeColor = 'b';
s.MarkerFaceColor = 'b';
xlabel('l');   %,'interp','latex'
title('DCT-2 basis (direct computation)');
subplot(122);
s = stackedplot(l, DCT2', 'Marker','o','DisplayLabels',Ylabels);
s.Color = [203 47 57]/255;
s.MarkerEdgeColor = [203 47 57]/255;
s.MarkerFaceColor = [203 47 57]/255;
s.LineWidth = 1;
title('DCT-2 basis (fast transform)');
xlabel('l')

set(gcf, 'PaperPositionMode', 'auto');
print('-dpng', '-opengl','-r250','DCT2_basis');