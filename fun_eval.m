function [ value ] = fun_eval( f_exp,point )
%f_exp: function expression, that we wish to evaluate.
%n, dimensionality of f

tmp = symvar(f_exp);
n = size(tmp,2);
X = sym('x',[1 n]);
f = f_exp;
[m n] = size(f);
value = zeros(m,n);

for i=1:m
    for j=1:n
        value(i,j) = double(subs(f(i,j),X,point));
    end
end
end

