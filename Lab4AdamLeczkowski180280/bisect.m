function [xvect,xdif,fx,it_cnt]=bisect(a,b,eps,fun)
it_cnt = 0;
while true
    it_cnt = it_cnt + 1;
    x = (a + b)/2;
    xvect(it_cnt) = x;
    fx(it_cnt) = feval(fun, x);
    if(abs(fx(it_cnt)) < eps || abs(a-b) < eps)
        for i = 2:it_cnt 
            xdif(i-1) = abs(xvect(i)-xvect(i-1));
        end
        return;
    elseif (feval(fun, x) * feval(fun, b) < 0)
        a = x;
    else
        b = x;    
    end
end
end
