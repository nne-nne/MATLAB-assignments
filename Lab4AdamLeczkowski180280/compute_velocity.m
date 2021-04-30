function [value] = compute_velocity( t )

g = 3.7; % zadanie różnicujące - marsjańskie przyspieszenie grawitacyjne
m0 = 150000;
q = 2700;
u = 2000;

value = u*log(m0/(m0-q*t)) - g*t;

%w zadaniu szukamy v = 750m/s
value = value - 750;

end