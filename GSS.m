function [ x_min f_min  iteration ] = GSS(f_arg,a0,b0,FR)
%Golden Section Search Function
%f_arg, function handler
%FR is the final range

N = gssn(a0,b0,FR);
rho = 0.382;

tmp = symvar(f_arg);
n = size(tmp,2);
X = sym('x', [1 n]);


for i=1:n
    f_arg = subs(f_arg,tmp(i),X(i));
end


a1 = a0 + 0.382*(b0-a0);
b1 = a0 + 0.61803*(b0-a0);

fa = fun_eval(f_arg,a1);
fb = fun_eval(f_arg,b1);
for i=1:N
    if fa <= fb
        b0 = b1;
        b1 = a1;
        fb = fa;
        a1 = a0 + rho*(b0-a0);
        fa = fun_eval(f_arg,a1);
    else 
        a0 = a1;
        a1 = b1;
        fa = fb;
        b1 = a0 + (1-rho)*(b0-a0);
        fb = fun_eval(f_arg,b1);
    end
end
if fa <= fb
    af = a0;
    bf = b1;
else
    af = a1;
    bf = b0;
end
x_min = (af+bf)/2;
f_min = fun_eval(f_arg,x_min);
iteration = N;
end

