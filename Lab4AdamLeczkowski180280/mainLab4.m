clc
clear all
close all
index = 180280;
N0 = 0;
N1 = mod(N0-1,4)+1;

%problem1
a = 1;   
b = 60000;
eps = 1e-3;
%bisect
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_time);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p1xb = figure('Name','Problem 1 x bisekcja','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia liczby parametrów metodą bisekcji");
xlabel("numer iteracji");
ylabel("liczba parametrów");
print -dpng p1xb.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p1db = figure('Name','Problem 1 xdif bisekcja','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności liczby parametrów metodą bisekcji");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami liczby parametrów");
print -dpng p1db.png

%secant
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_time);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p1xs = figure('Name','Problem 1 x sieczne','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia liczby parametrów metodą siecznych");
xlabel("numer iteracji");
ylabel("liczba parametrów");
print -dpng p1xs.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p1ds = figure('Name','Problem 1 xdif sieczne','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności liczby parametrów metodą siecznych");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami liczby parametrów");
print -dpng p1ds.png

%problem2
a = 0;   
b = 50;
eps = 1e-12;
%bisect
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_impedance);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p2xb = figure('Name','Problem 2 x bisekcja','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia ω metodą bisekcji");
xlabel("numer iteracji");
ylabel("ω[rad/s]");
print -dpng p2xb.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p2db = figure('Name','Problem 2 xdif bisekcja','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności ω metodą bisekcji");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami ω[rad/s]");
print -dpng p2db.png

%secant
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_impedance);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p2xs = figure('Name','Problem 2 x sieczne','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia ω metodą siecznych");
xlabel("numer iteracji");
ylabel("ω[rad/s]");
print -dpng p2xs.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p2ds = figure('Name','Problem 2 xdif sieczne','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności ω metodą siecznych");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami ω[rad/s]");
print -dpng p2ds.png

%problem3
a = 0;   
b = 50;
eps = 1e-12;
%bisect
[xvect, xdif, fx, it_cnt] = bisect(a,b,eps,@compute_velocity);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p3xb = figure('Name','Problem 3 x bisekcja','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia t[s] metodą bisekcji");
xlabel("numer iteracji");
ylabel("t[s]");
print -dpng p3xb.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p3db = figure('Name','Problem 3 xdif bisekcja','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności t[s] metodą bisekcji");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami t[s]");
print -dpng p3db.png

%secant
[xvect, xdif, fx, it_cnt] = secant(a,b,eps,@compute_velocity);

%wartość kolejnego przybliżenia w zależności od numeru iteracji
p3xs = figure('Name','Problem 3 x sieczne','NumberTitle','off');
plot(1:it_cnt,xvect)
title("kolejne przybliżenia t[s] metodą siecznych");
xlabel("numer iteracji");
ylabel("t[s]");
print -dpng p3xs.png

%różnica pomiędzy wartościami x w kolejnych iteracjach
p3ds = figure('Name','Problem 3 xdif sieczne','NumberTitle','off');
semilogy(1:it_cnt-1,xdif)
title("tempo zbieżności t[s] metodą siecznych");
xlabel("numer iteracji");
ylabel("różnica między kolejnymi przybliżeniami t[s]");
print -dpng p3ds.png

%zad3
options = optimset('Display', 'iter');
fzero(@tan, 6, options);
fzero(@tan, 4.5, options);
