% Zadanie E
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
threshold = 10^-14;


for i = 1:5
    [Edges] = generate_network(N(i), density);
    I = speye(N(i));
    B = sparse(Edges(2,:), Edges(1,:), 1, N(i), N(i));
    L = sparse(sum(B));
    A = sparse(diag(1./L));
    b = zeros(N(i),1);
    b(:,1) = (1 - d)/N(i);
    M = sparse(I - d*B*A);
    L = tril(M,-1);
    U = triu(M,1);
    D = diag(diag(M));
    r = ones(N(i),1);
    
    iteration_count(i) = 0;
    current_residuum_norm = intmax;
    
    tic
        while(current_residuum_norm > threshold)
            iteration_count(i) = iteration_count(i)+1;
            r = -D \ ((L + U)*r) + (D\b);
            res = M*r - b;
            current_residuum_norm = norm(res);
            residuum_norm(i, iteration_count(i)) = current_residuum_norm;
        end
    czas_Jacobi(i) = toc;
end

plot(N, czas_Jacobi)
title("czas rozwiązywania układu równań metodą Jacobi'ego");
xlabel("rozmiar macierzy");
ylabel("czas [s]");
saveas(gcf, 'zadE_180280_1.png');

plot(N, iteration_count)
title("liczba iteracji przy metodzie Jacobi'ego");
xlabel("rozmiar macierzy");
ylabel("liczba iteracji");
saveas(gcf, 'zadE_180280_2.png');

semilogy(residuum_norm(2, 1:iteration_count(2)));
title('norma residuum kolejnych iteracji dla N = 1000')
xlabel("numer iteracji");
ylabel("norma residuum");
saveas(gcf, 'zadE_180280_3.png');
%------------------