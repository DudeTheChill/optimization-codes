function [ N ] = FibN( a0, b0, FR, eps )
% This function returns the number of iterations for Fibonacci Search
N = 1;
while(true)
    tmp = (1+2*eps)* (b0-a0) / FR;
    if fib(N+1)>=tmp
        break;
    else
        N = N+1;
    end
end

end

