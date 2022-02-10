function [x_min f_min iteration] = newtons_method( f_exp,x_0,eps )

% Newton's search method for optimization of a one dimensional function f(x).
% This functions returns a local minimizer for f(x)
% f_exp is the function f(x) expression.
% x_0 is the starting point.
% eps is epsilon, the final required accuracy.


iteration = 1;

tmp = symvar(f_exp);
n = size(tmp,2);
X = sym('x',[1 n]);

for i=1:n
    f_exp = subs(f_exp,tmp(i),X(i));
end


fdf = jacobian(f_exp,X);

sdf = hessian(f_exp,X);

x_1 = x_0 - (fun_eval(fdf,x_0)/fun_eval(sdf,x_0));    

while iteration <2 % Termination Condition
    x_0 =x_1;
    x_1 = x_0 - (fun_eval(fdf,x_0)/fun_eval(sdf,x_0));  % x_1 = x_0 - f'(x_0)/f"(x_0)   
    
    iteration = iteration + 1;
end
x_min = x_1;

f_min = fun_eval(f_exp,x_min);


end

