function [ minimizer ] = FibSearch( str, a0, b0, FR, eps )
% This function returns a minimizer of function f(x) between numbers
%[a0,b0], with the precision of eps and final range of FR.

% The function is f(a) a stands for alpha, wich is the step size of
%Steepest Descent(SD) optimizations alorithm, this function returns the alphak
%for the kth step in SD.


%str is the given function expression, with the variable,a.


syms f(a); % Defining the abstract function f(a)

f(a) =  str; % Assigning the funstion to f(a)

N = FibN(a0, b0, FR, eps); % Finding the number of iterations

rho = 1- (fib(N) / fib(N+1)); % Value for rho for first iteration
a1 = a0 + rho*(b0-a0);
b1 = a0 + (1-rho)*(b0-a0);
fa = double(f(a1));
fb = double(f(b1));

for i=1:N
    if fa <= fb
        b0 = b1;
        b1 = a1;
        fb = fa;
        f1 = fib(N-i+1);
        f2 = fib(N-i+2);
        rho = 1 - (f1/f2);
        a1 = a0 + rho*(b0-a0);
        fa = double(f(a1));
    else
        a0 = a1;
        a1 = b1;
        fa = fb;
        f1 = fib(N-i+1);
        f2 = fib(N-i+2);
        rho = 1 - (f1/f2);
        b1 = a0 + (1-rho)*(b0-a0);
        fb = double(f(b1));
    end  
end    
        
if fa <= fb
    af = a0;
    bf = b1;
else
    af = a1;
    bf = b0;
end
minimizer = (af+bf)/2;    % Returning the minimum of the function f(x).
end

