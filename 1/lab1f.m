%function [d, t] = lab1f(np,nd)
%if (nargin < 1), np = 1e6; nd = 2; end
np = 1e6; nd = 2; 
hp = gcp('nocreate');
if isempty(hp), hp = parpool(4); end
aA = randn(np, nd); aB = randn(np,nd);
dA = distributed(aA); dB = distributed(aB);
d = zeros(np,1);
tic;
dc = sqrt(sum((aA-aB).^2,2));
d = gather(dc);
t = toc;