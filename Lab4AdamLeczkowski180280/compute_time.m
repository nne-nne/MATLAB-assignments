function [value] = compute_time( N )

value = (N^1.43 + N^1.14)/1000;

%w zadaniu badamy dla jakiego N wartość nie przekroczy 5000
value = value - 5000;

end