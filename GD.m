function [ x_min f_min iteration ] = GD(f_arg, x00, alpha, eps)
%Gradient Descent Algorithm

%x00 is the initial point.
%alpha is a fixed value for step size.
%eps is error bound.


%initializing counter
iteration = 1;


temp = symvar(f_arg);
n = size(temp,2);
X = sym('x', [1 n]);
f_arg = subs(f_arg,temp,X);

%gvf is fradient vector of f(x).
gvf= gradient(f_arg,X);


while true
      
    
      g = transpose(fun_eval(gvf,x00));           
      
      %point update
      x11 = x00 - alpha*g;
      
      
      p = norm(x00-x11);
      if p < eps
         break;
      else 
         x00 = x11;
      end
      
      
      iteration = iteration + 1;
      
      
end

x_min = x00;
f_min = fun_eval(f_arg,x_min);

end

 