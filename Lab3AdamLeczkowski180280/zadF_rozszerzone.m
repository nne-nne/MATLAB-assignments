% Zadanie F
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
            r = (-(D + L)) \ (U*r) + (D + L)\b;
            res = M*r - b;
            current_residuum_norm = norm(res);
            residuum_norm(i, iteration_count(i)) = current_residuum_norm;
        end
    czas_Gauss_Seidl(i) = toc;
    
    %część odpowiadająca za zadanie różnicujące 
    Mfull = full(M);
    Lfull = full(L);
    Ufull = full(U);
    Dfull = full(D);
    rf = ones(N(i),1);
    iteration_count_full(i) = 0;
    current_residuum_norm = 10; % placeholder value
     %uznałem, że zapisywanie wyników też trzeba uwzględnić,
     %tak samo licznik iteracji. Wyniki nie będą używane(rzecz jasna będą
     %identyczne jak wyżej), ale są to operacje, które należy uwzględnić
     %przy porównywaniu czasów
     
     tic
        while(current_residuum_norm > threshold)
            iteration_count_full(i) = iteration_count_full(i)+1;
            rf = (-(Dfull + Lfull)) \ (Ufull*rf) + (Dfull + Lfull)\b;
            res = Mfull*rf - b;
            current_residuum_norm = norm(res);
            residuum_norm(i, iteration_count(i)) = current_residuum_norm;
        end
    czas_Gauss_Seidl_full(i) = toc;
    
    iloraz_czasow(i) = czas_Gauss_Seidl_full(i) / czas_Gauss_Seidl(i)
end

plot(N, czas_Gauss_Seidl)
title("czas rozwiązywania układu równań metodą Gaussa-Seidla");
xlabel("rozmiar macierzy");
ylabel("czas [s]");
saveas(gcf, 'zadF_180280_1.png');

plot(N, iteration_count)
title("liczba iteracji przy metodzie Gaussa-Seidla");
xlabel("rozmiar macierzy");
ylabel("liczba iteracji");
saveas(gcf, 'zadF_180280_2.png');

plot(N, iloraz_czasow)
title("stosunek czasu wykonywania algorytmu przy macierzach pełnych i rzadkich");
xlabel("rozmiar macierzy");
ylabel("czas przy macierzach pełnych / czas przy macierzach rzadkich");
saveas(gcf, 'zadF_180280_3.png');

semilogy(residuum_norm(2, 1:iteration_count(2)));
title('norma residuum kolejnych iteracji dla N = 1000')
xlabel("numer iteracji");
ylabel("norma residuum");
saveas(gcf, 'zadF_180280_4.png');
%------------------
