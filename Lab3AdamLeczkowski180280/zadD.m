% Zadanie D
%------------------
clc
clear all
close all
Index=180280;
N0=0;
N1=mod(N0-1,4)+1;


density = 10;
d = 0.85;
N = [500, 1000, 3000, 6000, 12000];


for i = 1:5
    [Edges] = generate_network(N(i), density);
    I = speye(N(i));
    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    
    L = sparse(sum(B));
    A = sparse(diag(1./L));
    b = zeros(N(i),1);
    b(:,1) = (1 - d)/N(i);
    M = sparse(I - d*B*A);
    
    tic
    r = M\b;
    czas_Gauss(i) = toc;
end

plot(N, czas_Gauss);
title("czas rozwiązywania układu równań metodą bezpośrednią");
xlabel("rozmiar macierzy");
ylabel("czas [s]");
saveas(gcf, 'zadD_180280.png');
%------------------