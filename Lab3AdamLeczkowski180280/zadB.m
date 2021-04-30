zadA;
% Zadanie B
%------------------
d = 0.85;
% generacja macierzy I, A, B i wektora b
I = speye(N);
issparse(I);
B = sparse(Edges(2,:), Edges(1,:), 1, N, N);
issparse(B);
L = sparse(sum(B));
A = sparse(diag(1./L));
issparse(A);
b = zeros(N,1);
b(:,1) = (1 - d)/N;

save zadB_180280 A B I b;
%-----------------