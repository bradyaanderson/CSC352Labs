function [t] = lab1a(np,nd)
if (nargin < 1), np = 1e7; nd = 10; end
A = randn(np, nd); B = randn(np, nd);
c = zeros(np, 1);
tic;
for i = 1:np
    for j = 1:nd
        c(i) = c(i) + (B(i,1)-A(i,j)).^2;
    end
    c(i) = sqrt(c(i));
end
t = toc;