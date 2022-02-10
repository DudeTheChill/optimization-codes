function [ x_min f_min iteration] = SD(f_arg, x00, eps)
%Steepest Descent Algorithm.

%x00 is the initial point.
%eps is error bound.

%initializing counter
iteration = 1;

temp = symvar(f_arg);
n = size(temp,2);
X = sym('x', [1 n]);
syms a;


f_arg = subs(f_arg,temp,X);

%gvf is fradient vector of f(x).
gvf= gradient(f_arg,X);

while true
         
      %%%%This section is for calculating alphak %%%%%
      tmp = x00 - transpose(a*fun_eval(gvf,x00));
      str2 = fun_eval_sym(f_arg,tmp); 
      
      alphie = GSS(str2,0,10,0.0001);
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      
      %Point Update.
      x11 = x00 - transpose(alphie*fun_eval(gvf,x00));
      
      p = norm(abs(x00-x11));
      if p < eps
         break;
      else 
         x00 = x11;
      end
      
      iteration = iteration +1;
      
end

x_min = x00;
f_min = fun_eval(f_arg,x_min);

end

 