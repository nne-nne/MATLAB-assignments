function [value] = compute_impedance( omega )

R = 725;
C = 8e-5;
L = 2;

t1 = 1/(omega * L);
t2 = (omega * C - t1)^2;
t3 = 1/(R^2);
value = 1/sqrt(t3 + t2);

%w zadaniu badamy, dla jakiej częstotliwości kątowej 
%moduł impedancji wyniesie 75Ohm
value = value - 75;
end
