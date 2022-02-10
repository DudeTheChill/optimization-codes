function [ value ] = fun_eval_sym( f_exp,point )
%f_exp: function expression, that we wish to evaluate.
%n, dimensionality of f

tmp = symvar(f_exp);
n = size(tmp,2);
X = sym('x',[1 n]);
f = f_exp;

value = vpa(subs(f,X,point));


end

