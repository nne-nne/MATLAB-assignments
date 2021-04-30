% Zadanie G
%------------------
clc
clear all
close all
Index=180280;
N0=0;
N1=mod(N0-1,4)+1;

load("Dane_Filtr_Dielektryczny_lab3_MN.mat");
[m,n] = size(M);
threshold = 10^(-14);

%rozwiązanie metodą bezpośrednią
r = M\b;
save zadG_Gauss_180280 r

%rozwiązanie metodą iteracyjną Jacobi'ego
D = diag(diag(M));
U = triu(M, 1);
L = tril(M, -1);



r = ones(n, 1);
iteration_count_jacobi = 0;


current_residuum_norm = intmax;
    
while(current_residuum_norm > threshold)
    iteration_count_jacobi = iteration_count_jacobi+1;
    r = -D \ ((L + U)*r) + (D\b);
    res = M*r - b;
    current_residuum_norm = norm(res);
    residuum_norm(1, iteration_count_jacobi) = current_residuum_norm;
end
save zadG_Jacobi_180280 r;


%rozwiązanie metodą iteracyjną Gaussa-Seidla
r = ones(n,1);
iteration_count_gauss_seidl = 0;
current_residuum_norm = intmax;
while(current_residuum_norm > threshold)
    iteration_count_gauss_seidl = iteration_count_gauss_seidl+1;
    r = (-(D + L)) \ (U*r) + (D + L)\b;
    res = M*r - b;
    current_residuum_norm = norm(res);
    residuum_norm(1, iteration_count_gauss_seidl) = current_residuum_norm;
end
save zadG_Gauss_Seidl_180280 r;
%------------------