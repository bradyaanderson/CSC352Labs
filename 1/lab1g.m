np = 1e7; nd = 10; nl = 4;

tic;
spmd
    if (labindex==1)
        A = randn(np/nl, nd); B = randn(np/nl, nd);
        C= A-B;
        labSend(C,2);
    elseif (labindex==2)
        C = labReceive(1);
        D = C.^2;
        labsend(D,3);
    elseif (labindex==3)
        D = labReceive(2);
        E = sum(D,2);
        labsend(E,4);
    elseif (labindex==4)
        E = labReceive(3);
        F = sqrt(E);
    end
end
t= toc;
d = F{4};