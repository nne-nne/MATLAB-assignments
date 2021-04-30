function [xvect,xdif,fx,it_cnt]=secant(a,b,eps,fun)
it_cnt = 0;
while true
    it_cnt = it_cnt + 1;
    v = feval(fun, b);
    x = b - (v*(b-a))/(v - feval(fun, a));
    xvect(it_cnt) = x;
    fx(it_cnt) = feval(fun, x);
    if(abs(v) < eps || abs(a-b) < eps)
        for i = 2:it_cnt 
            xdif(i-1) = abs(xvect(i)-xvect(i-1));
        end
        return;
    else
        a = b;
        b = x;    
    end
end
end