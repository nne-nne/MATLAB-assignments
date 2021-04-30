clear
Index=180280;
N0=0;
N1=mod(N0-1,4)+1;

% Zadanie A
%------------------
N = 10;
density = 3; % parametr decydujący o gęstosci połączeń między stronami
[Edges] = generate_network(N, density);
%-----------------