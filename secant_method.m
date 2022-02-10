function [ x1 x2  ] = secant_method(str, x0, x1, eps,n )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

syms f(x) fdf(x);

f(x) = str;

%fdf(x) = jacobian(f(x));
fdf(x) = str;



      x1 = x0 - (double(fdf(x1))*x0-x1*double(fdf(x0)))/(double(fdf(x1))-double(fdf(x0)));
      x2 = x1 - (double(fdf(x1))*x0-x1*double(fdf(x0)))/(double(fdf(x1))-double(fdf(x0)));
      

%minimum = double(fdf(x1));

end

